import * as adu from "./antenna_design_utils";

console.log("Antenna Design");
let sideA = 25e-3;
let sideB = 25e-3;
let width = 1.5e-3;
let height = 70e-6;

console.log(`loop size: ${sideA * 1e3} mm x ${sideB * 1e3} mm`);
console.log(`trace: ${width * 1e3} mm x ${height * 1e6} µm`);

let frequency = 434e6;
console.log(`frequency: ${frequency / 1e6} MHz`);

let inputImpedance = 600;
console.log(`input impedance: ${inputImpedance} Ohm`);

let inductance = adu.calculateInductance(sideA, sideB, height, width);
console.log(`inductance: ${inductance * 1e9} nH`);

let capacitance = adu.calculateCapacitance(inductance, frequency);
console.log(`capacitance: ${capacitance * 1e12} pC`);

let radR = adu.calculateRadiationResistance(sideA * sideB, frequency);
console.log(`radiation resistance: ${radR * 1e3} mOhm`);

let traceR = adu.calculateTraceResistance(2 * (sideA + sideB), 2 * width, frequency);
console.log(`trace resistance: ${traceR * 1e3} mOhm`);

console.log(`gain: ${10 * Math.log10(radR / (radR + traceR))} dB`);

let secLoopLength = adu.calculateSecondaryLoopLength(frequency, radR + traceR, inputImpedance);
console.log(`secondary loop: ${2e3 * width} mm x ${secLoopLength * 1e3} mm`);
