#include "em_device.h"
#include "em_chip.h"
#include "em_i2c.h"

#include "InitDevice.h"

int main(void)
{
  /* Chip errata */
  CHIP_Init();

  // Add some delay
  for(volatile long i=0; i<200000; i++)
	  ;

  enter_DefaultMode_from_RESET();

  I2C_Init_TypeDef i2c_init =
  {
    .enable = true,                              // enable I2C
    .master = true,                              // I2C master
    .refFreq = 0,                                // measure reference clock
    .freq = I2C_FREQ_FAST_MAX,                   // 400kbps fast mode
    .clhr = i2cClockHLRAsymetric,                // use 6:3 bit ratio
  };
  I2C_Init(I2C0, &i2c_init);

  uint8_t sensor_addr = 0x40;
  uint8_t tx_buffer[1] = {0xE5};  // software tx buffer
  uint8_t rx_buffer[2];           // software rx buffer
  I2C_TransferReturn_TypeDef ret; // I2C state tracker

  /* Infinite loop */
  while (1) {
    I2C_TransferSeq_TypeDef sensor_message =
	{
	  .addr = (sensor_addr << 1),            // set sensor slave address
	  .flags = I2C_FLAG_WRITE_READ,          // indicate basic write
	  .buf[0].data = tx_buffer,              // point to tx_buffer
	  .buf[0].len = 1,                       // specify number of bytes
	  .buf[1].data = rx_buffer,
	  .buf[1].len = 2
	};
	ret = I2C_TransferInit(I2C0, &sensor_message); // start I2C write transaction with sensor
	while(ret == i2cTransferInProgress) {          // continue until all data has been sent
	  ret = I2C_Transfer(I2C0);
	}

    // Add some more delay
    for(volatile long i=0; i<100000; i++)
      ;
  }
}
