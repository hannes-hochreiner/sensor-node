/**
* @module antenna_design_utils
*/

let speedOfLight = 299792458; // m/s
let conductivityOfCopper = 5.96e7; // S/m
let permeabilityOfCopper = 1.256629e-6; // H/m
let permeabilityVacuum = 4 * Math.PI * 1e-7; // H/m

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

/** Calculate the radiation resistance.
* @param {number} area area inclosed by the loop antenna / m²
* @param {number} frequency frequency / Hz
* @return {number} radiation resistance / Ohm
*/
export function calculateRadiationResistance(area, frequency) {
  return 320 * Math.pow(Math.PI / speedOfLight * frequency, 4) * Math.pow(area, 2);
}

/** Calculate the loss resistance.
* @param {number} perimeter perimeter of the loop antenna / m
* @param {number} effectiveTraceRadius effective radius of the trace / m
* @param {frequency} frequency / Hz
* @return {number} loss resistance / Ohm
*/
export function calculateLossResistance(perimeter, effectiveTraceRadius, frequency) {
  return perimeter * Math.sqrt(Math.PI * frequency * permeabilityOfCopper / conductivityOfCopper) / (2 * Math.PI * effectiveTraceRadius);
}

/** Calculate the inductance of a trace rectangle.
* This calculation uses the equations given in Rosa, E.B. (1908). "The Self and Mutual Inductances of Linear Conductors". Bulletin of the Bureau of Standards. 4 (2): 301–344. [doi:10.6028/bulletin.088](https://dx.doi.org/10.6028%2Fbulletin.088).
* @param {number} a side a of the rectangle / m
* @param {number} b side b of the rectangle / m
* @param {number} traceHeight height of the trace (i.e. of the copper layer) / m
* @param {number} traceWidth width of the trace / m
* @return {number} inductance / H
*/
export function calculateInductance(a, b, traceHeight, traceWidth) {
  let sumAlphaBeta = (traceWidth + traceHeight);
  let d = Math.sqrt(a * a + b * b);

  // 4e-7 = µ0 / pi
  return 4e-7 * ((a + b) * Math.log(2 * a * b / sumAlphaBeta) - a * Math.log(a + d) - b * Math.log(b + d) - (a + b) / 2 + 2 * d + 0.447 * sumAlphaBeta);
}

/** Calculate the required capacitance for an LC circuit given a certain inductance and frequency.
* @param {number} inductance inductance / H
* @param {number} frequency frequency / Hz
* @return {number} capacitance / C
*/
export function calculateCapacitance(inductance, frequency) {
  return 1 / (Math.pow(2 * Math.PI * frequency, 2) * inductance);
}
