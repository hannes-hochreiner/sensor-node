/*
 * sensor.h
 *
 *  Created on: Apr 18, 2017
 *      Author: Hannes Hochreiner <hannes@hochreiner.net>
 */

#ifndef INC_SENSOR_H_
#define INC_SENSOR_H_

#include "em_i2c.h"

int readSensor(uint16_t* humidity, uint16_t* temperature);

#endif /* INC_SENSOR_H_ */
