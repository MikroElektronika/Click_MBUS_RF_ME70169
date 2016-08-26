#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>
#include "mbus_hw.h"

#define BUFFER_SIZE 300

sbit MBUS_RST    at GPIOC_ODR.B2;
sbit MBUS_RTS    at GPIOD_ODR.B13;
sbit MBUS_CTS    at GPIOD_ODR.B10;

bool response_finished;
bool ok_response;
bool my_receive_flag = false;

void system_setup( void );
void clear_serial_buffer( void );
void flags_false( void );
void clear_transmit_buffer( transmit_frame_t *transmit_frame );
void check_status( status_t status );

void main()
{
    //Local Declarations
    uint8_t status = 0;
    char long_text[100] = { 0 };
    uint8_t buffer[20] = { 0 };
    uint16_t threshold = 0;
    uint8_t serial_num_buff[20] = { 0 };
    uint8_t new_meter[6] = { 0, 1, 2, 3, 4, 5 };
    uint8_t received_meter[8] = { 0 };
    date_time_t my_time;
    transmit_frame_t *transmit_frame;


    // Malloc space for the Transmit Frame
    MM_Init();
    transmit_frame = Malloc( sizeof( transmit_frame_t ) );
    // Setup GPIOs, communication pins, interrupts, e.t.c.
    system_setup();
    
    
    //Initialize Conifguration Mode
    UART1_Write_Text( "\r\n\r\n\r\n" );
    UART1_Write_Text( "Entering Config Mode\r\n" );
    check_status( mbus_at_init() );
    
    // Get firmware bootloader
    UART1_Write_Text( "Getting Firmware Version\r\n" );
    check_status( mbus_get_firmware_bootloader_vers( buffer ) );
    UART1_Write_Text( buffer );
    UART1_Write_Text( "\r\n" );
    
    // Get single channel lbt delay
    UART1_Write_Text( "LBT Delay: " );
    mbus_get_single_channel_lbt_delay( &threshold );
    LongToStr( threshold, buffer );
    UART1_Write_Text( buffer );
    UART1_Write_Text( "\r\n" );
    
    // Set Date / Time
    my_time.month  = 7;
    my_time.day    = 21;
    my_time.hour   = 14;
    my_time.minute = 30;
    my_time.year   = 16;
    my_time.second = 27;
    UART1_Write_Text( "Setting Date / Time\r\n" );
    check_status( mbus_set_date_time( &my_time ) );

    // Get Date / Time
    UART1_Write_Text( "Getting Date / Time\r\n" );
    status = mbus_get_date_time( &my_time );
    if ( status == OK_STATUS )
    {
        sprintf( buffer, "Date Month is: %d", my_time.month );
        UART1_Write_Text( buffer );
        UART1_Write_Text( "\r\n" );
        sprintf( buffer, "Date Hour is: %d", my_time.hour );
        UART1_Write_Text( buffer );
        UART1_Write_Text( "\r\n" );
        sprintf( buffer, "Date Year is: %d", my_time.year );
        UART1_Write_Text( buffer );
        UART1_Write_Text( "\r\n" );
        sprintf( buffer, "Date Day is: %d", my_time.day );
        UART1_Write_Text( buffer );
        UART1_Write_Text( "\r\n" );
        sprintf( buffer, "Date Minute is: %d", my_time.minute );
        UART1_Write_Text( buffer );
        UART1_Write_Text( "\r\n" );
        sprintf( buffer, "Date Second is: %d", my_time.second );
        UART1_Write_Text( buffer );
        UART1_Write_Text( "\r\n" );
    }
    else
        UART1_Write_Text( "Not Successful getting of the date\r\n" );

    // Get Serial Number
    UART1_Write_Text( "Getting Serial Number\r\n" );
    check_status( mbus_get_serial_number( serial_num_buff ) );
    UART1_Write_Text( serial_num_buff );
    UART1_Write_Text( "\r\n" );
    
    // Get RX / TX Pins
    UART1_Write_Text( "Getting RX/TX Pins\r\n" );
    check_status( mbus_get_tx_rx_pins( buffer ) );
    UART1_Write_Text( buffer );
    UART1_Write_Text( "\r\n" );
    
    // Set MBUS Mode
    UART1_Write_Text( "Setting MBUS Mode\r\n" );
    check_status( mbus_set_mbus_mode( ROLE_N1_METER ) );
    
    // Set RX / TX formats
    check_status( mbus_set_serial_tx_format( LENGTH_TX ) );   // TX Format must have Length.. so that sending / receiving works properly
    
    // Add a meter
    UART1_Write_Text( "Testing Address Setting...\r\n" );
    sprintf( long_text, "Sent address is: %d %d %d %d %d %d \r\n", new_meter[0], new_meter[1], \
             new_meter[2], new_meter[3], \
             new_meter[4], new_meter[5] );
    UART1_Write_Text( long_text );
    mbus_set_meter_address( new_meter );        //Test setting a meter
    mbus_get_meter_address( received_meter );   //Test getting a meter
    sprintf( long_text, "Received address is: %d %d %d %d %d %d \r\n", received_meter[0], received_meter[1], \
             received_meter[2], received_meter[3], \
             received_meter[4], received_meter[5] );
    UART1_Write_Text( long_text );
    UART1_Write_Text( "Now Adding Meter...\r\n" );
    status = mbus_add_edit_meter( DONT_FILTER, new_meter, 0, NO_ENCRYPT, NULL );
    if ( status == ERROR )
        UART1_Write_Text( "ERROR OCCURRED!\r\n" );
    else
        UART1_Write_Text( "Successful Meter Add!\r\n" );
        
    //Try sending some data...
    UART1_Write_Text( "\r\n\r\n Sending Frame Of Data...\r\n\r\n" );
    // Set OP Mode
    check_status( mbus_op_init() );
    //Send Frame
    sprintf( transmit_frame->data_field, "My Name is Corey Allen Lakey and I am %d Years Old.", 21 );
    transmit_frame->length_field = strlen( transmit_frame->data_field );
    UART1_Write_Text( transmit_frame->data_field );
    mbus_send_frame( transmit_frame, 1 );              /**< Using length field for TX format, so not length needed */

    while ( 1 );
}

