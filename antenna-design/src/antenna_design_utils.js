/**
* @module antenna_design_utils
*/

/** Calculate the effective radius of a trace.
* @param {number} copperHeight height of the copper layer in meters
* @param {number} traceWidth width of the trace in meters
*/
export function calculateEffectiveRadius(copperHeight, traceWidth) {
  return 0.35 * copperHeight + 0.24 * traceWidth;
}
