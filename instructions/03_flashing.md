# Flashing the MCU
I decided to use the Adafruit FT232H breakout board in combination with OpenOCD for flashing the MCU.

## Installing OpenOCD
Since I was using Fedora at the time, installing OpenOCD was as easy as typing:

```
sudo dnf install -y openocd
```

## FT232H module configuration
I started out using the "resistor hack" (interface/ftdi/swd-resistor-hack.cfg) configuration.
It worked ok, but had the drawback that it needed additional parts.

There is an ["official" configuration](http://openocd.zylin.com/#/c/2274) being worked on.
Hence, I am hopeful that the support for the FT232H module will get better soon.
For the time being, I pieced together a configuration with what I found around the web.
It is mainly based on [adafruit-ft232h-swd.cfg](http://openocd.zylin.com/#/c/4075/1/tcl/interface/ftdi/adafruit-ft232h-swd.cfg) by Roger Lendenmann.

## Connecting the adapter
The adapter connection is described in [adafruit-ft232h-swd.cfg](http://openocd.zylin.com/#/c/4075/1/tcl/interface/ftdi/adafruit-ft232h-swd.cfg).

## Flashing the chip
To flash the chip, I started OpenOCD in one terminal.
```
cd openocd
openocd -f sensor-node.cfg
```

Then, I opened a second terminal to connect to it via telnet.
```
$ telnet localhost 4444
Trying 127.0.0.1...
Connected to 127.0.0.1.
Escape character is '^]'.
Open On-Chip Debugger
> program ../sensor-node.hex verify reset
target halted due to debug-request, current mode: Thread
xPSR: 0x81000000 pc: 0x00000164 msp: 0x20001000
** Programming Started **
auto erase enabled
detected part: EFM32 Zero Gecko - Rev: 139
flash size = 32kbytes
flash page size = 1024bytes
wrote 3072 bytes from file ../sensor-node.hex in 0.180560s (16.615 KiB/s)
** Programming Finished **
** Verify Started **
verified 2888 bytes in 0.036852s (76.531 KiB/s)
** Verified OK **
```
