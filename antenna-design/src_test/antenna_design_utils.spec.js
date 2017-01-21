import * as adu from "../bld/antenna_design_utils";

describe("antenna design util", () => {
  it("fail on this test", () => {
    expect(adu.calculateEffectiveRadius(0.035e-3, 1e-3)).toBe(0.25225e-3);
  });
});
