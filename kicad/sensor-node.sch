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
L EFM32ZG222 EFM1
U 1 1 5877E1EF
P 5400 3700
F 0 "EFM1" H 6200 2750 60  0000 C CNN
F 1 "EFM32ZG222" H 5400 3700 60  0000 C CNN
F 2 "" H 5050 3850 60  0001 C CNN
F 3 "" H 5050 3850 60  0001 C CNN
	1    5400 3700
	1    0    0    -1  
$EndComp
$Comp
L Battery BT1
U 1 1 5877E2B9
P 1100 3550
F 0 "BT1" H 1200 3600 50  0000 L CNN
F 1 "CR2032" H 1200 3500 50  0000 L CNN
F 2 "" V 1100 3590 50  0000 C CNN
F 3 "" V 1100 3590 50  0000 C CNN
	1    1100 3550
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 5877E356
P 2900 3550
F 0 "R1" V 2980 3550 50  0000 C CNN
F 1 "10k" V 2900 3550 50  0000 C CNN
F 2 "" V 2830 3550 50  0000 C CNN
F 3 "" H 2900 3550 50  0000 C CNN
	1    2900 3550
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 5877E3A1
P 3100 3650
F 0 "R2" V 3180 3650 50  0000 C CNN
F 1 "10k" V 3100 3650 50  0000 C CNN
F 2 "" V 3030 3650 50  0000 C CNN
F 3 "" H 3100 3650 50  0000 C CNN
	1    3100 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 3700 2900 3950
Wire Wire Line
	2900 3800 3100 3800
$Comp
L Si4012 S1
U 1 1 5877E5F4
P 9950 3700
F 0 "S1" H 10250 3350 60  0000 C CNN
F 1 "Si4012" H 9950 3700 60  0000 C CNN
F 2 "" H 9950 3700 60  0001 C CNN
F 3 "" H 9950 3700 60  0001 C CNN
	1    9950 3700
	1    0    0    -1  
$EndComp
$Comp
L INDUCTOR L1
U 1 1 5877E7F3
P 9350 4700
F 0 "L1" V 9300 4700 50  0000 C CNN
F 1 "220nH" V 9450 4700 50  0000 C CNN
F 2 "" H 9350 4700 50  0000 C CNN
F 3 "" H 9350 4700 50  0000 C CNN
	1    9350 4700
	0    1    1    0   
$EndComp
$Comp
L C C2
U 1 1 5877E866
P 9050 5100
F 0 "C2" H 9075 5200 50  0000 L CNN
F 1 "0.5pF" H 9075 5000 50  0000 L CNN
F 2 "" H 9088 4950 50  0000 C CNN
F 3 "" H 9050 5100 50  0000 C CNN
	1    9050 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 3750 9050 4950
Wire Wire Line
	9050 5450 9050 5250
$Comp
L GND #PWR01
U 1 1 58791BDD
P 9300 3600
F 0 "#PWR01" H 9300 3350 50  0001 C CNN
F 1 "GND" H 9300 3450 50  0000 C CNN
F 2 "" H 9300 3600 50  0000 C CNN
F 3 "" H 9300 3600 50  0000 C CNN
	1    9300 3600
	0    1    1    0   
$EndComp
NoConn ~ 9350 3500
$Comp
L GND #PWR02
U 1 1 58791C29
P 1100 3950
F 0 "#PWR02" H 1100 3700 50  0001 C CNN
F 1 "GND" H 1100 3800 50  0000 C CNN
F 2 "" H 1100 3950 50  0000 C CNN
F 3 "" H 1100 3950 50  0000 C CNN
	1    1100 3950
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR03
U 1 1 58791C4B
P 1100 3200
F 0 "#PWR03" H 1100 3050 50  0001 C CNN
F 1 "+3V3" H 1100 3340 50  0000 C CNN
F 2 "" H 1100 3200 50  0000 C CNN
F 3 "" H 1100 3200 50  0000 C CNN
	1    1100 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 3700 1100 3950
Wire Wire Line
	1100 3400 1100 3200
$Comp
L GND #PWR04
U 1 1 587921F7
P 9050 5450
F 0 "#PWR04" H 9050 5200 50  0001 C CNN
F 1 "GND" H 9050 5300 50  0000 C CNN
F 2 "" H 9050 5450 50  0000 C CNN
F 3 "" H 9050 5450 50  0000 C CNN
	1    9050 5450
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR05
U 1 1 58792219
P 9800 4700
F 0 "#PWR05" H 9800 4550 50  0001 C CNN
F 1 "+3V3" H 9800 4840 50  0000 C CNN
F 2 "" H 9800 4700 50  0000 C CNN
F 3 "" H 9800 4700 50  0000 C CNN
	1    9800 4700
	0    1    1    0   
