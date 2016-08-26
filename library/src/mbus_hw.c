/****************************************************************************
* Title                 :   M-Bus CLICK
* Filename              :   mbus_hw.c
* Author                :   CAL
* Origin Date           :   06/01/2016
* Notes                 :   Hardware layer
*****************************************************************************/
/**************************CHANGE LIST **************************************
*
*    Date    Software Version    Initials     Description
*  06/01/16       .1               CAL     Interface Created.
*
*****************************************************************************/
/**
 * @file mbus_hw.c
 * @brief Hardware Layer
 */
/******************************************************************************
* Includes
*******************************************************************************/
#include <stdint.h>
#include <stddef.h>                                 
#include "mbus_hw.h"
#include "mbus_hal.h"
/******************************************************************************
* Module Preprocessor Constants
*******************************************************************************/
#define RX_BUFFER_SIZE 300
#define TX_BUFFER_SIZE 245
/******************************************************************************
* Module Preprocessor Macros
*******************************************************************************/

/******************************************************************************
* Module Typedefs
*******************************************************************************/

/******************************************************************************
* Module Variable Definitions
*******************************************************************************/
static uint8_t tx_buffer[ TX_BUFFER_SIZE ] = { 0 };             /**< Buffer used for Transmitting frames over UART -> RF */
extern bool my_receive_flag;                                    /**< Receive flag for user to use for polling */
static char creturn = 13;                                       /**< Carriage Return for end of transmitting        */
static receive_frame_format_t receive_frame_format;             /**< Receive frame format.. ( Starts at default all false ) */
static transmit_frame_format_t transmit_frame_format;           /**< Transmit frame format.. ( Starts at default all false ) */
static uint8_t rx_buffer[ RX_BUFFER_SIZE ] = { 0 };             /**< Buffer used for Receiving frames over UART <- RF */
static uint16_t rx_buffer_cnt = 0;                              /**< Counter for iterating through rx_buffer */
static bool configuration;                                      /**< Used for ISR to distinguish between AT(configuration = true) mode and Operating mode */
static bool response_finished = false;                          /**< Used to tell the rest of the module when the receive_frame has been received by the user */
/******************************************************************************
* Function Prototypes
*******************************************************************************/

/******************************************************************************
* Private Function Definitions
*******************************************************************************/
static status_t mbus_read_reg( uint8_t *buffer );                               /**< *buffer filled with command string for AT register reading */
static status_t mbus_write_reg( uint8_t *buffer );                              /**< *buffer filled with command string for AT register writing */
static void mbus_update_rx_format( serial_rx_format_t format );                 /**< Used to update rx_format to let rest of module know what to expect when receiving a frame */
static void mbus_update_tx_format( serial_tx_format_t format );                 /**< Used to update tx_format to let rest of module know what to send when transmitting frames */
static void mbus_set_formats_false( void );                                     /**< Sets all rx / tx formats to false */
static void reset_flags_buffers( void );                                        /**< Resets response_finished flag, rx_buffer_cnt to 0, and all of rx_buffer to 0 */
static status_t set_time_buffer( date_time_t *date, uint8_t *temp_buffer );     /**< Sets temp_buffer to correct format for setting date on Telit module, with data from *date */
static void get_register_contents( uint8_t *buffer );                           /**< Gets register contents after a read command */
static void get_register_contents_long( uint16_t *buffer );                     /**< Same as get_register_contents but gets 16 bits of data */
//static void _write( char *data_ );                                            /**< Used to ensure correct stepping through array ( pic ) */
/******************************************************************************
* Public Function Definitions
*******************************************************************************/
static status_t mbus_read_reg( uint8_t *buffer )
{
    mbus_hal_write_text( buffer );                                  /**< Register to Read */
    mbus_hal_write( creturn );                                      /**< Carriage Return */
    return OK_STATUS;
}

static status_t mbus_write_reg( uint8_t *buffer )
{
    mbus_hal_write_text( buffer );                                  /**< Register + Data to write to register */
    mbus_hal_write( creturn );                                      /**< Carriage Return */
    return OK_STATUS;
}

static void mbus_update_tx_format( serial_tx_format_t format )
{
    if ( format & CI_FIELD_TX )                     /**< Update all formats */
        transmit_frame_format.ci_field = true;
    else
        transmit_frame_format.ci_field = false;
    if ( format & A_FIELD_TX )
        transmit_frame_format.a_field = true;
    else
        transmit_frame_format.a_field = false;
    if ( format & M_FIELD_TX )
        transmit_frame_format.m_field = true;
    else
        transmit_frame_format.m_field = false;
    if ( format & C_FIELD_TX )
        transmit_frame_format.c_field = true;
    else
        transmit_frame_format.c_field = false;
    if ( format & LENGTH_TX )
        transmit_frame_format.length_field = true;
    else
        transmit_frame_format.length_field = false;
}

static void mbus_update_rx_format( serial_rx_format_t format )
{
    if ( format & RSSI_RX )                         /**< Update all formats */
        receive_frame_format.rssi_field = true;
    else
        receive_frame_format.rssi_field = false;
    if ( format & WAKEUP_CHAR_RX )
        receive_frame_format.wake_up_field = true;
    else
        receive_frame_format.wake_up_field = false;
    if ( format & LQI_RX )
        receive_frame_format.lqi_field = true;
    else
        receive_frame_format.lqi_field = false;
    if ( format & CI_FIELD_RX )
        receive_frame_format.ci_field = true;
    else
        receive_frame_format.ci_field = false;
    if ( format & A_FIELD_RX )
        receive_frame_format.a_field = true;
    else
        receive_frame_format.a_field = false;
    if ( format & M_FIELD_RX )
        receive_frame_format.m_field = true;
    else
        receive_frame_format.m_field = false;
    if ( format & C_FIELD_RX )
        receive_frame_format.c_field = true;
    else
        receive_frame_format.c_field = false;
    if ( format & LENGTH_RX )
        receive_frame_format.length_field = true;
    else
        receive_frame_format.length_field = false;
}

static void mbus_set_formats_false( void )
{
    receive_frame_format.wake_up_field      = false;
    receive_frame_format.length_field       = false;
    receive_frame_format.c_field            = false;
    receive_frame_format.m_field            = false;
    receive_frame_format.a_field            = false;
    receive_frame_format.ci_field           = false;
    receive_frame_format.lqi_field          = false;
    receive_frame_format.rssi_field         = false;
    receive_frame_format.freq_offset_field  = false;
    transmit_frame_format.length_field      = false;
    transmit_frame_format.c_field           = false;
    transmit_frame_format.m_field           = false;
    transmit_frame_format.a_field           = false;
    transmit_frame_format.ci_field          = false;
}

static void reset_flags_buffers( void )
{
    uint16_t i = 0;

    for ( i = 0; i < RX_BUFFER_SIZE; i++ )
        rx_buffer[i] = 0;

    rx_buffer_cnt = 0;
    response_finished = false;
}

