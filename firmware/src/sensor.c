/*
 * sensor.c
 *
 *  Created on: Apr 18, 2017
 *      Author: Hannes Hochreiner <hannes@hochreiner.net>
 */

#include "sensor.h"

int readSensor(uint16_t* humidity, uint16_t* temperature) {
  I2C_Init_TypeDef i2c_init = {
    .enable = true,                              // enable I2C
    .master = true,                              // I2C master
    .refFreq = 0,                                // measure reference clock
    .freq = I2C_FREQ_FAST_MAX,                   // 400kbps fast mode
    .clhr = i2cClockHLRAsymetric,                // use 6:3 bit ratio
  };
  I2C_Init(I2C0, &i2c_init);

  uint8_t sensor_addr = 0x40;
  uint8_t comReadHumidity = 0xE5;
  uint8_t comReadTemperature = 0xE0;
  uint8_t buf[2];

  I2C_TransferReturn_TypeDef ret; // I2C state tracker

  I2C_TransferSeq_TypeDef msg = {
    .addr = (sensor_addr << 1),            // set sensor slave address
    .flags = I2C_FLAG_WRITE_READ,          // indicate basic write
    .buf[0].data = &comReadHumidity,       // point to tx_buffer
    .buf[0].len = 1,                       // specify number of bytes
    .buf[1].data = buf,
    .buf[1].len = 2
  };

  ret = I2C_TransferInit(I2C0, &msg);      // start I2C write transaction with sensor
  while(ret == i2cTransferInProgress) {    // continue until all data has been sent
    ret = I2C_Transfer(I2C0);
  }

  *humidity = buf[0] << 8 | buf[1];

  msg.buf[0].data = &comReadTemperature;

  ret = I2C_TransferInit(I2C0, &msg);      // start I2C write transaction with sensor
  while(ret == i2cTransferInProgress) {    // continue until all data has been sent
    ret = I2C_Transfer(I2C0);
  }

  *temperature = buf[0] << 8 | buf[1];

  return 0;
}
