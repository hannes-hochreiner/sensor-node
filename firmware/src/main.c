#include "em_device.h"
#include "em_chip.h"

#include "InitDevice.h"

int main(void)
{
  /* Chip errata */
  CHIP_Init();

  // Add some delay
  for(volatile long i=0; i<200000; i++)
	  ;

  enter_DefaultMode_from_RESET();

  /* Infinite loop */
  while (1) {
	  // Turn on the LED
	  GPIO_PinModeSet(gpioPortA, 0, gpioModePushPull, 1);

      // Add some delay
      for(volatile long i=0; i<100000; i++)
    	  ;

      // Turn off the LED
      GPIO_PinModeSet(gpioPortA, 0, gpioModePushPull, 0);

      // Add some more delay
      for(volatile long i=0; i<100000; i++)
    	  ;
  }
}
