import * as adu from "../bld/antenna_design_utils";
import * as d3f from "d3-format";

let f3 = d3f.format(".3s");

describe("antenna design util", () => {
  it("calculate the effective radius", () => {
    expect(adu.calculateEffectiveRadius(0.035e-3, 1e-3)).toBe(0.25225e-3);
  });

  it("should calculate the radiation resistance according to Microchip AN831", () => {
    expect(f3(adu.calculateRadiationResistance(34e-3 * 12e-3, 434e6))).toBe("22.8m");
  });

  it("should calculate the radiation resistance according to Silicon Labs AN639", () => {
    expect(f3(adu.calculateRadiationResistance(40e-3 * 25e-3, 434e6, 0.82, 3e8))).toBe("302m");
  });

  it("should calculate the trace resistance according to Microchip AN831", () => {
    expect(f3(adu.calculateTraceResistance(2 * (34e-3 + 12e-3), 2 * 1e-3, 434e6, 5.7e7))).toBe("252m");
  });

  it("should calculate the trace resistance according to Silicon Labs AN639", () => {
    expect(f3(adu.calculateTraceResistance(2 * (40e-3 + 25e-3), 2 * 1e-3, 434e6, 5.8e7))).toBe("353m");
  });

  it("should calculate the inductance", () => {
    expect(d3f.format(".4s")(adu.calculateInductance(10, 10, 0.01, 0.01))).toBe("55.53µ");
  });

  it("should calculate the same inductance rotating the rectangle by 90 degrees", () => {
    expect(adu.calculateInductance(5, 10, 0.01, 0.01)).toEqual(adu.calculateInductance(10, 5, 0.01, 0.01));
  });

  it("should calculate an inductance that is within 5% of other methods (Microchip AN831)", () => {
    expect(Math.abs(adu.calculateInductance(34e-3, 12e-3, 0.035e-3, 1e-3) / 65.67e-9 - 1)).toBeLessThan(0.05);
  });

  it("should calculate an inductance that is within 5% of other methods (Silicon Labs AN639)", () => {
    expect(Math.abs(adu.calculateInductance(40e-3, 25e-3, 0.035e-3, 1e-3) / 102.64e-9 - 1)).toBeLessThan(0.05);
  });

  it("should calculate the required capacitance", () => {
    expect(f3(adu.calculateCapacitance(102.64e-9, 434e6))).toEqual("1.31p");
  });

  it("should calculate the secondary loop length", () => {
    expect(f3(adu.calculateSecondaryLoopLength(434e6, 0.275, 1000))).toBe("13.8m");
  });

  it("should calculate the equivalent series resistance", () => {
    expect(f3(adu.calculateEquivalentSeriesResistance(1.31e-12, 434e6, 350))).toBe("800m");
  });
});
