//=========================================================
// src/InitDevice.c: generated by Hardware Configurator
//
// This file will be regenerated when saving a document.
// leave the sections inside the "$[...]" comment tags alone
// or they will be overwritten!
//=========================================================

// USER INCLUDES
#include "InitDevice.h"

// USER PROTOTYPES
// USER FUNCTIONS

// $[Library includes]
#include "em_system.h"
#include "em_emu.h"
#include "em_cmu.h"
#include "em_device.h"
#include "em_chip.h"
#include "em_assert.h"
#include "em_aes.h"
#include "em_gpio.h"
#include "em_i2c.h"
#include "em_rtc.h"
// [Library includes]$

//==============================================================================
// enter_DefaultMode_from_RESET
//==============================================================================
extern void enter_DefaultMode_from_RESET(void) {
	// $[Config Calls]
	CMU_enter_DefaultMode_from_RESET();
	RTC_enter_DefaultMode_from_RESET();
	I2C0_enter_DefaultMode_from_RESET();
	PORTIO_enter_DefaultMode_from_RESET();
	// [Config Calls]$

}

//================================================================================
// HFXO_enter_DefaultMode_from_RESET
//================================================================================
extern void HFXO_enter_DefaultMode_from_RESET(void) {

	// $[HFXO]
	// [HFXO]$

}

//================================================================================
// LFXO_enter_DefaultMode_from_RESET
//================================================================================
extern void LFXO_enter_DefaultMode_from_RESET(void) {

	// $[Use oscillator source]
	// [Use oscillator source]$

	// $[LFXO Boost Percent]
	// [LFXO Boost Percent]$

	// $[REDLFXO Boost]
	// [REDLFXO Boost]$

}

//================================================================================
// CMU_enter_DefaultMode_from_RESET
//================================================================================
extern void CMU_enter_DefaultMode_from_RESET(void) {

	// $[LFXO enable]
	// [LFXO enable]$

	// $[HFXO enable]
	// [HFXO enable]$

	// $[LFACLK Setup]
	/* Enable LFRCO oscillator */
	CMU_OscillatorEnable(cmuOsc_LFRCO, true, true);

	/* Select LFRCO as clock source for LFACLK */
	CMU_ClockSelectSet(cmuClock_LFA, cmuSelect_LFRCO);

	// [LFACLK Setup]$

	// $[High Frequency Clock select]
	/* Using HFRCO at 14MHz as high frequency clock, HFCLK */
	CMU_ClockSelectSet(cmuClock_HF, cmuSelect_HFRCO);

	/* Enable peripheral clock */
	CMU_ClockEnable(cmuClock_HFPER, true);

	// [High Frequency Clock select]$

	// $[LF clock tree setup]
	/* Enable LF clocks */
	CMU_ClockEnable(cmuClock_CORELE, true);
	CMU_ClockSelectSet(cmuClock_LFA, cmuSelect_LFRCO);
	// [LF clock tree setup]$
	// $[Peripheral Clock enables]
	/* Enable clock for AES */
	CMU_ClockEnable(cmuClock_AES, true);

	/* Enable clock for I2C0 */
	CMU_ClockEnable(cmuClock_I2C0, true);

	/* Enable clock for RTC */
	CMU_ClockEnable(cmuClock_RTC, true);

	/* Enable clock for GPIO by default */
	CMU_ClockEnable(cmuClock_GPIO, true);

	// [Peripheral Clock enables]$

}

//================================================================================
// ADC0_enter_DefaultMode_from_RESET
//================================================================================
extern void ADC0_enter_DefaultMode_from_RESET(void) {

	// $[ADC_Init]
	// [ADC_Init]$

	// $[ADC_InitSingle]
	// [ADC_InitSingle]$

	// $[ADC_InitScan]
	// [ADC_InitScan]$

}

//================================================================================
// ACMP0_enter_DefaultMode_from_RESET
//================================================================================
extern void ACMP0_enter_DefaultMode_from_RESET(void) {

	// $[ACMP Initialization]
	// [ACMP Initialization]$

	// $[ACMP Channel config]
	// [ACMP Channel config]$

}

//================================================================================
// IDAC0_enter_DefaultMode_from_RESET
//================================================================================
extern void IDAC0_enter_DefaultMode_from_RESET(void) {

	// $[IDAC Initialization]
	// [IDAC Initialization]$

	// $[IDAC optional configurations]
	// [IDAC optional configurations]$

	// $[IDAC enable]
	// [IDAC enable]$

}

//================================================================================
// RTC_enter_DefaultMode_from_RESET
//================================================================================
extern void RTC_enter_DefaultMode_from_RESET(void) {

	// $[RTC_Init]
	RTC_Init_TypeDef init = RTC_INIT_DEFAULT;

	init.debugRun = 0;
	init.comp0Top = 0;

	RTC_Init(&init);
	// [RTC_Init]$

}