static status_t set_time_buffer( date_time_t *date, uint8_t *temp_buffer )
{
    char tmp[10] = { 0 };

    if ( date->month < 10 && date->month > 0 )          /**< Set Month if Month is less than 13 and greater than 0 */ 
    {
        ByteToStr( date->month, tmp );
        Ltrim( tmp );
        tmp[1] = tmp[0];
        tmp[0] = '0';
        strncat( temp_buffer, tmp, 2 );
    }
    else if ( date->month >= 10 && date->month < 13 )
    {
        ByteToStr( date->month, tmp );
        Ltrim( tmp );
        strncat( temp_buffer, tmp, 2 );
    }
    else return ERROR;
    tmp[0] = 0;
    tmp[1] = 0;
    tmp[2] = 0;

    if ( date->day < 10 && date->day > 0 )              /**< Set Day if Day is less than 32 and greater than 0 */
    {
        ByteToStr( date->day, tmp );
        Ltrim( tmp );
        tmp[1] = tmp[0];
        tmp[0] = '0';
        strncat( temp_buffer, tmp, 2 );
    }
    else if ( date->day >= 10 && date->day < 32 )
    {
        ByteToStr( date->day, tmp );
        Ltrim( tmp );
        strncat( temp_buffer, tmp, 2 );
    }
    else return ERROR;
    tmp[0] = 0;
    tmp[1] = 0;
    tmp[2] = 0;

    if ( date->hour < 10 && date->hour >= 0 )           /**< Set Hour if Hour is less than 24 and greater than or equal to 0 */
    {
        ByteToStr( date->hour, tmp );
        Ltrim( tmp );
        tmp[1] = tmp[0];
        tmp[0] = '0';
        strncat( temp_buffer, tmp, 2 );
    }
    else if ( date->hour >= 10 && date->hour < 24 )
    {
        ByteToStr( date->hour, tmp );
        Ltrim( tmp );
        strncat( temp_buffer, tmp, 2 );
    }
    else return ERROR;
    tmp[0] = 0;
    tmp[1] = 0;
    tmp[2] = 0;

    if ( date->minute < 10 && date->minute >= 0 )       /**< Set Minute if Minute is less than 60 and greater than or equal to 0 */
    {
        ByteToStr( date->minute, tmp );
        Ltrim( tmp );
        tmp[1] = tmp[0];
        tmp[0] = '0';
        strncat( temp_buffer, tmp, 2 );
    }
    else if ( date->minute >= 10 && date->minute < 60 )
    {
        ByteToStr( date->minute, tmp );
        Ltrim( tmp );
        strncat( temp_buffer, tmp, 2 );
    }
    else return ERROR;
    tmp[0] = 0;
    tmp[1] = 0;
    tmp[2] = 0;

    if ( date->year < 10 && date->year >= 5 )           /**< Set Year if Year is less than 100 and greater than or equal to 5*/
    {
        ByteToStr( date->year, tmp );
        Ltrim( tmp );
        tmp[1] = tmp[0];
        tmp[0] = '0';
        strncat( temp_buffer, tmp, 2 );
    }
    else if ( date->year >= 10 && date->year < 100 )
    {
        ByteToStr( date->year, tmp );
        Ltrim( tmp );
        strncat( temp_buffer, tmp, 2 );
    }
    else return ERROR;
    tmp[0] = 0;
    tmp[1] = 0;
    tmp[2] = 0;

    if ( date->second < 10 && date->second >= 0 )       /**< Set Second if Second is less than 60 and greater than or equal to 0 */
    {
        ByteToStr( date->second, tmp );
        Ltrim( tmp );
        tmp[1] = tmp[0];
        tmp[0] = '0';
        strncat( temp_buffer, tmp, 2 );
    }
    else if ( date->second >= 10 && date->second < 60 )
    {
        ByteToStr( date->second, tmp );
        Ltrim( tmp );
        strncat( temp_buffer, tmp, 2 );
    }
    else return ERROR;
    tmp[0] = 0;
    tmp[1] = 0;
    tmp[2] = 0;

    return OK_STATUS;
}

static void get_register_contents( uint8_t *buffer )
{
    uint8_t i = 0;
    uint8_t end = 0;
    char str[6] = { 0 };

    while ( rx_buffer[rx_buffer_cnt] != '=' )       /**< Format of registers after a requested read is ATSn=m */
    {                                               /**< So here, we find the equals sign.. count the characters between.. */
        rx_buffer_cnt--;
        end++;
    }
    rx_buffer_cnt++;
    end--;

    while ( end )                                   /**< Put those characters into a string */
    {
        str[i++] = rx_buffer[rx_buffer_cnt++];
        end--;
    }
    str[i] = 0;
    *buffer = atoi( str );                          /**< Convert the ascii to a integer */

}

static void get_register_contents_long( uint16_t *buffer )
{
    uint8_t i = 0;
    uint8_t end = 0;
    char str[6] = { 0 };

    while ( rx_buffer[rx_buffer_cnt] != '=' )       /**< Same as get_register_contents except... */
    {
        rx_buffer_cnt--;
        end++;
    }
    rx_buffer_cnt++;
    end--;

    while ( end )
    {
        str[i++] = rx_buffer[rx_buffer_cnt++];
        end--;
    }
    str[i] = NULL;
    *buffer = atol( str );                          /**< Convert the ascii to a long instead of integer */
}

/*static void _write( char *data_ )
{
    while( *data_ )
    {
        if( mbus_tx_ctl() )
            mbus_hal_write( *data_++ );
    }
}*/

void mbus_rx_isr( char rx_input )
{
    rx_buffer[rx_buffer_cnt++] = rx_input;

    if ( !configuration )
    {
        if ( rx_buffer_cnt >= rx_buffer[0] + 1 )
        {
            response_finished = true;
            my_receive_flag = true;
        }
    }
    else if ( configuration )
    {
        if ( rx_input == 13 )
        {
            response_finished = true;
            rx_buffer[--rx_buffer_cnt] = NULL;      /**< Set the Carriage return to a null */
        }
    }
    if( rx_buffer_cnt >= RX_BUFFER_SIZE )           /**< If the buffer is full, wait to give me more data */
        mbus_rx_ctl( false );
    else
        mbus_rx_ctl( true );

}

void mbus_init()
{
    mbus_hal_init();                                /**< HAL initialization ( UART Comm., GPIO Externs, Reset )        */
    mbus_set_formats_false();
}

status_t mbus_at_init( void )
{
    configuration = true;
    reset_flags_buffers();

    //_write( ( char* )AT_MODE );                     /**< Initializes AT Mode */
    mbus_hal_write_text( AT_MODE );

    while ( !response_finished );                   /**< Wait for response */

    if ( rx_buffer[0] == 'O' && rx_buffer[1] == 'K' )
    {
        reset_flags_buffers();
        return OK_STATUS;
    }
    else
    {
        reset_flags_buffers();
        return ERROR;
    }
}

