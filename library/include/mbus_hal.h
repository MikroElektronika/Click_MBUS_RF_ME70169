/****************************************************************************
* Title                 :   M-Bus HAL
* Filename              :   mbus_hal.h
* Author                :   CAL
* Origin Date           :   06/01/2016
* Notes                 :   None
*****************************************************************************/
/**************************CHANGE LIST **************************************
*
*    Date    Software Version    Initials       Description
*  06/01/16       1.0.0             CAL        Module Created.
*
*****************************************************************************/
/**
 * @file mbus_hal.h
 * @brief M-Bus HAL layer
 *
 * @par
 * HAL layer for M-Bus Click
 */
#ifndef MBUS_HAL_H
#define MBUS_HAL_H
/******************************************************************************
* Includes
*******************************************************************************/
#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>
/******************************************************************************
* Preprocessor Constants
*******************************************************************************/

/******************************************************************************
* Configuration Constants
*******************************************************************************/

/******************************************************************************
* Macros
*******************************************************************************/

/******************************************************************************
* Typedefs
*******************************************************************************/

/******************************************************************************
* Variables
*******************************************************************************/

/******************************************************************************
* Function Prototypes
*******************************************************************************/
#ifdef __cplusplus
extern "C" {
#endif

/**
 * @brief Hardware Reset
 *
 * @par
 * Resets the module via RST PIN
 */
void mbus_hal_reset( void );

/**
 * @brief RTS
 *
 * @par
 * Hardware flow control of sending data
 *
 * @retval RTS pin state
 */
bool mbus_tx_ctl( void );

/**
 * @brief CTS
 *
 * @par
 * Hardware flow control of incoming data
 *
 * @param[in] state of CTS
 */
void mbus_rx_ctl( bool state );

/**
 * @brief HAL Initialization
 *
 * Hal layer initialization. Must be called before any other function.
 */
void mbus_hal_init( void );

/**
 * @brief HAL Write Text
 *
 * @par
 * Writes data through UART bus
 *
 * @param[in] buffer
 */
void mbus_hal_write_text( uint8_t *buffer );

/**
 * @brief HAL Write
 *
 * @par
 * Writes data through UART bus
 *
 * @param[in] buffer
 */
void mbus_hal_write( uint8_t buffer );

#ifdef __cplusplus
} // extern "C"
#endif

#endif /* MBUS_HAL_H_ */
/*** End of File **************************************************************/