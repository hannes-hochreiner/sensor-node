# Reading sensor values
Reading the sensor values turned out to be pretty straight forward.
The emlib provides a nice abstraction for handling I2C communication.
Furthermore, there are a few examples that can be found around the web.
In the first iteration, I took the simplest approach by using blocking mode (clock stretching) requests.
I think that I could gain some efficiency in setting up DMA driven I2C communication, but I figured it might be better to start simple.

The actual code can be found on [GitHub](https://github.com/hannes-hochreiner/sensor-node/blob/08b46bc856f15618d4c0e9fb8b632ffcaa449f23/firmware/src/main.c).
I used GDB to load and debug the code on the MCU.
Having only worked with 8-bit AVR, I really enjoyed being able to debug the code directly on the MCU.
Although I cannot debug the code right in the IDE, it is still so much better to have GDB session with full access to memory and breakpoints than trying to debug code using printf and blinking LEDs.

For completion, here is a condensed version of the GDB session:
I started OpenOCD in one terminal:
```
$ openocd -f sensor-node.cfg
```
Then, I opened a second terminal to start GDB:
```
$ arm-none-eabi-gdb sensor-node.axf
(gdb) target remote :3333
(gdb) monitor reset halt
(gdb) load `sensor-node.axf' has changed; re-reading symbols.
Loading section .text, size 0x166c lma 0x0
Loading section .ARM.exidx, size 0x8 lma 0x166c
Loading section .data, size 0x74 lma 0x1674
Start address 0x164, load size 5864
Transfer rate: 12 KB/sec, 1954 bytes/write.
(gdb) b main.c:50
(gdb) c
Continuing.

Breakpoint 1, main () at ../src/main.c:50
50          for(volatile long i=0; i<100000; i++)
(gdb) p ret
$1 = i2cTransferDone
(gdb) p/x rx_buffer
$2 = {0x7b, 0x7e}
```
Which yielded the plausible value of about 54% relative humidity.
