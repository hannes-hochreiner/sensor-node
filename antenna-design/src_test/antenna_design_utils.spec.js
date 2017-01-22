import * as adu from "../bld/antenna_design_utils";

describe("antenna design util", () => {
  it("calculate the effective radius", () => {
    expect(adu.calculateEffectiveRadius(0.035e-3, 1e-3)).toBe(0.25225e-3);
  });

  it("should calculate the radiation resistance according to Microchip AN831", () => {
    expect(Math.round(adu.calculateRadiationResistance(34e-3 * 12e-3, 434e6) * 1e4) / 1e4).toBe(0.0228);
  });

  it("should calculate the radiation resistance according to Silicon Labs AN639", () => {
    expect(Math.round(adu.calculateRadiationResistance(40e-3 * 25e-3, 434e6, 0.82, 3e8) * 1e3) / 1e3).toBe(0.302);
  });

  it("should calculate the trace resistance according to Microchip AN831", () => {
    expect(Math.round(adu.calculateTraceResistance(2 * (34e-3 + 12e-3), 2 * 1e-3, 434e6, 5.7e7) * 1e3) / 1e3).toBe(0.252);
  });

  it("should calculate the trace resistance according to Silicon Labs AN639", () => {
    expect(Math.round(adu.calculateTraceResistance(2 * (40e-3 + 25e-3), 2 * 1e-3, 434e6, 5.8e7) * 1e3) / 1e3).toBe(0.353);
  });

  it("should calculate the inductance", () => {
    expect(Math.round(adu.calculateInductance(10, 10, 0.01, 0.01) * 1e8) / 1e8).toBe(55.53e-6);
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
    expect(Math.round(adu.calculateCapacitance(102.64e-9, 434e6) * 1e14) / 1e14).toEqual(1.31e-12);
  });

  it("should calculate the secondary loop length", () => {
    expect(Math.round(adu.calculateSecondaryLoopLength(434000000, 0.275, 1000) * 1e4) / 1e4).toBe(13.8e-3);
  });

  it("should calculate the equivalent series resistance", () => {
    expect(Math.round(adu.calculateEquivalentSeriesResistance(1.31e-12, 434e6, 350) * 1e3) / 1e3).toBe(0.8);
  });
});
