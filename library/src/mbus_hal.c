/*******************************************************************************
* Title                 :   M-Bus HAL
* Filename              :   mbus_hal.c
* Author                :   CAL
* Origin Date           :   06/01/2016
* Notes                 :   None
*******************************************************************************/
/*************** MODULE REVISION LOG ******************************************
*
*    Date    Software Version    Initials       Description
*  06/01/16       1.0.0             CAL        Module Created.
*
*******************************************************************************/
/**
 * @file mbus_hal.c
 * @brief M-Bus HAL layer
 */
/******************************************************************************
* Includes
*******************************************************************************/
#include "mbus_hal.h"
/******************************************************************************
* Module Preprocessor Constants
*******************************************************************************/

/******************************************************************************
* Module Preprocessor Macros
*******************************************************************************/

/******************************************************************************
* Module Typedefs
*******************************************************************************/

/******************************************************************************
* Module Variable Definitions
*******************************************************************************/
#if defined( __MIKROC_PRO_FOR_ARM__ )       || \
    defined( __MIKROC_PRO_FOR_DSPIC__ )     || \
    defined( __MIKROC_PRO_FOR_PIC32__ )
static void         ( *write_uart_p )           ( unsigned int data_out );
static void         ( *write_uart_text_p )      ( unsigned char *text );

#elif defined( __MIKROC_PRO_FOR_AVR__ )     || \
      defined( __MIKROC_PRO_FOR_PIC__ )     || \
      defined( __MIKROC_PRO_FOR_8051__ )    || \
      defined( __MIKROC_PRO_FOR_FT90x__ )
static void         ( *write_uart_p )           ( unsigned char data_out );
static void         ( *write_uart_text_p )      ( unsigned char *text );
#endif

#if defined( __MIKROC_PRO_FOR_ARM__ )     || \
    defined( __MIKROC_PRO_FOR_AVR__ )     || \
    defined( __MIKROC_PRO_FOR_PIC__ )     || \
    defined( __MIKROC_PRO_FOR_PIC32__ )   || \
    defined( __MIKROC_PRO_FOR_DSPIC__ )   || \
    defined( __MIKROC_PRO_FOR_8051__ )    || \
    defined( __MIKROC_PRO_FOR_FT90x__ )
extern sfr sbit MBUS_RST;
extern sfr sbit MBUS_RTS;
extern sfr sbit MBUS_CTS;
#endif
/******************************************************************************
* Function Prototypes
*******************************************************************************/

/******************************************************************************
* Function Definitions
*******************************************************************************/
void mbus_hal_reset( void )
{
#if defined( __MIKROC_PRO_FOR_ARM__ )   || \
    defined( __MIKROC_PRO_FOR_AVR__ )   || \
    defined( __MIKROC_PRO_FOR_DSPIC__ ) || \
    defined( __MIKROC_PRO_FOR_PIC32__ ) || \
    defined( __MIKROC_PRO_FOR_8051__ )  || \
    defined( __MIKROC_PRO_FOR_FT90x__ ) || \
    defined( __MIKROC_PRO_FOR_PIC__ )
    MBUS_RST = 1;
    Delay_ms( 100 );
    MBUS_RST = 0;
    Delay_ms( 2500 );
    MBUS_RST = 1;
    Delay_ms( 500 );
#endif
}

bool mbus_tx_ctl()
{
#if defined( __MIKROC_PRO_FOR_ARM__ )   || \
    defined( __MIKROC_PRO_FOR_AVR__ )   || \
    defined( __MIKROC_PRO_FOR_DSPIC__ ) || \
    defined( __MIKROC_PRO_FOR_PIC32__ ) || \
    defined( __MIKROC_PRO_FOR_8051__ )  || \
    defined( __MIKROC_PRO_FOR_FT90x__ ) || \
    defined( __MIKROC_PRO_FOR_PIC__ )
    if ( MBUS_RTS == 0 )
        return true;
    else
        return false;
#endif
}

void mbus_rx_ctl( bool state )
{
#if defined( __MIKROC_PRO_FOR_ARM__ )   || \
    defined( __MIKROC_PRO_FOR_AVR__ )   || \
    defined( __MIKROC_PRO_FOR_DSPIC__ ) || \
    defined( __MIKROC_PRO_FOR_PIC32__ ) || \
    defined( __MIKROC_PRO_FOR_8051__ )  || \
    defined( __MIKROC_PRO_FOR_FT90x__ ) || \
    defined( __MIKROC_PRO_FOR_PIC__ )
    if ( state )
        MBUS_CTS = 0;
    else
        MBUS_CTS = 1;
#endif
}

void mbus_hal_init()
{
#if defined( __MIKROC_PRO_FOR_ARM__ )   || \
    defined( __MIKROC_PRO_FOR_AVR__ )   || \
    defined( __MIKROC_PRO_FOR_DSPIC__ ) || \
    defined( __MIKROC_PRO_FOR_PIC32__ ) || \
    defined( __MIKROC_PRO_FOR_8051__ )  || \
    defined( __MIKROC_PRO_FOR_FT90x__ ) || \
    defined( __MIKROC_PRO_FOR_PIC__ )
    write_uart_p            = UART_Wr_Ptr;
    write_uart_text_p       = UART_Write_Text;

    MBUS_RST = 0;
    Delay_ms(10);
    MBUS_RST = 1;
    Delay_ms(100);

#endif
    mbus_rx_ctl( true );


}

void mbus_hal_write_text( uint8_t *buffer )
{
#if defined( __MIKROC_PRO_FOR_ARM__ )   || \
    defined( __MIKROC_PRO_FOR_AVR__ )   || \
    defined( __MIKROC_PRO_FOR_DSPIC__ ) || \
    defined( __MIKROC_PRO_FOR_PIC32__ ) || \
    defined( __MIKROC_PRO_FOR_8051__ )  || \
    defined( __MIKROC_PRO_FOR_FT90x__ ) || \
    defined( __MIKROC_PRO_FOR_PIC__ )
    while( !mbus_tx_ctl() );                        /**< Wait for clear to send */

    write_uart_text_p( buffer );
    //UART1_Write_Text( "Writing " );               /**< UARTs were for debugging */
    //UART1_Write_Text( buffer );
    //UART1_Write_Text( "\r\n" );
#endif
}

void mbus_hal_write( uint8_t buffer )
{
#if defined( __MIKROC_PRO_FOR_ARM__ )   || \
    defined( __MIKROC_PRO_FOR_AVR__ )   || \
    defined( __MIKROC_PRO_FOR_DSPIC__ ) || \
    defined( __MIKROC_PRO_FOR_PIC32__ ) || \
    defined( __MIKROC_PRO_FOR_8051__ )  || \
    defined( __MIKROC_PRO_FOR_FT90x__ ) || \
    defined( __MIKROC_PRO_FOR_PIC__ )
    while( !mbus_tx_ctl() );                        /**< Wait for clear to send */

    write_uart_p( buffer );
#endif
}

/*************** END OF FUNCTIONS ***************************************************************************/