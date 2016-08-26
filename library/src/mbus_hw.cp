#line 1 "//VBOXSVR/corey/Projects/ClickLibraries/MBus_click/library/src/mbus_hw.c"
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
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stddef.h"



typedef long ptrdiff_t;


 typedef unsigned long size_t;

typedef unsigned long wchar_t;
#line 1 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdbool.h"



 typedef char _Bool;
#line 229 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
typedef enum
{
 DES_MODE = 0,
 AES_MODE = 1,
 NO_ENCRYPT = 2
} encryption_type_t;

typedef enum
{

 ROLE_S1_METER = 0,
 ROLE_S1_OTHER = 1,
 ROLE_S2_METER = 2,
 ROLE_S2_OTHER = 3,



 ROLE_T1_METER = 4,
 ROLE_T1_OTHER = 5,
 ROLE_T2_METER = 6,
#line 250 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
 ROLE_T2_OTHER = 7,






 ROLE_R2_METER = 8,
 ROLE_R2_OTHER = 9,



 ROLE_C1_METER = 10,
 ROLE_C1_OTHER = 11,
 ROLE_C2_METER = 12,
 ROLE_C2_OTHER = 13,


 ROLE_N1_METER = 14,
 ROLE_N1_OTHER = 15,
 ROLE_N2_METER = 16,
 ROLE_N2_OTHER = 17









} mbus_role_t;

typedef enum
{
 FORMAT_A = 0,
 FORMAT_B
} mbus_data_format_t;

typedef enum
{
 OK_STATUS = 0x01,
 ERROR = 0X02
} status_t;

typedef enum
{
 CI_FIELD_TX = 16,
 A_FIELD_TX = 8,


 M_FIELD_TX = 4,
 C_FIELD_TX = 2,
 LENGTH_TX = 1


} serial_tx_format_t;

typedef enum
{
 FREQ_OFFSET_RX = 256,
 RSSI_RX = 128,

 WAKEUP_CHAR_RX = 64,
 LQI_RX = 32,
 CI_FIELD_RX = 16,
 A_FIELD_RX = 8,
 M_FIELD_RX = 4,
 C_FIELD_RX = 2,
 LENGTH_RX = 1


} serial_rx_format_t;

typedef enum
{
 BPS_4800_1A = 0,
 BPS_4800_1B,
 BPS_2400_2A,
 BPS_2400_2B,
 BPS_4800_3A,
 BPS_4800_3B,
 BPS_19200_0,
 BPS_4800_2A,
 BPS_4800_2B
} channel_t;

typedef enum
{
 SHORT_PREAM = 0,
 LONG_PREAM = 1
} preamble_length_t;



typedef enum
{

 DBM_21 = 0,
 DBM_24,
 DBM_27,
 DBM_30,
 DBM_18,
 DBM_15,
 DBM_12
} radio_output_pwr_t;

typedef enum
{
 PREAMBLE_0 = 0x55,
 PREAMBLE_1 = 0xAA
} preamble_word_t;

typedef enum
{
 BAUD_1200 = 1,
 BAUD_2400,
 BAUD_4800,
 BAUD_9600,
 BAUD_19200,
 BAUD_38400,
 BAUD_57600,
 BAUD_115200
} serial_baud_t;

typedef enum
{
 LOW_PWR_WAKEUP = 0,
 SERIAL_CHAR_WAKEUP = 1
} wakeup_opt_t;

typedef enum
{
 RX_FILTER_ENABLE = 0,
 RX_MULTICAST,
 RX_BROADCAST
} rx_filter_t;

typedef enum
{
 LISTEN_B4_TALK_TX = 1,
 FRAME_FMT_B_TX,
 AUTO_TRANS_TX,
 SYNC_TRANS_TX,
 MULTI_FRAME_TX,
 SERIAL_ACK_TX
} tx_option_t;

typedef enum
{
 DONT_FILTER = 2,

 ENABLE_ENCRYPT = 4,
 AUTO_CNF_IR = 8,
 AUTO_ACK = 16
} meter_options_t;

typedef enum
{
#line 415 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
 ALOHA_LBT = 0,
#line 426 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
 AFA_LBT,
#line 430 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
 OVERRIDE,
#line 438 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
 LBT_REATTEMPT,

 DIF_FRM_LBT_REATTEMPT
} lbt_options_t;

typedef enum
{
#line 446 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
 FREQUENT_ACCESS_CYCLE = 0,
#line 449 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
 FAST_RESPONSE_DELAY
} fac_options_t;

typedef enum
{
 GFSK = 0,
 GFSK_4 = 1
} modulation_t;

typedef struct
{
#line 462 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
  _Bool  wake_up_field;
#line 466 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
  _Bool  length_field;

  _Bool  c_field;

  _Bool  m_field;
  _Bool  a_field;

  _Bool  ci_field;

  _Bool  lqi_field;
#line 478 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
  _Bool  rssi_field;
#line 481 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
  _Bool  freq_offset_field;
} receive_frame_format_t;

typedef struct
{
#line 493 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
  _Bool  length_field;

  _Bool  c_field;

  _Bool  m_field;
#line 500 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
  _Bool  a_field;
#line 504 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
  _Bool  ci_field;
} transmit_frame_format_t;

