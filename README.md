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
I choose to go with the EFM32ZG222F32, because it was fairly cheap, low power and seemed to have good documentation.
As a bonus it has AES encryption functions, which makes the radio selection easier.
I also checked out Silicon Labs IDE and quite liked it.

Other candidates where the LPC81/2 (higher power and no AES) and the STM32F03 (no AES).

### Sensor selection
Adafruit Si7021 breakout board.
Seems to be a good sensor, which I could get my hands on for a reasonable price.
My preference would have been to use the sensor without the breakout board, but since it came in a leadless package I needed the breakout board.

### Wireless chip selection
The Si4012, because it is cheap and has very good documentation.

## Details

### Power and decoupling for the EFM32ZG
I found the recommended power and decoupling setup in Silicon Labs' "AN0002 Hardware Design Considerations".
The summary is, VSS go directly to ground, VDD_DREG gets 0.1 µF and 10 µF, DECOUPLE gets 1 µF, IOVDD get 0.1 µF each and one 10 µF, and AVDD get 10 nF each and one 10 µF.

### Power and decoupling for the Si4012
I followed the recommendation of the datasheet.
VDD got 1µF and the power supply for TXM and TXP got an LC filter with 220 nH and 0.5 pF resulting in a band pass of about 480 MHz.

### Power and decoupling for the Si7021
Ground was connected to a GPIO to be able to disable the module when it is not in use.
Decoupling has to be checked.

### External oscillators
I figured that I did not need any external oscillators since the communication on the board worked over I2C (which has a clock signal) and the radio claimed to have an internal oscillator that was precise enough.

### I2C
The three major things to consider with I2C seemed to me to be the addresses that are used, the speed the modules can handle and the pull-ups that are required.

Addresses and speeds are fairly easy to obtain.
A quick look into the datasheets told me the following:

  * Si7021: address: 0b1000000x; speeds: max 400 kHz; does clock strechting over 100 kHz.
  * Si4012: address: 0b1110000x (configurable); speeds: 100 kbps and 400 kbps.

When it comes to the pull-ups, it gets a little bit trickier.
However, I found a lot of documentation on the net explaining how to calculate the suitable intervals.
I used the Texas Instruments Application Report SLVA689 from February 2015.

I started out by calculating the maximum value, which depends essentially on the bus capacitance and the speed.
The bus capacitance is the capacitance of the pins plus that of the trace.
One problem I had was that I was not able to find any values for the capacitance the pins of my chosen chips added to the bus in the datasheets.
After investigating the topic for a while, I concluded that 10 pF should be a fairly conservative assumption.

To calculate the trace capacitance, I used the online calculator of the [Missouri University of Science and Technology](http://emclab.mst.edu/pcbtlc2/microstrip/).
The required parameters I obtained from OSHPark ([2 Layer Prototype](http://docs.oshpark.com/services/two-layer/), [2 Layer 2oz 0.8mm](http://docs.oshpark.com/services/two-layer-hhdc/)).
I assumed a trace width of 10 mils.

  * <0.5 pF / cm for the 2 layer prototype service
  * <0.6 pF / cm for the 2 layer 2 oz 0.8mm service

Given that there were three ICs on the bus and that the trace length would be smaller 3 cm, I estimated that the bus capacitance should be smaller 35 pF.
From that, I calculated the maximum resistance for the pull-ups at different speeds.

  * 33 kOhm for 100 kHz
  * 10 kOhm for 400 kHz

I tried calculating the minimum values for the pull-up resistors for all ICs.
However, only the datasheet of the Si7021 provided the required values.
The minimum resistance for the Si7021 was 1.1 kOhm.
I took this value as a representative value of all involved ICs.

In the end, I decided to go with 400 kHz transmission speed using 10 kOhm pull-ups.
One thing to note is that the Si4012 had a 50 kOhm integrated pull-up.
Hence the 10 kOhm would effectively only be about 8.5 kOhm.
I figured that this should give me an additional margin, but it was also something I had to consider at the time of calculating the battery life.

### Antenna
I have not calculated the best size for the antenna yet.

### SWD
I added a 10 pin Cortex Debug connector based on the [ARM recommendation](http://infocenter.arm.com/help/topic/com.arm.doc.faqs/attached/13634/cortex_debug_connectors.pdf).

### BOM

A detailed bill of materials can be found on a [sub-page](bom.md).
