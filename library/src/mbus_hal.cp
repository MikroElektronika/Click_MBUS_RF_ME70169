#line 1 "//VBOXSVR/corey/Projects/ClickLibraries/MBus_click/library/src/mbus_hal.c"
#line 1 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hal.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"





typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed long int int_fast8_t;
typedef signed long int int_fast16_t;
typedef signed long int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned long int uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed long int intptr_t;
typedef unsigned long int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdbool.h"



 typedef char _Bool;
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stddef.h"



typedef long ptrdiff_t;


 typedef unsigned long size_t;

typedef unsigned long wchar_t;
#line 62 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hal.h"
void mbus_hal_reset( void );
#line 72 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hal.h"
 _Bool  mbus_tx_ctl( void );
#line 82 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hal.h"
void mbus_rx_ctl(  _Bool  state );
#line 89 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hal.h"
void mbus_hal_init( void );
#line 99 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hal.h"
void mbus_hal_write_text( uint8_t *buffer );
#line 109 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hal.h"
void mbus_hal_write( uint8_t buffer );
#line 40 "//VBOXSVR/corey/Projects/ClickLibraries/MBus_click/library/src/mbus_hal.c"
static void ( *write_uart_p ) ( unsigned int data_out );
static void ( *write_uart_text_p ) ( unsigned char *text );
#line 58 "//VBOXSVR/corey/Projects/ClickLibraries/MBus_click/library/src/mbus_hal.c"
extern sfr sbit MBUS_RST;
extern sfr sbit MBUS_RTS;
extern sfr sbit MBUS_CTS;
#line 69 "//VBOXSVR/corey/Projects/ClickLibraries/MBus_click/library/src/mbus_hal.c"
void mbus_hal_reset( void )
{
#line 78 "//VBOXSVR/corey/Projects/ClickLibraries/MBus_click/library/src/mbus_hal.c"
 MBUS_RST = 1;
 Delay_ms( 100 );
 MBUS_RST = 0;
 Delay_ms( 2500 );
 MBUS_RST = 1;
 Delay_ms( 500 );

}

 _Bool  mbus_tx_ctl()
{
#line 96 "//VBOXSVR/corey/Projects/ClickLibraries/MBus_click/library/src/mbus_hal.c"
 if ( MBUS_RTS == 0 )
 return  1 ;
 else
 return  0 ;

}

void mbus_rx_ctl(  _Bool  state )
{
#line 112 "//VBOXSVR/corey/Projects/ClickLibraries/MBus_click/library/src/mbus_hal.c"
 if ( state )
 MBUS_CTS = 0;
 else
 MBUS_CTS = 1;

}

void mbus_hal_init()
{
#line 128 "//VBOXSVR/corey/Projects/ClickLibraries/MBus_click/library/src/mbus_hal.c"
 write_uart_p = UART_Wr_Ptr;
 write_uart_text_p = UART_Write_Text;

 MBUS_RST = 0;
 Delay_ms(10);
 MBUS_RST = 1;
 Delay_ms(100);


 mbus_rx_ctl(  1  );


}

void mbus_hal_write_text( uint8_t *buffer )
{
#line 151 "//VBOXSVR/corey/Projects/ClickLibraries/MBus_click/library/src/mbus_hal.c"
 while( !mbus_tx_ctl() );

 write_uart_text_p( buffer );




}

void mbus_hal_write( uint8_t buffer )
{
#line 169 "//VBOXSVR/corey/Projects/ClickLibraries/MBus_click/library/src/mbus_hal.c"
 while( !mbus_tx_ctl() );

 write_uart_p( buffer );

}