$EndComp
$Comp
L C C1
U 1 1 5879225E
P 7850 3750
F 0 "C1" H 7875 3850 50  0000 L CNN
F 1 "C" H 7875 3650 50  0000 L CNN
F 2 "" H 7888 3600 50  0000 C CNN
F 3 "" H 7850 3750 50  0000 C CNN
	1    7850 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 3700 8800 3700
Wire Wire Line
	8800 3700 8800 3300
Wire Wire Line
	8800 3300 8700 3300
Wire Wire Line
	8700 3200 8700 4300
Wire Wire Line
	8700 3200 7850 3200
Wire Wire Line
	7850 3200 7850 3600
Wire Wire Line
	9350 3800 8800 3800
Wire Wire Line
	8800 3800 8800 4200
Wire Wire Line
	8800 4200 8700 4200
Wire Wire Line
	8700 4300 7850 4300
Wire Wire Line
	7850 4300 7850 3900
Connection ~ 8700 4200
Connection ~ 8700 3300
Wire Wire Line
	9050 3750 8700 3750
Connection ~ 8700 3750
Connection ~ 9050 4700
$Comp
L +3V3 #PWR06
U 1 1 587923C1
P 9300 3900
F 0 "#PWR06" H 9300 3750 50  0001 C CNN
F 1 "+3V3" H 9300 4040 50  0000 C CNN
F 2 "" H 9300 3900 50  0000 C CNN
F 3 "" H 9300 3900 50  0000 C CNN
	1    9300 3900
	0    -1   -1   0   
$EndComp
$Comp
L LED D1
U 1 1 58792412
P 10750 4300
F 0 "D1" H 10750 4400 50  0000 C CNN
F 1 "LED" H 10750 4200 50  0000 C CNN
F 2 "" H 10750 4300 50  0000 C CNN
F 3 "" H 10750 4300 50  0000 C CNN
	1    10750 4300
	0    1    1    0   
$EndComp
Wire Wire Line
	10750 4700 10750 4500
Wire Wire Line
	10750 4100 10750 3900
Wire Wire Line
	10750 3900 10550 3900
Wire Wire Line
	9300 3600 9350 3600
$Comp
L C C3
U 1 1 587925C8
P 9350 4150
F 0 "C3" H 9375 4250 50  0000 L CNN
F 1 "1µF" H 9375 4050 50  0000 L CNN
F 2 "" H 9388 4000 50  0000 C CNN
F 3 "" H 9350 4150 50  0000 C CNN
	1    9350 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 4350 9350 4300
Wire Wire Line
	9350 3900 9350 4000
$Comp
L +3V3 #PWR07
U 1 1 58792727
P 10750 4700
F 0 "#PWR07" H 10750 4550 50  0001 C CNN
F 1 "+3V3" H 10750 4840 50  0000 C CNN
F 2 "" H 10750 4700 50  0000 C CNN
F 3 "" H 10750 4700 50  0000 C CNN
	1    10750 4700
	-1   0    0    1   
$EndComp
Wire Wire Line
	9650 4700 9800 4700
Text Label 10550 3500 0    60   ~ 0
SDA
Text Label 10550 3600 0    60   ~ 0
SCL
Text Label 10550 3700 0    60   ~ 0
RAD_ENABLE
Text Label 10550 3800 0    60   ~ 0
RAD_INT
Text Label 4400 3150 2    60   ~ 0
SDA
Text Label 4400 3250 2    60   ~ 0
SCL
$Comp
L +3V3 #PWR08
U 1 1 58792BC2
P 2900 3950
F 0 "#PWR08" H 2900 3800 50  0001 C CNN
F 1 "+3V3" H 2900 4090 50  0000 C CNN
F 2 "" H 2900 3950 50  0000 C CNN
F 3 "" H 2900 3950 50  0000 C CNN
	1    2900 3950
	-1   0    0    1   
$EndComp
Connection ~ 2900 3800
Text Label 2400 3200 2    60   ~ 0
SDA
Text Label 2400 3300 2    60   ~ 0
SCL
Text Label 3450 3300 0    60   ~ 0
SCL
Text Label 3450 3200 0    60   ~ 0
SDA
Wire Wire Line
	2400 3200 3450 3200
