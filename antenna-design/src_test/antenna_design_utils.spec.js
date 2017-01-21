import * as adu from "../bld/antenna_design_utils";

describe("antenna design util", () => {
  it("calculate the effective radius", () => {
    expect(adu.calculateEffectiveRadius(0.035e-3, 1e-3)).toBe(0.25225e-3);
  });

  it("should calculate the secondary loop length", () => {
    expect(Math.round(adu.calculateSecondaryLoopLength(434000000, 0.275, 1000) * 1e4) / 1e4).toBe(13.8e-3);
  });
});