void check_status( status_t status )
{
    if ( status == OK_STATUS )
        UART1_Write_Text( "OK Status\r\n" );
    else
        UART1_Write_Text( "Error Occurred\r\n" );
}

void system_setup( void )
{
    GPIO_Digital_Output( &GPIOC_BASE, _GPIO_PINMASK_2  );       /**< Reset pin Output */

    UART1_Init_Advanced( 9600,  _UART_8_BIT_DATA,               /**< UART for Terminal */
                         _UART_NOPARITY,
                         _UART_ONE_STOPBIT,
                         &_GPIO_MODULE_USART1_PA9_10 );
    Delay_ms(300);

    UART3_Init_Advanced( 19200, _UART_8_BIT_DATA,               /**< UART for MBus */
                         _UART_NOPARITY,
                         _UART_ONE_STOPBIT,
                         &_GPIO_MODULE_USART3_PD89);
    Delay_ms(1000);
    UART1_Write_Text("*******************************************\r\n" );
    UART1_Write_Text("************* Setup Transmitter ***********\r\n" );
    UART1_Write_Text("              Uart initialized             \r\n");
    UART1_Write_Text("                 Uarts ready               \r\n" );
    UART1_Write_Text("            Starting Transmission          \r\n" );
    UART1_Write_Text("*******************************************\r\n" );
    UART1_Write_Text("*******************************************\r\n" );
    mbus_init();                                                /**< Initialize MBus HAL Layer */
    UART1_Write_Text("**** MBus Click Test Initialized." );
    Delay_ms(500);
    UART1_Write_Text( "." );
    Delay_ms(500);
    UART1_Write_Text( "." );
    Delay_ms(500);
    UART1_Write_Text( "    ****\r\n" );

    RXNEIE_USART3_CR1_bit = 1;
    NVIC_IntEnable( IVT_INT_USART3 );
    EnableInterrupts();
}

void clear_transmit_buffer( transmit_frame_t *transmit_frame )
{
    uint8_t i = 0;

    for ( i = 0; i < 100; i++ )
        transmit_frame->data_field[i] = 0;
}

void LO_RX_ISR() iv IVT_INT_USART3 ics ICS_AUTO
{
    mbus_rx_isr( USART3_DR );
}