Wire Wire Line
	2400 3300 3450 3300
Wire Wire Line
	3100 3500 3100 3300
Connection ~ 3100 3300
Wire Wire Line
	2900 3400 2900 3200
Connection ~ 2900 3200
NoConn ~ 4850 2700
NoConn ~ 4950 2700
NoConn ~ 5050 2700
NoConn ~ 5150 2700
NoConn ~ 5250 2700
NoConn ~ 5450 2700
NoConn ~ 5550 2700
NoConn ~ 5650 2700
NoConn ~ 5750 2700
NoConn ~ 5850 2700
NoConn ~ 5950 2700
NoConn ~ 6400 3150
NoConn ~ 6400 3250
NoConn ~ 6400 3350
NoConn ~ 6400 3450
NoConn ~ 6400 3550
NoConn ~ 6400 3650
NoConn ~ 6400 3750
NoConn ~ 6400 4050
NoConn ~ 6400 4150
NoConn ~ 6400 4250
NoConn ~ 4400 4250
NoConn ~ 4400 4150
NoConn ~ 4400 4050
NoConn ~ 4400 3950
NoConn ~ 4400 3850
NoConn ~ 4400 3750
NoConn ~ 4400 3650
NoConn ~ 4400 3350
NoConn ~ 5950 4700
NoConn ~ 5650 4700
NoConn ~ 5550 4700
NoConn ~ 5250 4700
NoConn ~ 5150 4700
NoConn ~ 5050 4700
NoConn ~ 4950 4700
NoConn ~ 4850 4700
Wire Wire Line
	9300 3900 9350 3900
$Comp
L GND #PWR09
U 1 1 5879365E
P 9350 4350
F 0 "#PWR09" H 9350 4100 50  0001 C CNN
F 1 "GND" H 9350 4200 50  0000 C CNN
F 2 "" H 9350 4350 50  0000 C CNN
F 3 "" H 9350 4350 50  0000 C CNN
	1    9350 4350
	1    0    0    -1  
$EndComp
$Comp
L C C12
U 1 1 58793969
P 6800 4100
F 0 "C12" H 6825 4200 50  0000 L CNN
F 1 "0.1µF" H 6825 4000 50  0000 L CNN
F 2 "" H 6838 3950 50  0000 C CNN
F 3 "" H 6800 4100 50  0000 C CNN
	1    6800 4100
	1    0    0    -1  
$EndComp
$Comp
L C C13
U 1 1 587939B0
P 7100 4100
F 0 "C13" H 7125 4200 50  0000 L CNN
F 1 "10µF" H 7125 4000 50  0000 L CNN
F 2 "" H 7138 3950 50  0000 C CNN
F 3 "" H 7100 4100 50  0000 C CNN
	1    7100 4100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 587939DD
P 7100 4400
F 0 "#PWR010" H 7100 4150 50  0001 C CNN
F 1 "GND" H 7100 4250 50  0000 C CNN
F 2 "" H 7100 4400 50  0000 C CNN
F 3 "" H 7100 4400 50  0000 C CNN
	1    7100 4400
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR011
U 1 1 58793A09
P 7350 3950
F 0 "#PWR011" H 7350 3800 50  0001 C CNN
F 1 "+3V3" H 7350 4090 50  0000 C CNN
F 2 "" H 7350 3950 50  0000 C CNN
F 3 "" H 7350 3950 50  0000 C CNN
	1    7350 3950
	0    1    1    0   
$EndComp
Wire Wire Line
	6400 3950 7350 3950
Connection ~ 6800 3950
Connection ~ 7100 3950
Wire Wire Line
	6800 4250 7100 4250
Wire Wire Line
	7100 4250 7100 4400
$Comp
L C C11
U 1 1 58793B7A
P 6800 3650
F 0 "C11" H 6825 3750 50  0000 L CNN
F 1 "1µF" H 6825 3550 50  0000 L CNN
F 2 "" H 6838 3500 50  0000 C CNN
F 3 "" H 6800 3650 50  0000 C CNN
	1    6800 3650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 58793BA9
P 6800 3400
F 0 "#PWR012" H 6800 3150 50  0001 C CNN
F 1 "GND" H 6800 3250 50  0000 C CNN
F 2 "" H 6800 3400 50  0000 C CNN
F 3 "" H 6800 3400 50  0000 C CNN
	1    6800 3400
	-1   0    0    1   