//================================================================================
// USART1_enter_DefaultMode_from_RESET
//================================================================================
extern void USART1_enter_DefaultMode_from_RESET(void) {

	// $[USART_InitAsync]
	// [USART_InitAsync]$

	// $[USART_InitSync]
	// [USART_InitSync]$

	// $[USART_InitPrsTrigger]
	// [USART_InitPrsTrigger]$

}

//================================================================================
// LEUART0_enter_DefaultMode_from_RESET
//================================================================================
extern void LEUART0_enter_DefaultMode_from_RESET(void) {

	// $[LEUART0 initialization]
	// [LEUART0 initialization]$

}

//================================================================================
// VCMP_enter_DefaultMode_from_RESET
//================================================================================
extern void VCMP_enter_DefaultMode_from_RESET(void) {

	// $[VCMP_Init]
	// [VCMP_Init]$

}

//================================================================================
// WDOG_enter_DefaultMode_from_RESET
//================================================================================
extern void WDOG_enter_DefaultMode_from_RESET(void) {

	// $[CMU_ClockEnable]
	// [CMU_ClockEnable]$

	// $[CMU_OscillatorEnable]
	// [CMU_OscillatorEnable]$

	// $[WDOG_Init]
	// [WDOG_Init]$

}

//================================================================================
// I2C0_enter_DefaultMode_from_RESET
//================================================================================
extern void I2C0_enter_DefaultMode_from_RESET(void) {

	// $[I2C0 initialization]
	I2C_Init_TypeDef init = I2C_INIT_DEFAULT;

	init.enable = 0;
	init.master = 1;
	init.freq = I2C_FREQ_FAST_MAX;
	init.clhr = i2cClockHLRAsymetric;
	I2C_Init(I2C0, &init);
	// [I2C0 initialization]$

}

//================================================================================
// TIMER0_enter_DefaultMode_from_RESET
//================================================================================
extern void TIMER0_enter_DefaultMode_from_RESET(void) {

	// $[TIMER0 initialization]
	// [TIMER0 initialization]$

	// $[TIMER0 CC0 init]
	// [TIMER0 CC0 init]$

	// $[TIMER0 CC1 init]
	// [TIMER0 CC1 init]$

	// $[TIMER0 CC2 init]
	// [TIMER0 CC2 init]$

}

//================================================================================
// TIMER1_enter_DefaultMode_from_RESET
//================================================================================
extern void TIMER1_enter_DefaultMode_from_RESET(void) {

	// $[TIMER1 initialization]
	// [TIMER1 initialization]$

	// $[TIMER1 CC0 init]
	// [TIMER1 CC0 init]$

	// $[TIMER1 CC1 init]
	// [TIMER1 CC1 init]$

	// $[TIMER1 CC2 init]
	// [TIMER1 CC2 init]$

}

//================================================================================
// PCNT0_enter_DefaultMode_from_RESET
//================================================================================
extern void PCNT0_enter_DefaultMode_from_RESET(void) {

	// $[PCNT0 initialization]
	// [PCNT0 initialization]$

}

//================================================================================
// PRS_enter_DefaultMode_from_RESET
//================================================================================
extern void PRS_enter_DefaultMode_from_RESET(void) {

	// $[PRS initialization]
	// [PRS initialization]$

}

//================================================================================
// PORTIO_enter_DefaultMode_from_RESET
//================================================================================
extern void PORTIO_enter_DefaultMode_from_RESET(void) {

	// $[Port A Configuration]

	/* Pin PA0 is configured to Open-drain with pull-up and filter */
	GPIO->P[0].MODEL = (GPIO->P[0].MODEL & ~_GPIO_P_MODEL_MODE0_MASK)
			| GPIO_P_MODEL_MODE0_WIREDANDPULLUPFILTER;

	/* Pin PA1 is configured to Open-drain with pull-up and filter */
	GPIO->P[0].MODEL = (GPIO->P[0].MODEL & ~_GPIO_P_MODEL_MODE1_MASK)
			| GPIO_P_MODEL_MODE1_WIREDANDPULLUPFILTER;
	// [Port A Configuration]$

	// $[Port B Configuration]
	// [Port B Configuration]$

	// $[Port C Configuration]
	// [Port C Configuration]$

	// $[Port D Configuration]
	// [Port D Configuration]$

	// $[Port E Configuration]

	/* Port E drive strength set to High (20 mA) */
	GPIO->P[4].CTRL = (GPIO->P[4].CTRL & ~_GPIO_P_CTRL_DRIVEMODE_MASK)
			| GPIO_P_CTRL_DRIVEMODE_HIGH;

	/* Pin PE11 is configured to Open-drain with alt. drive strength */
	GPIO->P[4].MODEH = (GPIO->P[4].MODEH & ~_GPIO_P_MODEH_MODE11_MASK)
			| GPIO_P_MODEH_MODE11_WIREDANDDRIVE;
	// [Port E Configuration]$

	// $[Port F Configuration]
	// [Port F Configuration]$

	// $[Route Configuration]

	/* Enable signals SCL, SDA */
	I2C0->ROUTE |= I2C_ROUTE_SCLPEN | I2C_ROUTE_SDAPEN;
	// [Route Configuration]$

}