typedef struct
{
#line 511 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
 uint8_t length_field;

 uint8_t c_field;

 uint8_t m_field[2];
 uint8_t a_field[6];

 uint8_t ci_field;

 uint8_t data_field[245];

 uint8_t lqi_field;
#line 525 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
 uint8_t rssi_field;
#line 528 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
 uint8_t freq_offset_field;
} receive_frame_t;

typedef struct
{
#line 540 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
 uint8_t length_field;

 uint8_t c_field;

 uint8_t m_field[2];
#line 547 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
 uint8_t a_field[6];
#line 551 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
 uint8_t ci_field;

 uint8_t data_field[245];
} transmit_frame_t;

typedef struct
{
 uint8_t month;
 uint8_t day;
 uint8_t hour;
 uint8_t minute;
 uint8_t year;
 uint8_t second;
} date_time_t;


typedef enum
{
#line 570 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
 NO_CHANNEL_SEL = 0x00,
#line 575 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
 CHANNEL_SEL = 0x01,
#line 579 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
 NEW_FRAME_LBT = 0x02
} indication_header_t;

typedef enum
{
#line 586 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
 LBT_OK = 0x0000,
#line 590 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
 LBT_OVERRIDE = 0x0001,
#line 595 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
 LBT_ERROR = 0x0002,
#line 599 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
 LBT_REATTEMPT_ERROR = 0x0003,
#line 602 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
 LBT_REATTEMPT_WAITING = 0x0004,
#line 608 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
 LBT_REATTEMPT_ALG_ERROR = 0x0005,
#line 611 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
 LBT_STANDBY = 0x0010,
#line 614 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
 LBT_FAC_FRAME_SENT = 0x0020,
#line 617 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
 LBT_FAC_ACC_NR_SENT = 0x0021,

 LBT_FAC_FRAME_STORED = 0x0022,

 LBT_FAC_NO_FRAME_RECEIVED = 0x0023,

 LBT_FAC_TIMEOUT = 0x0024,

 LBT_FAC_END = 0x0025,

 LBT_FAC_ERROR = 0x0026
} indication_type_t;
#line 656 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
void mbus_init( void );
#line 665 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
void mbus_rx_isr( char rx_input );
#line 676 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_at_init( void );
#line 686 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_op_init( void );
#line 698 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_firmware_bootloader_vers( uint8_t *version );
#line 709 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_reset_params( void );
#line 720 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_reset_meters_list( void );
#line 731 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_run_bootloader( void );
#line 743 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_date_time( date_time_t *date );
#line 755 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_date_time( date_time_t *date );
#line 767 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_cont_modulated_carrier( void );
#line 778 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_pure_carrier_trans( void );
#line 791 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_cont_modulated_carrier_random( void );
#line 804 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_send_frame( transmit_frame_t *transmit_frame, uint16_t data_len );
#line 816 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_receive_frame( receive_frame_t *receive_frame );
#line 832 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_add_edit_meter( meter_options_t options, uint8_t *meter_address, uint8_t *encrypt_key,
 encryption_type_t enc_mode, uint8_t *manufac_id );