$EndComp
Wire Wire Line
	6400 3850 6800 3850
Wire Wire Line
	6800 3850 6800 3800
Wire Wire Line
	6800 3500 6800 3400
$Comp
L GND #PWR013
U 1 1 58793D7C
P 5350 4700
F 0 "#PWR013" H 5350 4450 50  0001 C CNN
F 1 "GND" H 5350 4550 50  0000 C CNN
F 2 "" H 5350 4700 50  0000 C CNN
F 3 "" H 5350 4700 50  0000 C CNN
	1    5350 4700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 58793DAA
P 5850 5250
F 0 "#PWR014" H 5850 5000 50  0001 C CNN
F 1 "GND" H 5850 5100 50  0000 C CNN
F 2 "" H 5850 5250 50  0000 C CNN
F 3 "" H 5850 5250 50  0000 C CNN
	1    5850 5250
	1    0    0    -1  
$EndComp
$Comp
L C C9
U 1 1 58793DD8
P 5850 5000
F 0 "C9" H 5875 5100 50  0000 L CNN
F 1 "10nF" H 5875 4900 50  0000 L CNN
F 2 "" H 5888 4850 50  0000 C CNN
F 3 "" H 5850 5000 50  0000 C CNN
	1    5850 5000
	1    0    0    -1  
$EndComp
$Comp
L C C7
U 1 1 58793E0D
P 5450 5000
F 0 "C7" H 5475 5100 50  0000 L CNN
F 1 "10nF" H 5475 4900 50  0000 L CNN
F 2 "" H 5488 4850 50  0000 C CNN
F 3 "" H 5450 5000 50  0000 C CNN
	1    5450 5000
	1    0    0    -1  
$EndComp
$Comp
L C C10
U 1 1 58793E48
P 6250 5000
F 0 "C10" H 6275 5100 50  0000 L CNN
F 1 "10µF" H 6275 4900 50  0000 L CNN
F 2 "" H 6288 4850 50  0000 C CNN
F 3 "" H 6250 5000 50  0000 C CNN
	1    6250 5000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR015
U 1 1 58793F0E
P 5450 5250
F 0 "#PWR015" H 5450 5000 50  0001 C CNN
F 1 "GND" H 5450 5100 50  0000 C CNN
F 2 "" H 5450 5250 50  0000 C CNN
F 3 "" H 5450 5250 50  0000 C CNN
	1    5450 5250
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR016
U 1 1 58793F42
P 6500 4850
F 0 "#PWR016" H 6500 4700 50  0001 C CNN
F 1 "+3V3" H 6500 4990 50  0000 C CNN
F 2 "" H 6500 4850 50  0000 C CNN
F 3 "" H 6500 4850 50  0000 C CNN
	1    6500 4850
	0    1    1    0   
$EndComp
Connection ~ 5850 4850
Connection ~ 6250 4850
Wire Wire Line
	5850 4850 5850 4700
Wire Wire Line
	5450 5150 5450 5250
Wire Wire Line
	5850 5150 5850 5250
Wire Wire Line
	5850 5150 6250 5150
$Comp
L GND #PWR017
U 1 1 587942FF
P 4400 3550
F 0 "#PWR017" H 4400 3300 50  0001 C CNN
F 1 "GND" H 4400 3400 50  0000 C CNN
F 2 "" H 4400 3550 50  0000 C CNN
F 3 "" H 4400 3550 50  0000 C CNN
	1    4400 3550
	0    1    1    0   
$EndComp
$Comp
L C C8
U 1 1 58794495
P 5650 5350
F 0 "C8" H 5675 5450 50  0000 L CNN
F 1 "0.1µF" H 5675 5250 50  0000 L CNN
F 2 "" H 5688 5200 50  0000 C CNN
F 3 "" H 5650 5350 50  0000 C CNN
	1    5650 5350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR018
U 1 1 58794543
P 5650 5600
F 0 "#PWR018" H 5650 5350 50  0001 C CNN
F 1 "GND" H 5650 5450 50  0000 C CNN
F 2 "" H 5650 5600 50  0000 C CNN
F 3 "" H 5650 5600 50  0000 C CNN
	1    5650 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 5500 5650 5600
Wire Wire Line
	5650 5150 5650 5200
Wire Wire Line
	4200 5150 5750 5150
Wire Wire Line
	5750 5150 5750 4700
