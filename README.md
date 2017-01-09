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

## MCU selection
I choose to go with the EFM32ZG222F32, because it was fairly cheap and seemed to have good documentation.
I also checked out Silicon Labs IDE and quite liked it.

## Sensor
Tentatively the HIH-5030-001, but only because it seemed to be the cheapest.

## Wireless
The Si4012, because it is cheap and has very good documentation.