#line 845 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_remove_meter( uint8_t *meter_address );
#line 857 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_serial_number( uint8_t *serial_num );
#line 869 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_mbus_mode( uint8_t *mode );
#line 881 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_serial_rx_format( uint8_t *format );
#line 896 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_serial_tx_format( uint8_t *format );
#line 908 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_tx_rx_pins( uint8_t *pins );
#line 921 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_estim_freq_offset( uint8_t *offset );
#line 933 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_c_field( uint8_t *field );
#line 945 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_m_field_0( uint8_t *field );
#line 957 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_m_field_1( uint8_t *field );
#line 969 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_a_field_0( uint8_t *field );
#line 981 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_a_field_1( uint8_t *field );
#line 993 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_a_field_2( uint8_t *field );
#line 1005 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_a_field_3( uint8_t *field );
#line 1017 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_a_field_4( uint8_t *field );
#line 1029 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_a_field_5( uint8_t *field );
#line 1041 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_ci_field( uint8_t *field );
#line 1058 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_radio_channel( uint8_t *channel );
#line 1070 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_preamble_length( uint8_t *length );
#line 1085 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_radio_output_power( uint8_t *power );
#line 1107 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_channel_plan( uint8_t *plan );
#line 1129 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_current_channel( uint8_t *channel );
#line 1143 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_radio_output_dbm( uint8_t *dbm );
#line 1157 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_freq_offset( int8_t *offset );
#line 1169 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_preamble_word( uint8_t *word );
#line 1190 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_serial_speed( uint8_t *speed );
#line 1210 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_serial_timeout( uint8_t *timeout );
#line 1222 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_cts_management( uint8_t *cts );
#line 1234 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_cts_timeout( uint8_t *timeout );
#line 1248 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_wakeup_timeout( uint8_t *timeout );
#line 1260 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_sleep_time( uint8_t *time );
#line 1278 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_rx_filter( uint8_t *filter );
#line 1300 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_tx_options( uint8_t *options );
#line 1312 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_manufac_address( uint8_t *address );
#line 1324 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_meter_address( uint8_t *address );
#line 1337 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_meter_key( uint8_t *key, encryption_type_t type );
#line 1349 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_indications( uint8_t *indications );
#line 1361 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_lbt_threshold( uint8_t *threshold );
#line 1382 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_lbt_advanced_opt( uint8_t *opt );
#line 1394 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_single_channel_lbt_bo_max( uint8_t *max );
#line 1406 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_single_channel_lbt_bo_flat( uint8_t *flat );
#line 1418 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_single_channel_lbt_delay( uint16_t *delay );
#line 1430 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_single_channel_lbt_bo_period( uint16_t *period );
#line 1443 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_multi_channel_lbt_bo_max( uint8_t *max );
#line 1458 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_multicast_address( uint8_t *address );
#line 1471 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_single_channel_lbt_ra_max( uint8_t *max );
#line 1483 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_single_channel_lbt_ra_flat( uint8_t *flat );
#line 1495 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_single_channel_lbt_ra_period( uint8_t *period );
#line 1512 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_fac_options( uint8_t *options );
#line 1524 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_fac_fast_tro_min( uint16_t *min );
#line 1536 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_fac_fast_tro_max( uint16_t *max );
#line 1548 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_fac_slow_tro_min( uint16_t *min );
#line 1560 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_fac_slow_tro_max( uint16_t *max );
#line 1572 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_fac_txd( uint8_t *txd );
#line 1584 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_get_fac_timeout( uint8_t *timeout );
#line 1596 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_mbus_mode( mbus_role_t role );
#line 1608 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_serial_rx_format( serial_rx_format_t format );
#line 1624 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_serial_tx_format( serial_tx_format_t format );
#line 1636 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_tx_rx_pins( uint8_t pins );
#line 1648 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_estim_freq_offset( uint8_t offset );
#line 1660 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_c_field( uint8_t c_field_val );
#line 1672 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_m_field_0( uint8_t m_field_val );
#line 1684 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_m_field_1( uint8_t m_field_val );
#line 1696 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_a_field_0( uint8_t a_field_val );
#line 1708 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_a_field_1( uint8_t a_field_val );
#line 1720 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_a_field_2( uint8_t a_field_val );
#line 1732 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_a_field_3( uint8_t a_field_val );
#line 1744 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_a_field_4( uint8_t a_field_val );
#line 1756 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_a_field_5( uint8_t a_field_val );
#line 1768 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_ci_field( uint8_t ci_field_val );
#line 1780 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_radio_channel( channel_t channel );
#line 1792 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_preamble_length( preamble_length_t length );
#line 1804 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_radio_output_power( radio_output_pwr_t radio_pwr );
#line 1816 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_channel_plan( channel_t channel );
#line 1828 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_radio_output_dbm( radio_output_pwr_t output_pwr );
#line 1840 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_freq_offset( int8_t offset );
#line 1852 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_preamble_word( preamble_word_t pre_word );
#line 1864 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_serial_speed( serial_baud_t baud );
#line 1877 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_serial_timeout( uint8_t ms );
#line 1889 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_cts_management(  _Bool  enable );
#line 1901 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_cts_timeout( uint8_t seconds );
#line 1915 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_wakeup_timeout( uint8_t ms );
#line 1927 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_sleep_time( uint8_t ms );
#line 1939 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_rx_filter( rx_filter_t filter );
#line 1951 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_tx_options( tx_option_t option );
#line 1963 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_registered_meter_options( meter_options_t option );
#line 1975 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_manufac_address( uint8_t *address );
#line 1987 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_meter_address( uint8_t *address );
#line 2000 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_meter_key( uint8_t *key, encryption_type_t type );
#line 2012 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_indications(  _Bool  enable );
#line 2024 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_lbt_threshold( uint8_t threshold );
#line 2037 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_lbt_advanced_opt( lbt_options_t option );
#line 2049 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_single_channel_lbt_bo_max( uint8_t max );
#line 2061 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_single_channel_lbt_bo_flat( uint8_t flat );
#line 2073 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_single_channel_lbt_delay( uint16_t ms );
#line 2085 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_single_channel_lbt_bo_period( uint16_t ms );
#line 2098 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_multi_channel_lbt_bo_max( uint8_t max );
#line 2110 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_multicast_address( uint8_t *address );
#line 2122 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_single_channel_lbt_ra_max( uint8_t max );
#line 2134 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_single_channel_lbt_ra_flat( uint8_t flat );
#line 2147 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_single_channel_lbt_ra_period( uint8_t seconds );
#line 2159 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_fac_options( fac_options_t option );
#line 2170 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_fac_fast_tro_min( uint16_t min );
#line 2182 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_fac_fast_tro_max( uint16_t max );
#line 2194 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_fac_slow_tro_min( uint16_t min );
#line 2206 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_fac_slow_tro_max( uint16_t max );
#line 2218 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_fac_txd( uint8_t trans_delay );
#line 2230 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hw.h"
status_t mbus_set_fac_timeout( uint8_t timeout );
#line 1 "//vboxsvr/corey/projects/clicklibraries/mbus_click/library/include/mbus_hal.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdbool.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stddef.h"
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
#line 41 "//VBOXSVR/corey/Projects/ClickLibraries/MBus_click/library/src/mbus_hw.c"
static uint8_t tx_buffer[  245  ] = { 0 };
extern  _Bool  my_receive_flag;
static char creturn = 13;
static receive_frame_format_t receive_frame_format;
static transmit_frame_format_t transmit_frame_format;
static uint8_t rx_buffer[  300  ] = { 0 };
static uint16_t rx_buffer_cnt = 0;
static  _Bool  configuration;
static  _Bool  response_finished =  0 ;
#line 57 "//VBOXSVR/corey/Projects/ClickLibraries/MBus_click/library/src/mbus_hw.c"
static status_t mbus_read_reg( uint8_t *buffer );
static status_t mbus_write_reg( uint8_t *buffer );
static void mbus_update_rx_format( serial_rx_format_t format );
static void mbus_update_tx_format( serial_tx_format_t format );
static void mbus_set_formats_false( void );
static void reset_flags_buffers( void );
static status_t set_time_buffer( date_time_t *date, uint8_t *temp_buffer );
static void get_register_contents( uint8_t *buffer );
static void get_register_contents_long( uint16_t *buffer );
#line 70 "//VBOXSVR/corey/Projects/ClickLibraries/MBus_click/library/src/mbus_hw.c"
static status_t mbus_read_reg( uint8_t *buffer )
{
 mbus_hal_write_text( buffer );
 mbus_hal_write( creturn );
 return OK_STATUS;
}

