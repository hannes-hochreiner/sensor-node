EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:sensor-node
LIBS:sensor-node-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L EFM32ZG222 EFM?
U 1 1 5877E1EF
P 5400 3700
F 0 "EFM?" H 6200 2750 60  0000 C CNN
F 1 "EFM32ZG222" H 5400 3700 60  0000 C CNN
F 2 "" H 5050 3850 60  0001 C CNN
F 3 "" H 5050 3850 60  0001 C CNN
	1    5400 3700
	1    0    0    -1  
$EndComp
$Comp
L Battery BT?
U 1 1 5877E2B9
P 2500 3650
F 0 "BT?" H 2600 3700 50  0000 L CNN
F 1 "CR2032" H 2600 3600 50  0000 L CNN
F 2 "" V 2500 3690 50  0000 C CNN
F 3 "" V 2500 3690 50  0000 C CNN
	1    2500 3650
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5877E356
P 3300 3300
F 0 "R?" V 3380 3300 50  0000 C CNN
F 1 "R" V 3300 3300 50  0000 C CNN
F 2 "" V 3230 3300 50  0000 C CNN
F 3 "" H 3300 3300 50  0000 C CNN
	1    3300 3300
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5877E3A1
P 3500 3400
F 0 "R?" V 3580 3400 50  0000 C CNN
F 1 "R" V 3500 3400 50  0000 C CNN
F 2 "" V 3430 3400 50  0000 C CNN
F 3 "" H 3500 3400 50  0000 C CNN
	1    3500 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 3500 3300 3500
Wire Wire Line
	3300 3450 3300 3550
Wire Wire Line
	3300 3550 3500 3550
Connection ~ 3300 3500
Wire Wire Line
	3500 3250 4400 3250
Wire Wire Line
	3300 3150 4400 3150
$Comp
L Si4012 S?
U 1 1 5877E5F4
P 3350 1950
F 0 "S?" H 3650 1600 60  0000 C CNN
F 1 "Si4012" H 3350 1950 60  0000 C CNN
F 2 "" H 3350 1950 60  0001 C CNN
F 3 "" H 3350 1950 60  0001 C CNN
	1    3350 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 1750 4150 1750
Wire Wire Line
	4150 1750 4150 3150
Connection ~ 4150 3150
Wire Wire Line
	3950 1850 4050 1850
Wire Wire Line
	4050 1850 4050 3250
Connection ~ 4050 3250
$Comp
L INDUCTOR L?
U 1 1 5877E7F3
P 2050 1950
F 0 "L?" V 2000 1950 50  0000 C CNN
F 1 "220 nH" V 2150 1950 50  0000 C CNN
F 2 "" H 2050 1950 50  0000 C CNN
F 3 "" H 2050 1950 50  0000 C CNN
	1    2050 1950
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5877E866
P 2050 2750
F 0 "C?" H 2075 2850 50  0000 L CNN
F 1 "0.5pF" H 2075 2650 50  0000 L CNN
F 2 "" H 2088 2600 50  0000 C CNN
F 3 "" H 2050 2750 50  0000 C CNN
	1    2050 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 2150 2500 2150
Wire Wire Line
	2500 2150 2500 3500
Wire Wire Line
	2750 1850 2300 1850
Wire Wire Line
	2300 1850 2300 3950
Wire Wire Line
	2300 3950 2500 3950
Wire Wire Line
	2500 3950 2500 3800
Wire Wire Line
	2050 2600 2050 2250
Text Label 2050 1500 0    60   ~ 0
VDD
Text Label 2050 3200 0    60   ~ 0
GND
Wire Wire Line
	2050 3200 2050 2900
Wire Wire Line
	2050 1650 2050 1500
$EndSCHEMATC