status_t mbus_op_init( void )
{
    reset_flags_buffers();

    //_write( ( char* )OP_MODE );
    //_write( &creturn );

    mbus_hal_write_text( OP_MODE );               /**< Initializes Modems Operating Mode */
    mbus_hal_write( creturn );                    /**< Carriage Return */

    while ( !response_finished );                   /**< Wait for response */

    configuration = false;
    if ( rx_buffer[0] == 'E' )
    {
        reset_flags_buffers();
        return ERROR;
    }
    else
    {
        reset_flags_buffers();
        return OK_STATUS;
    }
}

status_t mbus_get_firmware_bootloader_vers( uint8_t *version )
{
    reset_flags_buffers();

    //_write( ( char* )FIRMWARE_READ );
    //_write( &creturn );
    mbus_hal_write_text( FIRMWARE_READ );           /**< Requests Firmware / Bootloader Data */
    mbus_hal_write( creturn );                      /**< Carriage Return */

    while ( !response_finished );

    strcpy( version, rx_buffer );

    return OK_STATUS;
}

/*
status_t mbus_read_reg_new( const char *reg, uint8_t *reg_data )
{
        uint8_t count = 0;
        uint8_t i = 0;
        uint8_t buffer[8] = REG_READ;

        strcat( buffer, reg );
        strcat( buffer, REG_READ_END );
        mbus_hal_write_text( buffer );
        mbus_hal_write( creturn );

        while( !response_finished );                            /**< Wait for response */

/*   while( rx_buffer[( rx_buffer_cnt - 1 )] != '=' )
   {
           count++;
           rx_buffer_cnt--;
   }

   while( count-- )
           reg_data[i++] = rx_buffer[rx_buffer_cnt++];

   reset_flags_buffers();
   return OK_STATUS;
}*/
/*
status_t mbus_write_reg_new( const char *reg, uint8_t *reg_data )
{

}*/
/*
void mbus_command( const char *CMD )
{
        mbus_hal_write_text( CMD );
}*/

status_t mbus_reset_params( void )
{
    reset_flags_buffers();
   

    //_write( ( char* )RESET_MODEM_PARAM );
    //_write( &creturn );
    mbus_hal_write_text( RESET_MODEM_PARAM );       /**< Tells MBus to reset Modem Params */
    mbus_hal_write( creturn );                      /**< Carriage Return */

    while ( !response_finished );

    if ( rx_buffer[0] != 'O' )
        return ERROR;

    mbus_set_formats_false();

    return OK_STATUS;
}

status_t mbus_reset_meters_list( void )
{
    reset_flags_buffers();

    //_write( ( char* )RESET_REGISTERED_METER );
    //_write( &creturn );
    mbus_hal_write_text( RESET_REGISTERED_METER );  /**< Tells MBus to reset Registered Meters */
    mbus_hal_write( creturn );

    while ( !response_finished );

    if ( rx_buffer[0] != 'O' )
        return ERROR;

    return OK_STATUS;
}

status_t mbus_run_bootloader( void )
{
    reset_flags_buffers();

    //_write( ( char* )RUN_BOOTLOADER );
    //_write( &creturn );
    mbus_hal_write_text( RUN_BOOTLOADER );          /**< Runs the Bootloader */
    mbus_hal_write( creturn );                      /**< Carriage Return */

    while ( !response_finished );

    if ( rx_buffer[0] != 'O' )
        return ERROR;

    return OK_STATUS;
}

status_t mbus_set_date_time( date_time_t *date )
{
    uint8_t buffer[20] = { 0 };
    uint8_t temp_buffer[20] = { 0 };
    status_t status;

    reset_flags_buffers();
    strncat( buffer, SET_DATE_TIME, 5 );
    status = set_time_buffer( date, temp_buffer );

    if ( status == ERROR )                          /**< Check if date was invalid */
        return ERROR;

    strcat( buffer, temp_buffer );
    //_write( buffer );
    //_write( &creturn );
    mbus_hal_write_text( buffer );
    mbus_hal_write( creturn );                    /**< Carriage Return */

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;

    return OK_STATUS;
}
status_t mbus_get_date_time( date_time_t *date )
{
    uint8_t rx_loop;
    char tmp[3] = { 0, 0, 0 };
    uint8_t i = 0;
    uint8_t temp_buffer[20] = { 0 };

    reset_flags_buffers();
    //_write( ( char* )GET_DATE_TIME );
    //_write( &creturn );
    mbus_hal_write_text( GET_DATE_TIME );           /**< Gets the Date and Time */
    mbus_hal_write( creturn );                      /**< Carriage Return */

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;

    memcpy( temp_buffer, rx_buffer, rx_buffer_cnt );

    tmp[0] = temp_buffer[0];                        /**< Month */
    tmp[1] = temp_buffer[1];
    date->month = atoi( tmp );
    tmp[0] = temp_buffer[2];                        /**< Day */
    tmp[1] = temp_buffer[3];
    date->day = atoi( tmp );
    tmp[0] = temp_buffer[4];                        /**< Hour */
    tmp[1] = temp_buffer[5];
    date->hour = atoi( tmp );
    tmp[0] = temp_buffer[6];                        /**< Minute */
    tmp[1] = temp_buffer[7];
    date->minute = atoi( tmp );
    tmp[0] = temp_buffer[8];                        /**< Year */
    tmp[1] = temp_buffer[9];
    date->year = atoi( tmp );
    tmp[0] = temp_buffer[10];                       /**< Second */
    tmp[1] = temp_buffer[11];
    date->second = atoi( tmp );

    return OK_STATUS;
}

status_t mbus_set_cont_modulated_carrier( void )
{
    reset_flags_buffers();
    mbus_hal_write_text( CONT_MODE_0 );             /**< Sets Coninuous Modulated Carrier Mode */
    mbus_hal_write( creturn );                      /**< Carriage Return */

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;

    return OK_STATUS;
}

status_t mbus_set_pure_carrier_trans( void )
{
    reset_flags_buffers();
    mbus_hal_write_text( CONT_MODE_1 );             /**< Sets Coninuous Modulated Carrier Mode */
    mbus_hal_write( creturn );                      /**< Carriage Return */

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;

    return OK_STATUS;
}

status_t mbus_set_cont_modulated_carrier_random( void )
{
    reset_flags_buffers();
    mbus_hal_write_text( CONT_MODE_3 );             /**< Sets Coninuous Modulated Carrier Mode ( random ) */
    mbus_hal_write( creturn );                      /**< Carriage Return */

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;

    return OK_STATUS;
}