static status_t mbus_write_reg( uint8_t *buffer )
{
 mbus_hal_write_text( buffer );
 mbus_hal_write( creturn );
 return OK_STATUS;
}

static void mbus_update_tx_format( serial_tx_format_t format )
{
 if ( format & CI_FIELD_TX )
 transmit_frame_format.ci_field =  1 ;
 else
 transmit_frame_format.ci_field =  0 ;
 if ( format & A_FIELD_TX )
 transmit_frame_format.a_field =  1 ;
 else
 transmit_frame_format.a_field =  0 ;
 if ( format & M_FIELD_TX )
 transmit_frame_format.m_field =  1 ;
 else
 transmit_frame_format.m_field =  0 ;
 if ( format & C_FIELD_TX )
 transmit_frame_format.c_field =  1 ;
 else
 transmit_frame_format.c_field =  0 ;
 if ( format & LENGTH_TX )
 transmit_frame_format.length_field =  1 ;
 else
 transmit_frame_format.length_field =  0 ;
}

static void mbus_update_rx_format( serial_rx_format_t format )
{
 if ( format & RSSI_RX )
 receive_frame_format.rssi_field =  1 ;
 else
 receive_frame_format.rssi_field =  0 ;
 if ( format & WAKEUP_CHAR_RX )
 receive_frame_format.wake_up_field =  1 ;
 else
 receive_frame_format.wake_up_field =  0 ;
 if ( format & LQI_RX )
 receive_frame_format.lqi_field =  1 ;
 else
 receive_frame_format.lqi_field =  0 ;
 if ( format & CI_FIELD_RX )
 receive_frame_format.ci_field =  1 ;
 else
 receive_frame_format.ci_field =  0 ;
 if ( format & A_FIELD_RX )
 receive_frame_format.a_field =  1 ;
 else
 receive_frame_format.a_field =  0 ;
 if ( format & M_FIELD_RX )
 receive_frame_format.m_field =  1 ;
 else
 receive_frame_format.m_field =  0 ;
 if ( format & C_FIELD_RX )
 receive_frame_format.c_field =  1 ;
 else
 receive_frame_format.c_field =  0 ;
 if ( format & LENGTH_RX )
 receive_frame_format.length_field =  1 ;
 else
 receive_frame_format.length_field =  0 ;
}

static void mbus_set_formats_false( void )
{
 receive_frame_format.wake_up_field =  0 ;
 receive_frame_format.length_field =  0 ;
 receive_frame_format.c_field =  0 ;
 receive_frame_format.m_field =  0 ;
 receive_frame_format.a_field =  0 ;
 receive_frame_format.ci_field =  0 ;
 receive_frame_format.lqi_field =  0 ;
 receive_frame_format.rssi_field =  0 ;
 receive_frame_format.freq_offset_field =  0 ;
 transmit_frame_format.length_field =  0 ;
 transmit_frame_format.c_field =  0 ;
 transmit_frame_format.m_field =  0 ;
 transmit_frame_format.a_field =  0 ;
 transmit_frame_format.ci_field =  0 ;
}

static void reset_flags_buffers( void )
{
 uint16_t i = 0;

 for ( i = 0; i <  300 ; i++ )
 rx_buffer[i] = 0;

 rx_buffer_cnt = 0;
 response_finished =  0 ;
}

static status_t set_time_buffer( date_time_t *date, uint8_t *temp_buffer )
{
 char tmp[10] = { 0 };

 if ( date->month < 10 && date->month > 0 )
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

 if ( date->day < 10 && date->day > 0 )
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

 if ( date->hour < 10 && date->hour >= 0 )
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

 if ( date->minute < 10 && date->minute >= 0 )
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

 if ( date->year < 10 && date->year >= 5 )
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

 if ( date->second < 10 && date->second >= 0 )
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

 while ( rx_buffer[rx_buffer_cnt] != '=' )
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
 str[i] = 0;
 *buffer = atoi( str );

}

