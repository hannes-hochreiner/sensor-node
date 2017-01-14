# Sensor Node
A simple wireless sensor node.

## Requirements
  * measurements of temperature and humidity
  * wireless operation
  * cost of parts for one node <= 30 EUR
  * one measurement per minute, if a change larger than 10 % is observed; otherwise, one measurement every 10 minutes

  * MCU architecture needs to be ARM Cortex M0 (because I was interested in the platform as a replacement for AVR MCUs)
  * no leadless parts (because I was not equiped to solder them)

## Outline
The plan was to just quickly throw together a sensor, an MCU, a wireless module and a battery.

### MCU selection
I choose to go with the EFM32ZG222F32, because it was fairly cheap and seemed to have good documentation.
I also checked out Silicon Labs IDE and quite liked it.

### Sensor selection
Adafruit Si7021 breackout board.
Seems to be a good sensor, which I could get my hands on for a reasonable price.
My preference would have been to use the sensor without the breackout board, but since it came in a leadless package I needed the breackout board.

### Wireless chip selection
The Si4012, because it is cheap and has very good documentation.

## Details

### Power and decoupling for the EFM32ZG
I found the recommended power and decoupling setup in Silicon Labs' "AN0002 Hardware Design Considerations".
The summary is, VSS go directly to ground, VDD_DREG gets 0.1 µF and 10 µF, DECOUPLE gets 1 µF, IOVDD get 0.1 µF each and one 10 µF, and AVDD get 10 nF each and one 10 µF.

### Power and decoupling for the Si4012
I followed the recommendation of the datasheet.
VDD got 1µF and the power supply for TXM and TXP got an LC filter with 220 nH and 0.5 pF resulting in a band pass of about 480 MHz.

### I2C
I have not checked the maximum speed at which I can the run the bus and I have not calculated the best value for the I2C pull-ups yet.

### Antenna
I have not calculated the best size for the antenna yet.
