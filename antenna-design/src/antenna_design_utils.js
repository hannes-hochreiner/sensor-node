/**
* @module antenna_design_utils
*/

let speedOfLight = 299792458; // m/s
let conductivityOfCopper = 5.96e7; // S/m
let permeabilityOfCopper = 1.256629e-6; // H/m

/** Calculate the effective radius of a trace.
* @param {number} copperHeight height of the copper layer / m
* @param {number} traceWidth width of the trace / m
* @return {number} effective radius / m
*/
export function calculateEffectiveRadius(copperHeight, traceWidth) {
  return 0.35 * copperHeight + 0.24 * traceWidth;
}

/** Calculate the secondary loop length.
* This function assumes that the shorter side of the loop is twice the trace
* width.
* @param {number} frequency frequency / Hz
* @param {number} seriesResistance series resistance of the loop / Ohm
* @param {number} inputImpedance impedance of the source / Ohm
* @return {number} secondary loop length / m
*/
export function calculateSecondaryLoopLength(frequency, seriesResistance, inputImpedance) {
  return Math.sqrt(seriesResistance * inputImpedance) / (frequency * permeabilityOfCopper * Math.log(9));
}
