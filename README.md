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