static void get_register_contents_long( uint16_t *buffer )
{
 uint8_t i = 0;
 uint8_t end = 0;
 char str[6] = { 0 };

 while ( rx_buffer[rx_buffer_cnt] != '=' )
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
 str[i] =  ((void *)0) ;
 *buffer = atol( str );
}
#line 350 "//VBOXSVR/corey/Projects/ClickLibraries/MBus_click/library/src/mbus_hw.c"
void mbus_rx_isr( char rx_input )
{
 rx_buffer[rx_buffer_cnt++] = rx_input;

 if ( !configuration )
 {
 if ( rx_buffer_cnt >= rx_buffer[0] + 1 )
 {
 response_finished =  1 ;
 my_receive_flag =  1 ;
 }
 }
 else if ( configuration )
 {
 if ( rx_input == 13 )
 {
 response_finished =  1 ;
 rx_buffer[--rx_buffer_cnt] =  ((void *)0) ;
 }
 }
 if( rx_buffer_cnt >=  300  )
 mbus_rx_ctl(  0  );
 else
 mbus_rx_ctl(  1  );

}

void mbus_init()
{
 mbus_hal_init();
 mbus_set_formats_false();
}

status_t mbus_at_init( void )
{
 configuration =  1 ;
 reset_flags_buffers();


 mbus_hal_write_text(  "+++"  );

 while ( !response_finished );

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




 mbus_hal_write_text(  "ATO"  );
 mbus_hal_write( creturn );

 while ( !response_finished );

 configuration =  0 ;
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



 mbus_hal_write_text(  "AT/V"  );
 mbus_hal_write( creturn );

 while ( !response_finished );

 strcpy( version, rx_buffer );

 return OK_STATUS;
}
#line 483 "//VBOXSVR/corey/Projects/ClickLibraries/MBus_click/library/src/mbus_hw.c"
status_t mbus_reset_params( void )
{
 reset_flags_buffers();




 mbus_hal_write_text(  "ATR"  );
 mbus_hal_write( creturn );

 while ( !response_finished );

 if ( rx_buffer[0] != 'O' )
 return ERROR;

 mbus_set_formats_false();

 return OK_STATUS;
}

status_t mbus_reset_meters_list( void )
{
 reset_flags_buffers();



 mbus_hal_write_text(  "ATM"  );
 mbus_hal_write( creturn );

 while ( !response_finished );

 if ( rx_buffer[0] != 'O' )
 return ERROR;

 return OK_STATUS;
}

status_t mbus_run_bootloader( void )
{
 reset_flags_buffers();



 mbus_hal_write_text(  "ATBL"  );
 mbus_hal_write( creturn );

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
 strncat( buffer,  "ATDT=" , 5 );
 status = set_time_buffer( date, temp_buffer );

 if ( status == ERROR )
 return ERROR;

 strcat( buffer, temp_buffer );


 mbus_hal_write_text( buffer );
 mbus_hal_write( creturn );

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


 mbus_hal_write_text(  "ATDT?"  );
 mbus_hal_write( creturn );

 while ( !response_finished );

 if ( rx_buffer[0] == 'E' )
 return ERROR;

 memcpy( temp_buffer, rx_buffer, rx_buffer_cnt );

 tmp[0] = temp_buffer[0];
 tmp[1] = temp_buffer[1];
 date->month = atoi( tmp );
 tmp[0] = temp_buffer[2];
 tmp[1] = temp_buffer[3];
 date->day = atoi( tmp );
 tmp[0] = temp_buffer[4];
 tmp[1] = temp_buffer[5];
 date->hour = atoi( tmp );
 tmp[0] = temp_buffer[6];
 tmp[1] = temp_buffer[7];
 date->minute = atoi( tmp );
 tmp[0] = temp_buffer[8];
 tmp[1] = temp_buffer[9];
 date->year = atoi( tmp );
 tmp[0] = temp_buffer[10];
 tmp[1] = temp_buffer[11];
 date->second = atoi( tmp );

 return OK_STATUS;
}

status_t mbus_set_cont_modulated_carrier( void )
{
 reset_flags_buffers();
 mbus_hal_write_text(  "ATT0"  );
 mbus_hal_write( creturn );

 while ( !response_finished );

 if ( rx_buffer[0] == 'E' )
 return ERROR;

 return OK_STATUS;
}

status_t mbus_set_pure_carrier_trans( void )
{
 reset_flags_buffers();
 mbus_hal_write_text(  "ATT1"  );
 mbus_hal_write( creturn );

 while ( !response_finished );

 if ( rx_buffer[0] == 'E' )
 return ERROR;

 return OK_STATUS;
}

status_t mbus_set_cont_modulated_carrier_random( void )
{
 reset_flags_buffers();
 mbus_hal_write_text(  "ATT3"  );
 mbus_hal_write( creturn );

 while ( !response_finished );

 if ( rx_buffer[0] == 'E' )
 return ERROR;

 return OK_STATUS;
}

status_t mbus_send_frame( transmit_frame_t *transmit_frame, uint16_t data_len )
{
 uint8_t i = 0;
 uint8_t k = 0;

 if ( transmit_frame_format.length_field )
 tx_buffer[i++] = transmit_frame->length_field;
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


 if ( receive_frame_format.wake_up_field )
 i++;
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
#line 712 "//VBOXSVR/corey/Projects/ClickLibraries/MBus_click/library/src/mbus_hw.c"
 k = 0;
 if ( receive_frame_format.lqi_field )
 remaining++;
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

 my_receive_flag =  0 ;
}