status_t mbus_send_frame( transmit_frame_t *transmit_frame, uint16_t data_len )
{
    uint8_t i = 0;
    uint8_t k = 0;

    if ( transmit_frame_format.length_field )               /**< In the case of this library, to send a frame a length field is required */
        tx_buffer[i++] = transmit_frame->length_field;      /**< Because no timeout is implemented */
    if ( transmit_frame_format.c_field )
        tx_buffer[i++] = transmit_frame->c_field;
    if ( transmit_frame_format.m_field )
    {
        tx_buffer[i++] = transmit_frame->m_field[0];
        tx_buffer[i++] = transmit_frame->m_field[1];
    }
    if ( transmit_frame_format.a_field )
    {
        tx_buffer[i++] = transmit_frame->a_field[0];
        tx_buffer[i++] = transmit_frame->a_field[1];
        tx_buffer[i++] = transmit_frame->a_field[2];
        tx_buffer[i++] = transmit_frame->a_field[3];
        tx_buffer[i++] = transmit_frame->a_field[4];
        tx_buffer[i++] = transmit_frame->a_field[5];
    }
    if ( transmit_frame_format.ci_field )
        tx_buffer[i++] = transmit_frame->ci_field;
    while ( k < transmit_frame->length_field )
        tx_buffer[i++] = transmit_frame->data_field[k++];

    mbus_hal_write_text( tx_buffer );
}

status_t mbus_receive_frame( receive_frame_t *receive_frame )
{
    uint8_t i = 0;
    uint8_t k = 0;
    uint16_t remaining = 0;

    /**< Check format for each field, to see if we will be expecting that type of data */
    if ( receive_frame_format.wake_up_field )
        i++;                                                /** Wake up pin NC */
    if ( receive_frame_format.length_field )
        receive_frame->length_field = rx_buffer[i++];
    if ( receive_frame_format.c_field )
        receive_frame->c_field = rx_buffer[i++];
    if ( receive_frame_format.m_field )
    {
        receive_frame->m_field[0] = rx_buffer[i++];
        receive_frame->m_field[1] = rx_buffer[i++];
    }
    if ( receive_frame_format.a_field )
    {
        receive_frame->a_field[0] = rx_buffer[i++];
        receive_frame->a_field[1] = rx_buffer[i++];
        receive_frame->a_field[2] = rx_buffer[i++];
        receive_frame->a_field[3] = rx_buffer[i++];
        receive_frame->a_field[4] = rx_buffer[i++];
        receive_frame->a_field[5] = rx_buffer[i++];
    }
    if ( receive_frame_format.ci_field )
        receive_frame->ci_field = rx_buffer[i++];
    /**< If LQI field is enabled, we have 1 more field to account for in the
         length field calculation, else we do not( also in either case we must
         account for the length field itself ) In either case though,
         we must subtract all that we already have accounted for in the length
         equation so far */
    k = 0;
    if ( receive_frame_format.lqi_field )           /**< Check to see if the lqi, rssi, or freq_offset fields are used */
        remaining++;                                /**< If they are, Subtract them from the length field when grabbing data */
    if ( receive_frame_format.rssi_field )
        remaining++;
    if ( receive_frame_format.freq_offset_field )
        remaining++;
    while ( k < ( receive_frame->length_field - remaining ) )
        receive_frame->data_field[k++] = rx_buffer[i++];
    if ( receive_frame_format.lqi_field )
        receive_frame->lqi_field = rx_buffer[i++];
    if ( receive_frame_format.rssi_field )
        receive_frame->rssi_field = rx_buffer[i++];
    if ( receive_frame_format.freq_offset_field )
        receive_frame->freq_offset_field = rx_buffer[i++];

    my_receive_flag = false;                        /**< Once frame is put together, set flag to false */
}

//Add / Edit / Remove Registered Meters
status_t mbus_add_edit_meter( meter_options_t options, uint8_t *meter_address, uint8_t *encrypt_key,
                              encryption_type_t enc_mode, uint8_t *manufac_id )
{
    status_t status;

    mbus_set_meter_address( meter_address );        /**< The order for Editing/Adding meters is set the meter address/ manufacturer id/ meter encryption key */
    if ( manufac_id != NULL )                       /**< And afterwards... set the options to what you want */
        mbus_set_manufac_address( manufac_id );

    if ( enc_mode == AES_MODE )
    {
        mbus_set_meter_key( encrypt_key, enc_mode );
        status = mbus_set_registered_meter_options( options | 1 );
    }
    else if ( enc_mode == DES_MODE )
    {
        mbus_set_meter_key( encrypt_key, enc_mode );
        status = mbus_set_registered_meter_options( options | 1 );
    }
    else if ( enc_mode == NO_ENCRYPT )
    {
        status = mbus_set_registered_meter_options( options | 1 );
    }
    else
        return ERROR;

    return status;
}

status_t mbus_remove_meter( uint8_t *meter_address )
{
    mbus_set_meter_address( meter_address );        /**< When the meter address field is filled with a meter address that's already registered... */
    mbus_set_registered_meter_options( 0 );         /**< And meter options are then set to 0, the meter is removed */
}

/**< Reading Registers */
/**< A function for every register for ease for the user */

