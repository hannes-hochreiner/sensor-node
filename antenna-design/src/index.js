import * as adu from "./antenna_design_utils";
import * as d3f from "d3-format";

let f = d3f.format(".3s");

console.log("Antenna Design");
let sideA = 22e-3;
let sideB = 26e-3;
let width = 1.5e-3;
let height = 70e-6;

console.log(`loop size: ${f(sideA)}m x ${f(sideB)}m`);
console.log(`loop area: ${f(sideA * sideB * 1e3)}m²`);
console.log(`trace: ${f(width)}m x ${f(height)}m`);

let frequency = 434e6;
console.log(`frequency: ${f(frequency)}Hz`);

let inputImpedance = 600;
console.log(`input impedance: ${f(inputImpedance)}Ω`);

let qFactor = 1 / frequency / 2 / Math.PI / 1e-12 / 0.1;
console.log(`q factor: ${qFactor}`);

let inductance = adu.calculateInductance(sideA, sideB, height, width);
console.log(`inductance: ${f(inductance)}H`);

let capacitance = adu.calculateCapacitance(inductance, frequency);
console.log(`capacitance: ${f(capacitance)}C`);

let radR = adu.calculateRadiationResistance(sideA * sideB, frequency);
console.log(`radiation resistance: ${f(radR)}Ω`);

let traceR = adu.calculateTraceResistance(2 * (sideA + sideB), 2 * width, frequency);
console.log(`trace resistance: ${f(traceR)}Ω`);

let srM = radR + traceR + adu.calculateEquivalentSeriesResistance(capacitance, frequency, qFactor);
console.log(`series resistance (Microchip): ${f(srM)}Ω`);
console.log(`gain (Microchip): ${f(10 * Math.log10(radR / srM))}dB`);

let sllM = adu.calculateSecondaryLoopLength(frequency, srM, inputImpedance);
console.log(`secondary loop (Microchip): ${f(2 * width)}m x ${f(sllM)}m`);

let radRS = adu.calculateRadiationResistance(sideA * sideB, frequency, 0.82);
console.log(`radiation resistance (Silicon Labs): ${f(radRS)}Ω`);

let srS = radRS + traceR + 0.3 + adu.calculateEquivalentSeriesResistance(capacitance, frequency, qFactor);
console.log(`series resistance (Silicon Labs): ${f(srS)}Ω`);
console.log(`gain (Silicon Labs): ${f(10 * Math.log10(radRS / srS))}dB`);

let sllS = adu.calculateSecondaryLoopLength(frequency, srS, inputImpedance);
console.log(`secondary loop (Silicon Labs): ${f(2 * width)}m x ${f(sllS)}m`);