status_t mbus_add_edit_meter( meter_options_t options, uint8_t *meter_address, uint8_t *encrypt_key,
 encryption_type_t enc_mode, uint8_t *manufac_id )
{
 status_t status;

 mbus_set_meter_address( meter_address );
 if ( manufac_id !=  ((void *)0)  )
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
 mbus_set_meter_address( meter_address );
 mbus_set_registered_meter_options( 0 );
}




status_t mbus_get_serial_number( uint8_t *serial_num )
{
 uint8_t buffer[10] =  "ATS"   "192"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 memcpy( serial_num, rx_buffer, rx_buffer_cnt );

 return status;
}

status_t mbus_get_mbus_mode( uint8_t *mode )
{
 uint8_t buffer[8] =  "ATS"   "400"   "?" ;
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
 uint8_t buffer[8] =  "ATS"   "401"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( format );

 return status;
}

status_t mbus_get_serial_rx_format( uint8_t *format )
{
 uint8_t buffer[8] =  "ATS"   "402"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( format );

 return status;
}

status_t mbus_get_tx_rx_pins( uint8_t *pins )
{
 uint8_t buffer[8] =  "ATS"   "403"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( pins );

 return status;
}

status_t mbus_get_estim_freq_offset( uint8_t *offset )
{
 uint8_t buffer[8] =  "ATS"   "404"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( offset );

 return status;
}

status_t mbus_get_c_field( uint8_t *field )
{
 uint8_t buffer[8] =  "ATS"   "410"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( field );

 return status;
}

status_t mbus_get_m_field_0( uint8_t *field )
{
 uint8_t buffer[8] =  "ATS"   "411"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( field );

 return status;
}

status_t mbus_get_m_field_1( uint8_t *field )
{
 uint8_t buffer[8] =  "ATS"   "412"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( field );

 return status;
}

status_t mbus_get_a_field_0( uint8_t *field )
{
 uint8_t buffer[8] =  "ATS"   "413"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( field );

 return status;
}

status_t mbus_get_a_field_1( uint8_t *field )
{
 uint8_t buffer[8] =  "ATS"   "414"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( field );

 return status;
}

status_t mbus_get_a_field_2( uint8_t *field )
{
 uint8_t buffer[8] =  "ATS"   "415"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( field );

 return status;
}

status_t mbus_get_a_field_3( uint8_t *field )
{
 uint8_t buffer[8] =  "ATS"   "416"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( field );

 return status;
}

status_t mbus_get_a_field_4( uint8_t *field )
{
 uint8_t buffer[8] =  "ATS"   "417"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( field );

 return status;
}

status_t mbus_get_a_field_5( uint8_t *field )
{
 uint8_t buffer[8] =  "ATS"   "418"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( field );

 return status;
}

status_t mbus_get_ci_field( uint8_t *field )
{
 uint8_t buffer[8] =  "ATS"   "419"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( field );

 return status;
}

status_t mbus_get_radio_channel( uint8_t *channel )
{
 uint8_t buffer[8] =  "ATS"   "420"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( channel );

 return status;
}

status_t mbus_get_preamble_length( uint8_t *length )
{
 uint8_t buffer[8] =  "ATS"   "421"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( length );

 return status;
}

status_t mbus_get_radio_output_power( uint8_t *power )
{
 uint8_t buffer[8] =  "ATS"   "422"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( power );

 return status;
}

status_t mbus_get_channel_plan( uint8_t *plan )
{
 uint8_t buffer[8] =  "ATS"   "423"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( plan );

 return status;
}

status_t mbus_get_current_channel( uint8_t *channel )
{
 uint8_t buffer[8] =  "ATS"   "424"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( channel );

 return status;
}

status_t mbus_get_radio_output_dbm( uint8_t *dbm )
{
 uint8_t buffer[8] =  "ATS"   "425"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( dbm );

 return status;
}

status_t mbus_get_freq_offset( int8_t *offset )
{
 uint8_t buffer[8] =  "ATS"   "426"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( offset );

 return status;
}

status_t mbus_get_preamble_word( uint8_t *word )
{
 uint8_t buffer[8] =  "ATS"   "427"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( word );

 return status;
}

status_t mbus_get_serial_speed( uint8_t *speed )
{
 uint8_t buffer[8] =  "ATS"   "430"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( speed );

 return status;
}

status_t mbus_get_serial_timeout( uint8_t *timeout )
{
 uint8_t buffer[8] =  "ATS"   "431"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( timeout );

 return status;
}

status_t mbus_get_cts_management( uint8_t *cts )
{
 uint8_t buffer[8] =  "ATS"   "432"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( cts );

 return status;
}

status_t mbus_get_cts_timeout( uint8_t *timeout )
{
 uint8_t buffer[8] =  "ATS"   "433"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( timeout );

 return status;
}







status_t mbus_get_wakeup_timeout( uint8_t *timeout )
{
 uint8_t buffer[8] =  "ATS"   "441"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( timeout );

 return status;
}

status_t mbus_get_sleep_time( uint8_t *time )
{
 uint8_t buffer[8] =  "ATS"   "442"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( time );

 return status;
}

status_t mbus_get_rx_filter( uint8_t *filter )
{
 uint8_t buffer[8] =  "ATS"   "452"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( filter );

 return status;
}

