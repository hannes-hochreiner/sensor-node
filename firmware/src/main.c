#include "em_device.h"
#include "em_chip.h"

#include "InitDevice.h"
#include "sensor.h"

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
    uint16_t hum, tmp;

    readSensor(&hum, &tmp);

    // Add some more delay
    for(volatile long i=0; i<100000; i++)
      ;
  }
}