$Comp
L C C4
U 1 1 5879D002
P 4050 3450
F 0 "C4" H 4075 3550 50  0000 L CNN
F 1 "0.1µF" H 4075 3350 50  0000 L CNN
F 2 "" H 4088 3300 50  0000 C CNN
F 3 "" H 4050 3450 50  0000 C CNN
	1    4050 3450
	0    1    1    0   
$EndComp
$Comp
L C C6
U 1 1 5879D061
P 5350 2400
F 0 "C6" H 5375 2500 50  0000 L CNN
F 1 "0.1µF" H 5375 2300 50  0000 L CNN
F 2 "" H 5388 2250 50  0000 C CNN
F 3 "" H 5350 2400 50  0000 C CNN
	1    5350 2400
	1    0    0    -1  
$EndComp
$Comp
L C C5
U 1 1 5879D0E8
P 5100 5350
F 0 "C5" H 5125 5450 50  0000 L CNN
F 1 "10µF" H 5125 5250 50  0000 L CNN
F 2 "" H 5138 5200 50  0000 C CNN
F 3 "" H 5100 5350 50  0000 C CNN
	1    5100 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 2550 5350 2700
Wire Wire Line
	5350 2600 4200 2600
Wire Wire Line
	4200 2600 4200 5150
Connection ~ 5350 2600
Wire Wire Line
	4200 3450 4400 3450
Connection ~ 4200 3450
Connection ~ 5650 5150
Connection ~ 5100 5150
Wire Wire Line
	5100 5200 5100 5150
$Comp
L GND #PWR019
U 1 1 5879D519
P 5100 5600
F 0 "#PWR019" H 5100 5350 50  0001 C CNN
F 1 "GND" H 5100 5450 50  0000 C CNN
F 2 "" H 5100 5600 50  0000 C CNN
F 3 "" H 5100 5600 50  0000 C CNN
	1    5100 5600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR020
U 1 1 5879D5A5
P 3800 3450
F 0 "#PWR020" H 3800 3200 50  0001 C CNN
F 1 "GND" H 3800 3300 50  0000 C CNN
F 2 "" H 3800 3450 50  0000 C CNN
F 3 "" H 3800 3450 50  0000 C CNN
	1    3800 3450
	0    1    1    0   
$EndComp
$Comp
L GND #PWR021
U 1 1 5879D609
P 5350 2150
F 0 "#PWR021" H 5350 1900 50  0001 C CNN
F 1 "GND" H 5350 2000 50  0000 C CNN
F 2 "" H 5350 2150 50  0000 C CNN
F 3 "" H 5350 2150 50  0000 C CNN
	1    5350 2150
	-1   0    0    1   
$EndComp
Wire Wire Line
	5350 2150 5350 2250
Wire Wire Line
	3900 3450 3800 3450
Wire Wire Line
	5100 5500 5100 5600
$Comp
L +3V3 #PWR022
U 1 1 5879D7EB
P 4200 5150
F 0 "#PWR022" H 4200 5000 50  0001 C CNN
F 1 "+3V3" H 4200 5290 50  0000 C CNN
F 2 "" H 4200 5150 50  0000 C CNN
F 3 "" H 4200 5150 50  0000 C CNN
	1    4200 5150
	0    -1   -1   0   
$EndComp
$Comp
L Si7021-BA SBA1
U 1 1 5879DD92
P 2250 5350
F 0 "SBA1" H 2500 5000 60  0000 C CNN
F 1 "Si7021-BA" H 2100 5350 60  0000 C CNN
F 2 "" H 2150 5400 60  0001 C CNN
F 3 "" H 2150 5400 60  0001 C CNN
	1    2250 5350
	1    0    0    -1  
$EndComp
Text Label 2800 5150 0    60   ~ 0
SDA
Text Label 2800 5250 0    60   ~ 0
SCL
NoConn ~ 2800 5450
$Comp
L +3V3 #PWR023
U 1 1 5879DF12
P 2800 5550
F 0 "#PWR023" H 2800 5400 50  0001 C CNN
F 1 "+3V3" H 2800 5690 50  0000 C CNN
F 2 "" H 2800 5550 50  0000 C CNN
F 3 "" H 2800 5550 50  0000 C CNN
	1    2800 5550
	0    1    1    0   
$EndComp
Text Label 2800 5350 0    60   ~ 0
~SEN_ENABLE
Wire Wire Line
	5450 4850 5450 4700
Wire Wire Line
	5450 4850 6500 4850
$EndSCHEMATC