status_t mbus_get_tx_options( uint8_t *options )
{
 uint8_t buffer[8] =  "ATS"   "453"   "?" ;
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

 strcat( buffer[0],  "ATS"   "461"   "?"  );
 strcat( buffer[1],  "ATS"   "462"   "?"  );

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

 strcat( buffer[0],  "ATS"   "463"   "?"  );
 strcat( buffer[1],  "ATS"   "464"   "?"  );
 strcat( buffer[2],  "ATS"   "465"   "?"  );
 strcat( buffer[3],  "ATS"   "466"   "?"  );
 strcat( buffer[4],  "ATS"   "467"   "?"  );
 strcat( buffer[5],  "ATS"   "468"   "?"  );

 for ( i = 0; i < 6; i++ )
 {
 reset_flags_buffers();



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

 strcat( buffer[0],  "ATS"   "470"   "?"  );
 strcat( buffer[1],  "ATS"   "471"   "?"  );
 strcat( buffer[2],  "ATS"   "472"   "?"  );
 strcat( buffer[3],  "ATS"   "473"   "?"  );
 strcat( buffer[4],  "ATS"   "474"   "?"  );
 strcat( buffer[5],  "ATS"   "475"   "?"  );
 strcat( buffer[6],  "ATS"   "476"   "?"  );
 strcat( buffer[7],  "ATS"   "477"   "?"  );
 strcat( buffer[8],  "ATS"   "478"   "?"  );
 strcat( buffer[9],  "ATS"   "479"   "?"  );
 strcat( buffer[10],  "ATS"   "480"   "?"  );
 strcat( buffer[11],  "ATS"   "481"   "?"  );
 strcat( buffer[12],  "ATS"   "482"   "?"  );
 strcat( buffer[13],  "ATS"   "483"   "?"  );
 strcat( buffer[14],  "ATS"   "484"   "?"  );
 strcat( buffer[15],  "ATS"   "485"   "?"  );

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
 uint8_t buffer[8] =  "ATS"   "490"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( indications );

 return status;
}

status_t mbus_get_lbt_threshold( uint8_t *threshold )
{
 uint8_t buffer[8] =  "ATS"   "500"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( threshold );

 return status;
}

status_t mbus_get_lbt_advanced_opt( uint8_t *opt )
{
 uint8_t buffer[8] =  "ATS"   "501"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( opt );

 return status;
}

status_t mbus_get_single_channel_lbt_bo_max( uint8_t *max )
{
 uint8_t buffer[8] =  "ATS"   "502"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( max );

 return status;
}

status_t mbus_get_single_channel_lbt_bo_flat( uint8_t *flat )
{
 uint8_t buffer[8] =  "ATS"   "503"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( flat );

 return status;
}

status_t mbus_get_single_channel_lbt_delay( uint16_t *delay )
{
 uint8_t buffer[8] =  "ATS"   "504"   "?" ;
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
 uint8_t buffer[8] =  "ATS"   "506"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents_long( period );

 return status;
}

status_t mbus_get_multi_channel_lbt_bo_max( uint8_t *max )
{
 uint8_t buffer[8] =  "ATS"   "508"   "?" ;
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

 strcat( buffer[0],  "ATS"   "MULTICAST_ADDRESS_REG_0"   "?"  );
 strcat( buffer[1],  "ATS"   "MULTICAST_ADDRESS_REG_1"   "?"  );
 strcat( buffer[2],  "ATS"   "MULTICAST_ADDRESS_REG_2"   "?"  );
 strcat( buffer[3],  "ATS"   "MULTICAST_ADDRESS_REG_3"   "?"  );
 strcat( buffer[4],  "ATS"   "MULTICAST_ADDRESS_REG_4"   "?"  );
 strcat( buffer[5],  "ATS"   "MULTICAST_ADDRESS_REG_5"   "?"  );
 strcat( buffer[6],  "ATS"   "MULTICAST_ADDRESS_REG_6"   "?"  );
 strcat( buffer[7],  "ATS"   "MULTICAST_ADDRESS_REG_7"   "?"  );

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
 uint8_t buffer[8] =  "ATS"   "520"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( max );

 return status;
}

status_t mbus_get_single_channel_lbt_ra_flat( uint8_t *flat )
{
 uint8_t buffer[8] =  "ATS"   "521"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( flat );

 return status;
}

status_t mbus_get_single_channel_lbt_ra_period( uint8_t *period )
{
 uint8_t buffer[8] =  "ATS"   "522"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( period );

 return status;
}

status_t mbus_get_fac_options( uint8_t *options )
{
 uint8_t buffer[8] =  "ATS"   "530"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( options );

 return status;
}

status_t mbus_get_fac_fast_tro_min( uint16_t *min )
{
 uint8_t buffer[8] =  "ATS"   "531"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents_long( min );

 return status;
}

status_t mbus_get_fac_fast_tro_max( uint16_t *max )
{
 uint8_t buffer[8] =  "ATS"   "533"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents_long( max );

 return status;
}

status_t mbus_get_fac_slow_tro_min( uint16_t *min )
{
 uint8_t buffer[8] =  "ATS"   "535"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents_long( min );

 return status;
}

status_t mbus_get_fac_slow_tro_max( uint16_t *max )
{
 uint8_t buffer[8] =  "ATS"   "537"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents_long( max );

 return status;
}

status_t mbus_get_fac_txd( uint8_t *txd )
{
 uint8_t buffer[8] =  "ATS"   "539"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( txd );

 return status;
}

status_t mbus_get_fac_timeout( uint8_t *timeout )
{
 uint8_t buffer[8] =  "ATS"   "540"   "?" ;
 status_t status;

 reset_flags_buffers();
 status = mbus_read_reg( buffer );

 while ( !response_finished );

 get_register_contents( timeout );

 return status;
}




status_t mbus_set_mbus_mode( mbus_role_t role )
{
 char txt[8];
 uint8_t buffer[8] =  "ATS"   "400"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "402"   "=" ;

 reset_flags_buffers();
 mbus_update_rx_format( format );
 IntToStr( format, txt );
 Ltrim( txt );
 strcat( buffer, txt );
 mbus_write_reg( buffer );

 while ( !response_finished );

 if ( rx_buffer[0] == 'E' )
 return ERROR;
 else
 return OK_STATUS;
}

status_t mbus_set_serial_tx_format( serial_tx_format_t format )
{
 char txt[8];
 uint8_t buffer[8] =  "ATS"   "401"   "=" ;

 reset_flags_buffers();
 mbus_update_tx_format( format );
 IntToStr( format, txt );
 Ltrim( txt );
 strcat( buffer, txt );
 mbus_write_reg( buffer );

 while ( !response_finished );

 if ( rx_buffer[0] == 'E' )
 return ERROR;
 else
 return OK_STATUS;
}

status_t mbus_set_tx_rx_pins( uint8_t pins )
{
 char txt[8];
 uint8_t buffer[8] =  "ATS"   "403"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "404"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "410"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "411"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "412"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "413"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "414"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "415"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "416"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "417"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "418"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "419"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "420"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "421"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "422"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "423"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "425"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "426"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "427"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "430"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "431"   "=" ;

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

status_t mbus_set_cts_management(  _Bool  enable )
{
 char txt[8];
 uint8_t buffer[8] =  "ATS"   "432"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "433"   "=" ;

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







status_t mbus_set_wakeup_timeout( uint8_t ms )
{
 char txt[8];
 uint8_t buffer[8] =  "ATS"   "441"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "442"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "452"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "453"   "=" ;

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
 uint8_t buffer[14] =  "ATS"   "460"   "=" ;

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

 strcat( buffer[0],  "ATS"   "461"   "="  );
 strcat( buffer[1],  "ATS"   "462"   "="  );

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
 uint8_t i = 0;
 uint8_t buffer[8][14] = { 0 };

 strcat( buffer[0],  "ATS"   "463"   "="  );
 strcat( buffer[1],  "ATS"   "464"   "="  );
 strcat( buffer[2],  "ATS"   "465"   "="  );
 strcat( buffer[3],  "ATS"   "466"   "="  );
 strcat( buffer[4],  "ATS"   "467"   "="  );
 strcat( buffer[5],  "ATS"   "468"   "="  );

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
 uint8_t i = 0;
 uint8_t buffer[16][14] = { 0 };

 strcat( buffer[0],  "ATS"   "470"   "="  );
 strcat( buffer[1],  "ATS"   "471"   "="  );
 strcat( buffer[2],  "ATS"   "472"   "="  );
 strcat( buffer[3],  "ATS"   "473"   "="  );
 strcat( buffer[4],  "ATS"   "474"   "="  );
 strcat( buffer[5],  "ATS"   "475"   "="  );
 strcat( buffer[6],  "ATS"   "476"   "="  );
 strcat( buffer[7],  "ATS"   "477"   "="  );
 strcat( buffer[8],  "ATS"   "478"   "="  );
 strcat( buffer[9],  "ATS"   "479"   "="  );
 strcat( buffer[10],  "ATS"   "480"   "="  );
 strcat( buffer[11],  "ATS"   "481"   "="  );
 strcat( buffer[12],  "ATS"   "482"   "="  );
 strcat( buffer[13],  "ATS"   "483"   "="  );
 strcat( buffer[14],  "ATS"   "484"   "="  );
 strcat( buffer[15],  "ATS"   "485"   "="  );

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

status_t mbus_set_indications(  _Bool  enable )
{
 char txt[8];
 uint8_t buffer[8] =  "ATS"   "490"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "500"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "501"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "502"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "503"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "504"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "506"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "508"   "=" ;

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
 uint8_t i = 0;
 uint8_t buffer[8][14] = { 0 };

 strcat( buffer[0],  "ATS"   "MULTICAST_ADDRESS_REG_0"   "="  );
 strcat( buffer[1],  "ATS"   "MULTICAST_ADDRESS_REG_1"   "="  );
 strcat( buffer[2],  "ATS"   "MULTICAST_ADDRESS_REG_2"   "="  );
 strcat( buffer[3],  "ATS"   "MULTICAST_ADDRESS_REG_3"   "="  );
 strcat( buffer[4],  "ATS"   "MULTICAST_ADDRESS_REG_4"   "="  );
 strcat( buffer[5],  "ATS"   "MULTICAST_ADDRESS_REG_5"   "="  );
 strcat( buffer[6],  "ATS"   "MULTICAST_ADDRESS_REG_6"   "="  );
 strcat( buffer[7],  "ATS"   "MULTICAST_ADDRESS_REG_7"   "="  );

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
 uint8_t buffer[8] =  "ATS"   "520"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "521"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "522"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "530"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "531"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "533"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "535"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "537"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "539"   "=" ;

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
 uint8_t buffer[8] =  "ATS"   "540"   "=" ;

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