status_t mbus_get_serial_number( uint8_t *serial_num )
{
    uint8_t buffer[10] = REG_READ xstr( SERIAL_NUM_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    memcpy( serial_num, rx_buffer, rx_buffer_cnt );

    return status;
}

status_t mbus_get_mbus_mode( uint8_t *mode )
{
    uint8_t buffer[8] = REG_READ xstr( M_BUS_MODE_REG ) REG_READ_END;
    uint8_t end = 0;
    uint8_t i = 0;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( mode );

    return status;
}

status_t mbus_get_serial_tx_format( uint8_t *format )
{
    uint8_t buffer[8] = REG_READ xstr( RX_FORMAT_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( format );

    return status;
}

status_t mbus_get_serial_rx_format( uint8_t *format )
{
    uint8_t buffer[8] = REG_READ xstr( TX_FORMAT_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( format );

    return status;
}

status_t mbus_get_tx_rx_pins( uint8_t *pins )
{
    uint8_t buffer[8] = REG_READ xstr( RX_TX_PIN_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( pins );

    return status;
}

status_t mbus_get_estim_freq_offset( uint8_t *offset )
{
    uint8_t buffer[8] = REG_READ xstr( EST_FREQ_OFFSET_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( offset );

    return status;
}

status_t mbus_get_c_field( uint8_t *field )
{
    uint8_t buffer[8] = REG_READ xstr( C_FIELD_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( field );

    return status;
}

status_t mbus_get_m_field_0( uint8_t *field )
{
    uint8_t buffer[8] = REG_READ xstr( M_FIELD_BYTE_0_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( field );

    return status;
}

status_t mbus_get_m_field_1( uint8_t *field )
{
    uint8_t buffer[8] = REG_READ xstr( M_FIELD_BYTE_1_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( field );

    return status;
}

status_t mbus_get_a_field_0( uint8_t *field )
{
    uint8_t buffer[8] = REG_READ xstr( A_FIELD_BYTE_0_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( field );

    return status;
}

status_t mbus_get_a_field_1( uint8_t *field )
{
    uint8_t buffer[8] = REG_READ xstr( A_FIELD_BYTE_1_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( field );

    return status;
}

status_t mbus_get_a_field_2( uint8_t *field )
{
    uint8_t buffer[8] = REG_READ xstr( A_FIELD_BYTE_2_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( field );

    return status;
}

status_t mbus_get_a_field_3( uint8_t *field )
{
    uint8_t buffer[8] = REG_READ xstr( A_FIELD_BYTE_3_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( field );

    return status;
}

status_t mbus_get_a_field_4( uint8_t *field )
{
    uint8_t buffer[8] = REG_READ xstr( A_FIELD_BYTE_4_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( field );

    return status;
}

status_t mbus_get_a_field_5( uint8_t *field )
{
    uint8_t buffer[8] = REG_READ xstr( A_FIELD_BYTE_5_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( field );

    return status;
}

status_t mbus_get_ci_field( uint8_t *field )
{
    uint8_t buffer[8] = REG_READ xstr( CI_FIELD_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( field );

    return status;
}

status_t mbus_get_radio_channel( uint8_t *channel )
{
    uint8_t buffer[8] = REG_READ xstr( RADIO_CHANNEL_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( channel );

    return status;
}

status_t mbus_get_preamble_length( uint8_t *length )
{
    uint8_t buffer[8] = REG_READ xstr( PREAMBLE_LEN_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( length );

    return status;
}

status_t mbus_get_radio_output_power( uint8_t *power )
{
    uint8_t buffer[8] = REG_READ xstr( RADIO_OUTPUT_PWR_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( power );

    return status;
}

status_t mbus_get_channel_plan( uint8_t *plan )
{
    uint8_t buffer[8] = REG_READ xstr( CHANNEL_PLAN_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( plan );

    return status;
}

status_t mbus_get_current_channel( uint8_t *channel )
{
    uint8_t buffer[8] = REG_READ xstr( CURRENT_CHANNEL_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( channel );

    return status;
}

status_t mbus_get_radio_output_dbm( uint8_t *dbm )
{
    uint8_t buffer[8] = REG_READ xstr( RADIO_OUTPUT_PWR_DBM_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( dbm );

    return status;
}

status_t mbus_get_freq_offset( int8_t *offset )
{
    uint8_t buffer[8] = REG_READ xstr( SET_FREQUENCY_OFFSET_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( offset );

    return status;
}

status_t mbus_get_preamble_word( uint8_t *word )
{
    uint8_t buffer[8] = REG_READ xstr( PREAMBLE_WORD_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( word );

    return status;
}

status_t mbus_get_serial_speed( uint8_t *speed )
{
    uint8_t buffer[8] = REG_READ xstr( SERIAL_SPEED_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( speed );

    return status;
}

status_t mbus_get_serial_timeout( uint8_t *timeout )
{
    uint8_t buffer[8] = REG_READ xstr( SERIAL_TIME_OUT_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( timeout );

    return status;
}

status_t mbus_get_cts_management( uint8_t *cts )
{
    uint8_t buffer[8] = REG_READ xstr( CTS_MANAGEMENT_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( cts );

    return status;
}

status_t mbus_get_cts_timeout( uint8_t *timeout )
{
    uint8_t buffer[8] = REG_READ xstr( CTS_TIME_OUT_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( timeout );

    return status;
}

//status_t mbus_get_wakeup_options( void )
//{
/**< Wakeup pin not connected :( */

//}

status_t mbus_get_wakeup_timeout( uint8_t *timeout )
{
    uint8_t buffer[8] = REG_READ xstr( WAKE_UP_TIME_OUT_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( timeout );

    return status;
}

status_t mbus_get_sleep_time( uint8_t *time )
{
    uint8_t buffer[8] = REG_READ xstr( SLEEP_TIME_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( time );

    return status;
}

status_t mbus_get_rx_filter( uint8_t *filter )
{
    uint8_t buffer[8] = REG_READ xstr( RX_FILTER_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( filter );

    return status;
}

status_t mbus_get_tx_options( uint8_t *options )
{
    uint8_t buffer[8] = REG_READ xstr( TX_OPTIONS_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( options );

    return status;
}

status_t mbus_get_manufac_address( uint8_t *address )
{
    uint8_t buffer[2][10] = { 0 };
    uint8_t get_buffer[8] = { 0 };
    status_t status;

    strcat( buffer[0], REG_READ xstr( MANUFAC_ADDRESS_REG_0 ) REG_READ_END );
    strcat( buffer[1], REG_READ xstr( MANUFAC_ADDRESS_REG_1 ) REG_READ_END );

    reset_flags_buffers();
    status = mbus_read_reg( buffer[0] );

    while ( !response_finished );

    get_register_contents( &address[0] );

    reset_flags_buffers();
    status = mbus_read_reg( buffer[1] );

    while ( !response_finished );

    get_register_contents( &address[1] );

    return status;

}

status_t mbus_get_meter_address( uint8_t *address )
{
    uint8_t buffer[8][14] = { 0 };
    uint8_t i = 0;
    status_t status;

    strcat( buffer[0], REG_READ xstr( METER_ADDRESS_REG_0 ) REG_READ_END );
    strcat( buffer[1], REG_READ xstr( METER_ADDRESS_REG_1 ) REG_READ_END );
    strcat( buffer[2], REG_READ xstr( METER_ADDRESS_REG_2 ) REG_READ_END );
    strcat( buffer[3], REG_READ xstr( METER_ADDRESS_REG_3 ) REG_READ_END );
    strcat( buffer[4], REG_READ xstr( METER_ADDRESS_REG_4 ) REG_READ_END );
    strcat( buffer[5], REG_READ xstr( METER_ADDRESS_REG_5 ) REG_READ_END );

    for ( i = 0; i < 6; i++ )
    {
        reset_flags_buffers();

        //while( !mbus_tx_ctl() );

        status = mbus_read_reg( buffer[i] );

        while ( !response_finished );

        get_register_contents( &address[i] );
    }

    return status;
}

status_t mbus_get_meter_key( uint8_t *key, encryption_type_t type )
{
    uint8_t buffer[16][14] = { 0 };
    uint8_t top = 0;
    uint8_t i = 0;
    status_t status;

    strcat( buffer[0], REG_READ xstr( METER_KEY_REG_0 ) REG_READ_END );
    strcat( buffer[1], REG_READ xstr( METER_KEY_REG_1 ) REG_READ_END );
    strcat( buffer[2], REG_READ xstr( METER_KEY_REG_2 ) REG_READ_END );
    strcat( buffer[3], REG_READ xstr( METER_KEY_REG_3 ) REG_READ_END );
    strcat( buffer[4], REG_READ xstr( METER_KEY_REG_4 ) REG_READ_END );
    strcat( buffer[5], REG_READ xstr( METER_KEY_REG_5 ) REG_READ_END );
    strcat( buffer[6], REG_READ xstr( METER_KEY_REG_6 ) REG_READ_END );
    strcat( buffer[7], REG_READ xstr( METER_KEY_REG_7 ) REG_READ_END );
    strcat( buffer[8], REG_READ xstr( METER_KEY_REG_8 ) REG_READ_END );
    strcat( buffer[9], REG_READ xstr( METER_KEY_REG_9 ) REG_READ_END );
    strcat( buffer[10], REG_READ xstr( METER_KEY_REG_10 ) REG_READ_END );
    strcat( buffer[11], REG_READ xstr( METER_KEY_REG_11 ) REG_READ_END );
    strcat( buffer[12], REG_READ xstr( METER_KEY_REG_12 ) REG_READ_END );
    strcat( buffer[13], REG_READ xstr( METER_KEY_REG_13 ) REG_READ_END );
    strcat( buffer[14], REG_READ xstr( METER_KEY_REG_14 ) REG_READ_END );
    strcat( buffer[15], REG_READ xstr( METER_KEY_REG_15 ) REG_READ_END );

    if ( type == DES_MODE )
        top = 8;
    else if ( type == AES_MODE )
        top = 16;
    else
        return ERROR;

    for ( i = 0; i < top; i++ )
    {
        reset_flags_buffers();
        status = mbus_read_reg( buffer[i] );

        while ( !response_finished );

        get_register_contents( &key[i] );
    }

    return status;
}

status_t mbus_get_indications( uint8_t *indications )
{
    uint8_t buffer[8] = REG_READ xstr( INDICATIONS_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( indications );

    return status;
}

status_t mbus_get_lbt_threshold( uint8_t *threshold )
{
    uint8_t buffer[8] = REG_READ xstr( LBT_THRESHOLD_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( threshold );

    return status;
}

status_t mbus_get_lbt_advanced_opt( uint8_t *opt )
{
    uint8_t buffer[8] = REG_READ xstr( LBT_ADVANCED_OPTIONS_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( opt );

    return status;
}

status_t mbus_get_single_channel_lbt_bo_max( uint8_t *max )
{
    uint8_t buffer[8] = REG_READ xstr( SINGLE_CHNL_LBT_BO_MAX_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( max );

    return status;
}

status_t mbus_get_single_channel_lbt_bo_flat( uint8_t *flat )
{
    uint8_t buffer[8] = REG_READ xstr( SINGLE_CHNL_LBT_BO_FLAT_REG ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( flat );

    return status;
}

status_t mbus_get_single_channel_lbt_delay( uint16_t *delay ) 
{
    uint8_t buffer[8] = REG_READ xstr( SINGLE_CHNL_LBT_DELAY_REG ) REG_READ_END;   
    uint8_t i = 0;
    uint8_t end = 0;
    char str[6] = { 0 };
    status_t status; 


    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents_long( delay );

    return status;
}

status_t mbus_get_single_channel_lbt_bo_period( uint16_t *period ) 
{
    uint8_t buffer[8] = REG_READ xstr( SINGLE_CHNL_LBT_BO_PERIOD ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents_long( period );

    return status;
}

status_t mbus_get_multi_channel_lbt_bo_max( uint8_t *max )
{
    uint8_t buffer[8] = REG_READ xstr( MULTI_CHNL_LBT_BO_MAX ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( max );

    return status;
}

status_t mbus_get_multicast_address( uint8_t *address )
{
    uint8_t buffer[8][10] = { 0 };
    uint8_t i = 0;
    status_t status;

    strcat( buffer[0], REG_READ xstr( MULTICAST_ADDRESS_REG_0 ) REG_READ_END );
    strcat( buffer[1], REG_READ xstr( MULTICAST_ADDRESS_REG_1 ) REG_READ_END );
    strcat( buffer[2], REG_READ xstr( MULTICAST_ADDRESS_REG_2 ) REG_READ_END );
    strcat( buffer[3], REG_READ xstr( MULTICAST_ADDRESS_REG_3 ) REG_READ_END );
    strcat( buffer[4], REG_READ xstr( MULTICAST_ADDRESS_REG_4 ) REG_READ_END );
    strcat( buffer[5], REG_READ xstr( MULTICAST_ADDRESS_REG_5 ) REG_READ_END );
    strcat( buffer[6], REG_READ xstr( MULTICAST_ADDRESS_REG_6 ) REG_READ_END );
    strcat( buffer[7], REG_READ xstr( MULTICAST_ADDRESS_REG_7 ) REG_READ_END );

    for ( i = 0; i < 8; i++ )
    {
        reset_flags_buffers();
        status = mbus_read_reg( buffer[i] );

        while ( !response_finished );

        get_register_contents( &address[i] );
    }

    return status;
}

status_t mbus_get_single_channel_lbt_ra_max( uint8_t *max )
{
    uint8_t buffer[8] = REG_READ xstr( SINGLE_CHNL_LBT_RA_MAX ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( max );

    return status;
}

status_t mbus_get_single_channel_lbt_ra_flat( uint8_t *flat )
{
    uint8_t buffer[8] = REG_READ xstr( SINGLE_CHNL_LBT_RA_FLAT ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( flat );

    return status;
}

status_t mbus_get_single_channel_lbt_ra_period( uint8_t *period )
{
    uint8_t buffer[8] = REG_READ xstr( SINGLE_CHNL_LBT_RA_PERIOD ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( period );

    return status;
}

status_t mbus_get_fac_options( uint8_t *options )
{
    uint8_t buffer[8] = REG_READ xstr( FAC_OPTIONS ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( options );

    return status;
}

status_t mbus_get_fac_fast_tro_min( uint16_t *min ) 
{
    uint8_t buffer[8] = REG_READ xstr( FAC_FAST_TROMIN ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents_long( min );

    return status;
}

status_t mbus_get_fac_fast_tro_max( uint16_t *max )
{
    uint8_t buffer[8] = REG_READ xstr( FAC_FAST_TROMAX ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents_long( max );

    return status;
}

status_t mbus_get_fac_slow_tro_min( uint16_t *min )
{
    uint8_t buffer[8] = REG_READ xstr( FAC_SLOW_TROMIN ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents_long( min );

    return status;
}

status_t mbus_get_fac_slow_tro_max( uint16_t *max )
{
    uint8_t buffer[8] = REG_READ xstr( FAC_SLOW_TROMAX ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents_long( max );

    return status;
}

status_t mbus_get_fac_txd( uint8_t *txd )
{
    uint8_t buffer[8] = REG_READ xstr( FAC_TXD ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( txd );

    return status;
}

status_t mbus_get_fac_timeout( uint8_t *timeout )
{
    uint8_t buffer[8] = REG_READ xstr( FAC_TIMEOUT ) REG_READ_END;
    status_t status;

    reset_flags_buffers();
    status = mbus_read_reg( buffer );

    while ( !response_finished );

    get_register_contents( timeout );

    return status;
}

/**< Writing Registers */
/**< A function for every writable register for ease of the user */

status_t mbus_set_mbus_mode( mbus_role_t role )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( M_BUS_MODE_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( role, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_serial_rx_format( serial_rx_format_t format )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( TX_FORMAT_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    mbus_update_rx_format( format );                /**< Updates static format for when sending / receiving frames */
    IntToStr( format, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}                                                   /**< User can "or" ( | ) multiples of the serial_rx_format_t enum to initiate more than 1 field         */

status_t mbus_set_serial_tx_format( serial_tx_format_t format )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( RX_FORMAT_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    mbus_update_tx_format( format );                /**< Updates static format for when sending / receiving frames */
    IntToStr( format, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}                                                   /**< User can "or" ( | ) multiples of the serial_tx_format_t enum to initiate more than 1 field         */

status_t mbus_set_tx_rx_pins( uint8_t pins )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( RX_TX_PIN_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( pins, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_estim_freq_offset( uint8_t offset )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( EST_FREQ_OFFSET_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( offset, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_c_field( uint8_t c_field_val )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( C_FIELD_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( c_field_val, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_m_field_0( uint8_t m_field_val )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( M_FIELD_BYTE_0_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( m_field_val, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_m_field_1( uint8_t m_field_val )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( M_FIELD_BYTE_1_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( m_field_val, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_a_field_0( uint8_t a_field_val )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( A_FIELD_BYTE_0_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( a_field_val, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_a_field_1( uint8_t a_field_val )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( A_FIELD_BYTE_1_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( a_field_val, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_a_field_2( uint8_t a_field_val )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( A_FIELD_BYTE_2_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( a_field_val, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_a_field_3( uint8_t a_field_val )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( A_FIELD_BYTE_3_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( a_field_val, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_a_field_4( uint8_t a_field_val )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( A_FIELD_BYTE_4_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( a_field_val, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_a_field_5( uint8_t a_field_val )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( A_FIELD_BYTE_5_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( a_field_val, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_ci_field( uint8_t ci_field_val )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( CI_FIELD_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( ci_field_val, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_radio_channel( channel_t channel )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( RADIO_CHANNEL_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( channel, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_preamble_length( preamble_length_t length )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( PREAMBLE_LEN_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( length, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_radio_output_power( radio_output_pwr_t radio_pwr )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( RADIO_OUTPUT_PWR_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( radio_pwr, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_channel_plan( channel_t channel )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( CHANNEL_PLAN_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( channel, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_radio_output_dbm( radio_output_pwr_t output_pwr )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( RADIO_OUTPUT_PWR_DBM_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( output_pwr, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_freq_offset( int8_t offset )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( SET_FREQUENCY_OFFSET_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( offset, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_preamble_word( preamble_word_t pre_word )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( PREAMBLE_WORD_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( pre_word, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_serial_speed( serial_baud_t baud )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( SERIAL_SPEED_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( baud, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_serial_timeout( uint8_t ms )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( SERIAL_TIME_OUT_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( ms, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_cts_management( bool enable )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( CTS_MANAGEMENT_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( enable, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_cts_timeout( uint8_t seconds )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( CTS_TIME_OUT_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( seconds, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

//status_t mbus_set_wakeup_options( wakeup_opt_t option )
//{
/**< Wakeup pin not connected :( */

//}

status_t mbus_set_wakeup_timeout( uint8_t ms )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( WAKE_UP_TIME_OUT_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( ms, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_sleep_time( uint8_t ms )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( SLEEP_TIME_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( ms, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_rx_filter( rx_filter_t filter )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( RX_FILTER_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( filter, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_tx_options( tx_option_t option )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( TX_OPTIONS_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( option, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_registered_meter_options( meter_options_t option )
{
    char txt[8];
    uint8_t buffer[14] = REG_WRITE xstr( REGISTER_METER_OPTIONS_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( option, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;

    return OK_STATUS;

}

status_t mbus_set_manufac_address( uint8_t *address )
{
    char txt[8] = { 0 };
    uint8_t tmp = 0;
    uint8_t buffer[2][14] = { 0 };

    strcat( buffer[0], REG_WRITE xstr( MANUFAC_ADDRESS_REG_0 ) REG_WRITE_MIDDLE );
    strcat( buffer[1], REG_WRITE xstr( MANUFAC_ADDRESS_REG_1 ) REG_WRITE_MIDDLE );

    tmp = address[0];
    reset_flags_buffers();
    IntToStr( tmp, txt );
    Ltrim( txt );
    strcat( buffer[0], txt );
    mbus_write_reg( buffer[0] );
    txt[0] = 0;

    while ( !response_finished );

    tmp = address[1];
    reset_flags_buffers();
    IntToStr( tmp, txt );
    Ltrim( txt );
    strcat( buffer[1], txt );
    mbus_write_reg( buffer[1] );
    txt[0] = 0;

    while ( !response_finished );

    return OK_STATUS;

}

status_t mbus_set_meter_address( uint8_t *address )
{
    char txt[8] = { 0 };
    uint8_t tmp = 0;
    uint8_t i   = 0;
    uint8_t buffer[8][14] = { 0 };

    strcat( buffer[0], REG_WRITE xstr( METER_ADDRESS_REG_0 ) REG_WRITE_MIDDLE );
    strcat( buffer[1], REG_WRITE xstr( METER_ADDRESS_REG_1 ) REG_WRITE_MIDDLE );
    strcat( buffer[2], REG_WRITE xstr( METER_ADDRESS_REG_2 ) REG_WRITE_MIDDLE );
    strcat( buffer[3], REG_WRITE xstr( METER_ADDRESS_REG_3 ) REG_WRITE_MIDDLE );
    strcat( buffer[4], REG_WRITE xstr( METER_ADDRESS_REG_4 ) REG_WRITE_MIDDLE );
    strcat( buffer[5], REG_WRITE xstr( METER_ADDRESS_REG_5 ) REG_WRITE_MIDDLE );

    for ( i = 0; i < 6; i++ )
    {
        tmp = address[i];
        reset_flags_buffers();
        IntToStr( tmp, txt );
        Ltrim( txt );
        strcat( buffer[i], txt );
        mbus_write_reg( buffer[i] );
        txt[0] = 0;

        while ( !response_finished );
    }

    return OK_STATUS;
}

status_t mbus_set_meter_key( uint8_t *key, encryption_type_t type )
{
    char txt[8];
    uint8_t top = 0;
    uint8_t tmp = 0;
    uint8_t i   = 0;
    uint8_t buffer[16][14] = { 0 };

    strcat( buffer[0], REG_WRITE xstr( METER_KEY_REG_0 ) REG_WRITE_MIDDLE );
    strcat( buffer[1], REG_WRITE xstr( METER_KEY_REG_1 ) REG_WRITE_MIDDLE );
    strcat( buffer[2], REG_WRITE xstr( METER_KEY_REG_2 ) REG_WRITE_MIDDLE );
    strcat( buffer[3], REG_WRITE xstr( METER_KEY_REG_3 ) REG_WRITE_MIDDLE );
    strcat( buffer[4], REG_WRITE xstr( METER_KEY_REG_4 ) REG_WRITE_MIDDLE );
    strcat( buffer[5], REG_WRITE xstr( METER_KEY_REG_5 ) REG_WRITE_MIDDLE );
    strcat( buffer[6], REG_WRITE xstr( METER_KEY_REG_6 ) REG_WRITE_MIDDLE );
    strcat( buffer[7], REG_WRITE xstr( METER_KEY_REG_7 ) REG_WRITE_MIDDLE );
    strcat( buffer[8], REG_WRITE xstr( METER_KEY_REG_8 ) REG_WRITE_MIDDLE );
    strcat( buffer[9], REG_WRITE xstr( METER_KEY_REG_9 ) REG_WRITE_MIDDLE );
    strcat( buffer[10], REG_WRITE xstr( METER_KEY_REG_10 ) REG_WRITE_MIDDLE );
    strcat( buffer[11], REG_WRITE xstr( METER_KEY_REG_11 ) REG_WRITE_MIDDLE );
    strcat( buffer[12], REG_WRITE xstr( METER_KEY_REG_12 ) REG_WRITE_MIDDLE );
    strcat( buffer[13], REG_WRITE xstr( METER_KEY_REG_13 ) REG_WRITE_MIDDLE );
    strcat( buffer[14], REG_WRITE xstr( METER_KEY_REG_14 ) REG_WRITE_MIDDLE );
    strcat( buffer[15], REG_WRITE xstr( METER_KEY_REG_15 ) REG_WRITE_MIDDLE );

    if ( type == DES_MODE )
        top = 8;
    else if ( type == AES_MODE )
        top = 16;
    else
        return ERROR;

    for ( i = 0; i < top; i++ )
    {
        tmp = key[i];
        reset_flags_buffers();
        IntToStr( tmp, txt );
        Ltrim( txt );
        strcat( buffer[i], txt );
        mbus_write_reg( buffer[i] );
        txt[0] = 0;

        while ( !response_finished );

    }

    return OK_STATUS;
}

status_t mbus_set_indications( bool enable )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( INDICATIONS_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    if ( enable )
        txt[0] = "1";
    else
        txt[0] = "0";
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;

}

status_t mbus_set_lbt_threshold( uint8_t threshold )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( LBT_THRESHOLD_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( threshold, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_lbt_advanced_opt( lbt_options_t option )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( LBT_ADVANCED_OPTIONS_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( option, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_single_channel_lbt_bo_max( uint8_t max )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( SINGLE_CHNL_LBT_BO_MAX_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( max, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_single_channel_lbt_bo_flat( uint8_t flat )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( SINGLE_CHNL_LBT_BO_FLAT_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( flat, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_single_channel_lbt_delay( uint8_t ms )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( SINGLE_CHNL_LBT_DELAY_REG ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( ms, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_single_channel_lbt_bo_period( uint16_t ms )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( SINGLE_CHNL_LBT_BO_PERIOD ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    LongToStr( ms, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_multi_channel_lbt_bo_max( uint8_t max )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( MULTI_CHNL_LBT_BO_MAX ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( max, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_multicast_address( uint8_t *address )
{
    char txt[8] = { 0 };
    uint8_t tmp = 0;
    uint8_t i   = 0;
    uint8_t buffer[8][14] = { 0 };

    strcat( buffer[0], REG_WRITE xstr( MULTICAST_ADDRESS_REG_0 ) REG_WRITE_MIDDLE );
    strcat( buffer[1], REG_WRITE xstr( MULTICAST_ADDRESS_REG_1 ) REG_WRITE_MIDDLE );
    strcat( buffer[2], REG_WRITE xstr( MULTICAST_ADDRESS_REG_2 ) REG_WRITE_MIDDLE );
    strcat( buffer[3], REG_WRITE xstr( MULTICAST_ADDRESS_REG_3 ) REG_WRITE_MIDDLE );
    strcat( buffer[4], REG_WRITE xstr( MULTICAST_ADDRESS_REG_4 ) REG_WRITE_MIDDLE );
    strcat( buffer[5], REG_WRITE xstr( MULTICAST_ADDRESS_REG_5 ) REG_WRITE_MIDDLE );
    strcat( buffer[6], REG_WRITE xstr( MULTICAST_ADDRESS_REG_6 ) REG_WRITE_MIDDLE );
    strcat( buffer[7], REG_WRITE xstr( MULTICAST_ADDRESS_REG_7 ) REG_WRITE_MIDDLE );

    for ( i = 0; i < 8; i++ )
    {
        tmp = address[i];
        reset_flags_buffers();
        IntToStr( tmp, txt );
        Ltrim( txt );
        strcat( buffer[i], txt );
        mbus_write_reg( buffer[i] );
        txt[0] = 0;

        while ( !response_finished );
    }

    return OK_STATUS;
}

status_t mbus_set_single_channel_lbt_ra_max( uint8_t max )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( SINGLE_CHNL_LBT_RA_MAX ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( max, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_single_channel_lbt_ra_flat( uint8_t flat )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( SINGLE_CHNL_LBT_RA_FLAT ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( flat, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_single_channel_lbt_ra_period( uint8_t seconds )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( SINGLE_CHNL_LBT_RA_PERIOD ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( seconds, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_fac_options( fac_options_t option )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( FAC_OPTIONS ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( option, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_fac_fast_tro_min( uint16_t min ) 
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( FAC_FAST_TROMIN ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    LongToStr( min, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_fac_fast_tro_max( uint16_t max )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( FAC_FAST_TROMAX ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    LongToStr( max, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_fac_slow_tro_min( uint16_t min )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( FAC_SLOW_TROMIN ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    LongToStr( min, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_fac_slow_tro_max( uint16_t max )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( FAC_SLOW_TROMAX ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    LongToStr( max, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_fac_txd( uint8_t trans_delay )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( FAC_TXD ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( trans_delay, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}

status_t mbus_set_fac_timeout( uint8_t timeout )
{
    char txt[8];
    uint8_t buffer[8] = REG_WRITE xstr( FAC_TIMEOUT ) REG_WRITE_MIDDLE;

    reset_flags_buffers();
    IntToStr( timeout, txt );
    Ltrim( txt );
    strcat( buffer, txt );
    mbus_write_reg( buffer );

    while ( !response_finished );

    if ( rx_buffer[0] == 'E' )
        return ERROR;
    else
        return OK_STATUS;
}
/*************** END OF FUNCTIONS *********************************************/