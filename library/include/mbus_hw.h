/****************************************************************************
* Title                 :   M-Bus CLICK
* Filename              :   mbus_hw.h
* Author                :   CAL
* Origin Date           :   06/01/2016
* Notes                 :   None
*****************************************************************************/
/**************************CHANGE LIST **************************************
*
*    Date    Software Version    Initials   Description
*  06/01/16    XXXXXXXXXXX         CAL      Interface Created.
*
*****************************************************************************/
/**
 * @file mbus_hw.h
 * @brief Hardware Layer
 *
 * @par
 * Low level functions for
 * <a href="http://www.mikroe.com">MikroElektronika's</a> M-Bus click
 * board.
 */

/**
 * @page LIB_INFO Library Info
 * @date 01 June 2016
 * @author Corey Lakey
 * @copyright GNU Public License
 * @version 1.0.0 - Initial testing and verification
 */

/**
 * @page TEST_CFG Test Configurations
 *
 * ### Test configuration STM : ###
 * @par
 * -<b> MCU           </b> :      STM32F107VC
 * -<b> Dev. Board    </b> :      EasyMx Pro v7
 * -<b> Oscillator    </b> :      72 Mhz internal
 * -<b> Ext. Modules  </b> :      M-Bus Click
 * -<b> SW            </b> :      MikroC PRO for ARM 4.7.1
 *
 * ### Test configuration PIC32 : ###
 * @par
 * -<b> MCU           </b> :      PIC32MX795F512L
 * -<b> Dev. Board    </b> :      EasyPIC Fusion v7
 * -<b> Oscillator    </b> :      80 Mhz internal
 * -<b> Ext. Modules  </b> :      M-Bus Click
 * -<b> SW            </b> :      MikroC PRO for PIC 3.6.0
 *
 * ### Test configuration FT90x : ###
 * @par
 * -<b> MCU           </b> :      FT900Q
 * -<b> Dev. Board    </b> :      EasyFT90x v7
 * -<b> Oscillator    </b> :      100 Mhz internal
 * -<b> Ext. Modules  </b> :      M-Bus Click
 * -<b> SW            </b> :      MikroC PRO for FT90x 1.2.1
 *
 * ### Test configuration PIC : ###
 * @par
 * -<b> MCU           </b> :      PIC18F87K22
 * -<b> Dev. Board    </b> :      EasyPIC Pro v7
 * -<b> Oscillator    </b> :      16 Mhz external
 * -<b> Ext. Modules  </b> :      M-Bus Click
 * -<b> SW            </b> :      MikroC PRO for PIC 6.6.3
 *
 * ### Test configuration dsPIC : ###
 * @par
 * -<b> MCU           </b> :      dsPIC33EJ256GP710A
 * -<b> Dev. Board    </b> :      EasyPIC Fusion v7
 * -<b> Oscillator    </b> :      8 Mhz internal
 * -<b> Ext. Modules  </b> :      M-Bus Click
 * -<b> SW            </b> :      MikroC PRO for dsPIC 6.2.1
 *
 * ### Test configuration AVR : ###
 * @par
 * -<b> MCU           </b> :      ATMEGA32
 * -<b> Dev. Board    </b> :      EasyAVR v7
 * -<b> Oscillator    </b> :      8 Mhz external
 * -<b> Ext. Modules  </b> :      M-Bus Click
 * -<b> SW            </b> :      MikroC PRO for FT90x 6.1.1
 */

/**
 * @mainpage
 * <h3> General Description </h3>
 * @par
 *  M-Bus (Meter-Bus) is a European Standard for remote reading of gas, water or electricity
 * meters. M-Bus is also usable for other types of consumption meters. The M-Bus interface is
 * made for communication on two wires, making it very cost effective.
 *
 * <h3> Features </h3>
 * @par
 *
 *
 */
#ifndef MBUS_H
#define MBUS_H
/******************************************************************************
* Includes
*******************************************************************************/
#include <stdint.h>
#include <stdbool.h>

/******************************************************************************
* Preprocessor Constants
*******************************************************************************/

/******************************************************************************
* Configuration Constants
*******************************************************************************/

/******************************************************************************
* Macros
*******************************************************************************/
/**<         Stringify Macro         */
#define xstr(a) str(a)          /**< Stringify what is Sent, call is replaced with string. */
#define str(a) #a                               

/**<         AT Commands        */
#define AT_MODE                 "+++"       /**< Access to Modem’s Parameters Configuration Mode */
#define OP_MODE                 "ATO"       /**< Access to Modem’s Operating Mode */
#define FIRMWARE_READ           "AT/V"      /**< Displays the Modem’s Firmware and Bootloader Version # */
#define REG_READ                "ATS"       /**< Displays the Content of Hayes Register */
#define REG_READ_END            "?"         /**< End of Register Read command */
#define REG_WRITE               "ATS"       /**< Configures Hayes Register with New Value */
#define REG_WRITE_MIDDLE        "="         /**< End of Register Write Command */
#define RESET_MODEM_PARAM       "ATR"       /**< Resets all modem's Parameters to their Default Values */
#define RESET_REGISTERED_METER  "ATM"       /**< Resets the Registered Meters List */
#define RUN_BOOTLOADER          "ATBL"      /**< Exits Main Program and Runs Bootloader */
#define SET_DATE_TIME           "ATDT="     /**< Set Current Date and Time */
#define GET_DATE_TIME           "ATDT?"     /**< Get Current Date and Time */
#define CONT_MODE_00            "ATT"       /**< Continuous Modulated Carrier */
#define CONT_MODE_0             "ATT0"      /**< Continuous Modulated Carrier */
#define CONT_MODE_1             "ATT1"      /**< Continuous Modulated Carrier */
#define CONT_MODE_2             "ATT2"      /**< Continuous Modulated Carrier */
#define CONT_MODE_3             "ATT3"      /**< Continuous Modulated Carrier */

/**<        Registers         */
#define SERIAL_NUM_REG                  192     /**< Serial Number of the module */
#define M_BUS_MODE_REG                  400     /**< M-Bus Mode */
#define RX_FORMAT_REG                   401     /**< Serial RX Format */
#define TX_FORMAT_REG                   402     /**< Serial TX Format */
#define RX_TX_PIN_REG                   403     /**< RX / TX Pin */
#define EST_FREQ_OFFSET_REG             404     /**< Extimated Frequency Offeset */
#define C_FIELD_REG                     410     /**< C Field */
#define M_FIELD_BYTE_0_REG              411     /**< M Field Byte 0 */
#define M_FIELD_BYTE_1_REG              412     /**< M Field Byte 1 */
#define A_FIELD_BYTE_0_REG              413     /**< A Field Byte 0 */
#define A_FIELD_BYTE_1_REG              414     /**< A Field Byte 1 */
#define A_FIELD_BYTE_2_REG              415     /**< A Field Byte 2 */
#define A_FIELD_BYTE_3_REG              416     /**< A Field Byte 3 */
#define A_FIELD_BYTE_4_REG              417     /**< A Field Byte 4 */
#define A_FIELD_BYTE_5_REG              418     /**< A Field Byte 5 */
#define CI_FIELD_REG                    419     /**< CI Field */
#define RADIO_CHANNEL_REG               420     /**< Radio Channel */
#define PREAMBLE_LEN_REG                421     /**< Preamble Length */
#define RADIO_OUTPUT_PWR_REG            422     /**< Radio Output Power */
#define CHANNEL_PLAN_REG                423     /**< Channel Plan */
#define CURRENT_CHANNEL_REG             424     /**< Current Channel */
#define RADIO_OUTPUT_PWR_DBM_REG        425     /**< Radio Output Power dBm */
#define SET_FREQUENCY_OFFSET_REG        426     /**< Set Frequency Offset */
#define PREAMBLE_WORD_REG               427     /**< Preamble Word */
#define SERIAL_SPEED_REG                430     /**< Serial Speed */
#define SERIAL_TIME_OUT_REG             431     /**< Serial Time-Out */
#define CTS_MANAGEMENT_REG              432     /**< CTS Management */
#define CTS_TIME_OUT_REG                433     /**< CTS Time-Out */
#define WAKE_UP_OPTION_REG              440     /**< Wake-Up Options */
#define WAKE_UP_TIME_OUT_REG            441     /**< Wake-Up Time-Out */
#define SLEEP_TIME_REG                  442     /**< Sleep Time */
#define RX_FILTER_REG                   452     /**< RX Filter */
#define TX_OPTIONS_REG                  453     /**< TX Options */
#define REPEATER_REG                    454     /**< Repeater */
#define REGISTER_METER_OPTIONS_REG      460     /**< Registered Meter Options */
#define MANUFAC_ADDRESS_REG_0           461     /**< Manufacture ID ( 461 - 462 ) */
#define MANUFAC_ADDRESS_REG_1           462     /**< Manufacture ID ( 461 - 462 ) */
#define METER_ADDRESS_REG_0             463     /**< Meter Address ( 463 - 468 ) */
#define METER_ADDRESS_REG_1             464     /**< Meter Address ( 461 - 468 ) */
#define METER_ADDRESS_REG_2             465     /**< Meter Address ( 461 - 468 ) */
#define METER_ADDRESS_REG_3             466     /**< Meter Address ( 461 - 468 ) */
#define METER_ADDRESS_REG_4             467     /**< Meter Address ( 461 - 468 ) */
#define METER_ADDRESS_REG_5             468     /**< Meter Address ( 461 - 468 ) */
#define METER_KEY_REG_0                 470     /**< Meter Key ( 470 - 485 ) */
#define METER_KEY_REG_1                 471     /**< Meter Key ( 470 - 485 ) */
#define METER_KEY_REG_2                 472     /**< Meter Key ( 470 - 485 ) */
#define METER_KEY_REG_3                 473     /**< Meter Key ( 470 - 485 ) */
#define METER_KEY_REG_4                 474     /**< Meter Key ( 470 - 485 ) */
#define METER_KEY_REG_5                 475     /**< Meter Key ( 470 - 485 ) */
#define METER_KEY_REG_6                 476     /**< Meter Key ( 470 - 485 ) */
#define METER_KEY_REG_7                 477     /**< Meter Key ( 470 - 485 ) */
#define METER_KEY_REG_8                 478     /**< Meter Key ( 470 - 485 ) */
#define METER_KEY_REG_9                 479     /**< Meter Key ( 470 - 485 ) */
#define METER_KEY_REG_10                480     /**< Meter Key ( 470 - 485 ) */
#define METER_KEY_REG_11                481     /**< Meter Key ( 470 - 485 ) */
#define METER_KEY_REG_12                482     /**< Meter Key ( 470 - 485 ) */
#define METER_KEY_REG_13                483     /**< Meter Key ( 470 - 485 ) */
#define METER_KEY_REG_14                484     /**< Meter Key ( 470 - 485 ) */
#define METER_KEY_REG_15                485     /**< Meter Key ( 470 - 485 ) */
#define INDICATIONS_REG                 490     /**< Indications */
#define LBT_THRESHOLD_REG               500     /**< LBT Threshold */
#define LBT_ADVANCED_OPTIONS_REG        501     /**< LBT Advanced Options */
#define SINGLE_CHNL_LBT_BO_MAX_REG      502     /**< Single Channel LBT BO Max */
#define SINGLE_CHNL_LBT_BO_FLAT_REG     503     /**< Single Channel LBT BO Flat */
#define SINGLE_CHNL_LBT_DELAY_REG       504     /**< Single Channel LBT Delay */
#define SINGLE_CHNL_LBT_BO_PERIOD       506     /**< Single Channel LBT BO Period */
#define MULTI_CHNL_LBT_BO_MAX           508     /**< Multi Channel LBT BO Max */
#define MULTICAST_ADDRESS_0             510     /**< Multicast Address ( 510 - 517 ) */
#define MULTICAST_ADDRESS_1             511     /**< Multicast Address ( 510 - 517 ) */
#define MULTICAST_ADDRESS_2             512     /**< Multicast Address ( 510 - 517 ) */
#define MULTICAST_ADDRESS_3             513     /**< Multicast Address ( 510 - 517 ) */
#define MULTICAST_ADDRESS_4             514     /**< Multicast Address ( 510 - 517 ) */
#define MULTICAST_ADDRESS_5             515     /**< Multicast Address ( 510 - 517 ) */
#define MULTICAST_ADDRESS_6             516     /**< Multicast Address ( 510 - 517 ) */
#define MULTICAST_ADDRESS_7             517     /**< Multicast Address ( 510 - 517 ) */
#define SINGLE_CHNL_LBT_RA_MAX          520     /**< Single Channel LBT RA Max */
#define SINGLE_CHNL_LBT_RA_FLAT         521     /**< Single Channel LBT RA Flat */
#define SINGLE_CHNL_LBT_RA_PERIOD       522     /**< Single Channel LBT RA Period */
#define FAC_OPTIONS                     530     /**< FAC Options */
#define FAC_FAST_TROMIN                 531     /**< FAC Fast tROMin */
#define FAC_FAST_TROMAX                 533     /**< FAC Fast tROMax */
#define FAC_SLOW_TROMIN                 535     /**< FAC Slow tROMin */
#define FAC_SLOW_TROMAX                 537     /**< FAC Slow tROMax */
#define FAC_TXD                         539     /**< FAC txD */
#define FAC_TIMEOUT                     540     /**< FAC Timeout */

/******************************************************************************
* Typedefs
*******************************************************************************/
typedef enum
{
        DES_MODE = 0,       /**< Data Encryption Standard */
        AES_MODE = 1,       /**< Advanced Encryption Standard */
        NO_ENCRYPT = 2      /**< No Encryption Used */
} encryption_type_t;

typedef enum
{
        /**< Mode S ***********/
        ROLE_S1_METER = 0,      /**< The bit rate for radio communication is 32.768 kbps. */
        ROLE_S1_OTHER = 1,      /**< The following two sub-modes are defined: */
        ROLE_S2_METER = 2,      /**< • Mode S1 operates exactly as Mode T1 (unidirectional spontaneous transmission) but */
        ROLE_S2_OTHER = 3,      /**<  uses a different radio link. */
                                /**<  • Mode S2 is similar to Mode T2 (meter sends a frame and waits for a response during */
                                /**<  a short interval) but also with a different physical link. */
        /**< Mode T ***********/        
        ROLE_T1_METER = 4,      /**< In mode T, the meter sends spontaneously data, either periodically or stochastically. Frame */
        ROLE_T1_OTHER = 5,      /**< transmission from meters to other devices uses a bit rate of 100 kbps, while communication in */
        ROLE_T2_METER = 6,      /**< the opposite direction is carried out at 32.768 kbps. */
        ROLE_T2_OTHER = 7,      /**< • In Mode T1 the meter doesn’t care if any receiver is present or not. The meter sends 
                                /**< data and returns immediately in power-save mode without waiting for a response. */
                                /**< This is a unidirectional communication. */
                                /**< • In Mode T2 the meter sends its data and stays awake during a short time immediately */
                                /**< after transmission to listen to a possible response frame. If no response is received, */
                                /**< the meter returns in power-save mode. If a response is received, then a bidirectional */
                                /**< communication link is opened between meter and concentrator. */
        /**< Mode R ***********/
        ROLE_R2_METER = 8,      /**< In Mode R2 the meter doesn’t send spontaneously data. The meter wakes up periodically in */
        ROLE_R2_OTHER = 9,      /**< Rx mode and waits for a wakeup frame received from concentrator. If no frame is received, */
                                /**< the meter returns in power-save mode. If a valid wakeup frame is received, a bidirectional */
                                /**< link is then opened between meter and concentrator. The bit rate used in this mode is 4.8 kbps.*/
        /**< Mode C ***********/
        ROLE_C1_METER = 10,     /**< This mode is similar to mode T but uses a different encoding scheme (NRZ); communication */
        ROLE_C1_OTHER = 11,     /**< from meters to other devices is at 100 kbps, while in the opposite direction a 50 kbps bit rate */
        ROLE_C2_METER = 12,     /**< is used. Two sub-modes are defined, C1 for unidirectional communication from meters to */
        ROLE_C2_OTHER = 13,     /**< other devices and C2 for bidirectional communication. */

        /**< Mode N ***************/
        ROLE_N1_METER = 14,     /**< It uses narrowband communication in the 169 MHz frequency band; the two sub-modes N1 */
        ROLE_N1_OTHER = 15,     /**< and N2 are for unidirectional and bidirectional communication, respectively. The standard */
        ROLE_N2_METER = 16,     /**< Wireless M-Bus defines different channels, with different bit rates and modulation types, as */
        ROLE_N2_OTHER = 17      /**< listed below: */
                                /**< • Channel 1a: 4.8 kbps, GFSK modulation */
                                /**< • Channel 1b: 4.8 kbps, GFSK modulation */
                                /**< • Channel 2a: 2.4 kbps, GFSK modulation */
                                /**< • Channel 2b: 2.4 kbps, GFSK modulation */
                                /**< • Channel 3a: 4.8 kbps, GFSK modulation */
                                /**< • Channel 3b: 4.8 kbps, GFSK modulation */
                                /**< • Channel 0: 19.2 kbps, 4-GFSK modulation */
                                /**< Additionally, the CIG interchangeable Task Force defines that channels 2a and 2b can be */
                                /**< accessed at 2.4 kbps or 4.8 kbps. */
} mbus_role_t;

typedef enum
{
        FORMAT_A = 0,       /**< This format can be used in any of the Wireless M-Bus modes */
        FORMAT_B
} mbus_data_format_t;       /**< This format can optionally be used in Modes C, N and F */

typedef enum
{
        OK_STATUS   = 0x01,     /**< Function worked correctly */
        ERROR       = 0X02      /**< There was error while executing function */
} status_t;

typedef enum
{
        CI_FIELD_TX = 16,   /**< CI-field is the Control Information to indicate the protocol used to the upper layer */
        A_FIELD_TX  = 8,    /**< A-field is the address of the sending device and is composed of the concatenation of */
                            /**< an identification number (4 bytes), a version code (1 byte) and a device type code (1 */
                            /**< byte) */
        M_FIELD_TX  = 4,    /**< M-field is the Manufacturer ID of the sending device */
        C_FIELD_TX  = 2,    /**< C-field is the communication indication (request, send, response expected, ACK...) */
        LENGTH_TX   = 1     /**< L-field is the length indication: the difference between frame format A and B is that */
                            /**< in the former case this field does not include the length of CRC-fields, while in */
                            /**< format B frames it includes the length of CRC-fields */
} serial_tx_format_t;

typedef enum
{
        FREQ_OFFSET_RX  = 256,      /**< Estimated Frequency Offset of the received signal compared to the module frequency */
        RSSI_RX         = 128,      /**< Received Signal Strength Indicator, containing the input power of the */
                                    /**< received radio frame expressed in dBm as a signed 8 bit number. */
        WAKEUP_CHAR_RX  = 64,       /**< Wakeup character is very useful especially in Mode R2 to work as “Wake On Radio” way. */
        LQI_RX          = 32,       /**< This byte indicates the level of radio reception, from 0 (poor) to 3 (excellent). */
        CI_FIELD_RX     = 16,       /**< Option to be used if several applicative layers use the wireless M-Bus link */
        A_FIELD_RX      = 8,        /**< A-field is the address of the sending device and is composed of the concatenation of */
        M_FIELD_RX      = 4,        /**< M-field is the Manufacturer ID of the sending device */
        C_FIELD_RX      = 2,        /**< Specifies the role of the frame (Request, ACK, ...). */
        LENGTH_RX       = 1         /**< Indicates to the user the length of serial frame he is receiving. Length */
                                    /**< value takes into account the subsequent bytes, including other serial */
                                    /**< options fields if any, but excluding LQI and RSSI fields. */
} serial_rx_format_t;

typedef enum
{
        BPS_4800_1A = 0,        /**< 8 bits mask containing the list of channels that can be */
        BPS_4800_1B,            /**< used for multichannel mode (for N mode only); */
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
        SHORT_PREAM = 0,        /**< Short Preamble length */
        LONG_PREAM  = 1         /**< Long Preamble length */
} preamble_length_t;            /**< When using Mode S1, this register allows the */
                                /**< module to work either in sub-mode S1-m (short */
                                /**< preamble) or in normal Mode S1 (long preamble). */

typedef enum
{
        /**< Indicates the output power of the RF module: */
        DBM_21 = 0,     /**< ‘0’: 0 dBm (ME50), +21 dBm (ME70) */
        DBM_24,         /**< ‘1’: +5 dBm (ME50), +24 dBm (ME70) */
        DBM_27,         /**< ‘2’: +10 dBm (ME50), +27 dBm (ME70) */
        DBM_30,         /**< ‘3’: +14 dBm (ME50-868), +15.5 dBm (ME50-169), +30 dBm (ME70-169) */
        DBM_18,         /**< ‘4’: +18 dBm (ME70-169) */
        DBM_15,         /**< ‘5’: +15 dBm (ME70-169) */
        DBM_12          /**< ‘6’: +12 dBm (ME70-169) */
} radio_output_pwr_t;

typedef enum
{
        PREAMBLE_0 = 0x55,  /**< Indicates the preamble byte configuration (for Mode N only): */
        PREAMBLE_1 = 0xAA
} preamble_word_t;

typedef enum
{       /**< Indicates the speed on the serial link : */
        BAUD_1200 = 1,      /**< ‘1’: 1200 bits/s */
        BAUD_2400,          /**< ‘2’: 2400 bits/s */
        BAUD_4800,          /**< ‘3’: 4800 bits/s */
        BAUD_9600,          /**< ‘4’: 9600 bits/s */
        BAUD_19200,         /**< ‘5’: 19200 bits/s (default) */
        BAUD_38400,         /**< ‘6’: 38400 bits/s */
        BAUD_57600,         /**< ‘7’: 57600 bits/s */
        BAUD_115200         /**< ‘8’: 115200 bits/s */
} serial_baud_t;

typedef enum
{
        LOW_PWR_WAKEUP          = 0,    /**< Indicates the different ways to wake-up the RF module. */
        SERIAL_CHAR_WAKEUP      = 1
} wakeup_opt_t;

typedef enum
{
        RX_FILTER_ENABLE = 0,   /**< 8 bits mask indicating whether received radio frames are */
        RX_MULTICAST,           /**< filtered based on their M-field and A-field. */
        RX_BROADCAST
} rx_filter_t;

typedef enum
{
        LISTEN_B4_TALK_TX = 1,  /**< Enables Listen Before Talk */
        FRAME_FMT_B_TX,         /**< Enables frame format B (only for Modes C and N) */
        AUTO_TRANS_TX,          /**< Enables automatic frame transmission */
        SYNC_TRANS_TX,          /**< Enables synchronized frame transmission */
        MULTI_FRAME_TX,         /**< Enables multi-frame operation */
        SERIAL_ACK_TX           /**< Enables serial acknowledge */
} tx_option_t;

typedef enum
{
        DONT_FILTER     = 2,        /**< Sets this bit to ‘1’ in concentrators to enable sending to the */
                                    /**< serial port frames received from the registered meter */
        ENABLE_ENCRYPT  = 4,        /**< Activates encryption and decryption to frames exchanged with the registered meter */
        AUTO_CNF_IR     = 8,
        AUTO_ACK        = 16
} meter_options_t;

typedef enum
{
        ALOHA_LBT = 0,          /**< The single channel ALOHA LBT access uses an exponentially increasing random time
                                backoff with a limited allowed time delay. If the channel is clear then the module transmits
                                the frame, else if the channel is not clear the module performs a random backoff in time and
                                then re-assesses the channel. The random backoff is exponentially increasing. The module
                                shall attempt this for a number of LBT tries or for an overall delay time limit. If the number of
                                tries is exceeded or the delay time limit is exceeded then the module determines if it is
                                allowed to transmit the frame or not in a LBT override (bit 2 of configuration register 501). */
        
        AFA_LBT,                /**< AFA is defined as the capability of an equipment to dynamically change channel within its
                                available frequencies for proper operation. The algorithm described includes the use of
                                Adaptive Frequency Agility, AFA, which changes channels between LBT attempts. The list
                                of the available channels is defined by register 423. The initial channel selected is from a 
                                uniform random distribution of the available channels (defined by Channel Plan). The channel 
                                assessment is performed. If the channel is clear then the LBT is successful and the frame is 
                                transmitted, else if the channel assessment is not clear then the LBT backoff count is incremented 
                                by one (1) and resaved. If the LBT backoff count is greater than the maximum allowed LBT backoff 
                                then the module determines if it is allowed to transmit the frame or not in a LBT override 
                                (bit 2 of configuration register 501). */
        
        OVERRIDE,               /**< ALOHA algorithm without override is performed for each attempt. If the number of reattempt
                                is exceeded then the module determines if it is allowed to transmit the frame or not in a LBT
                                override (bit 2 of configuration register 501). */
        
        LBT_REATTEMPT,          /**< When ALOHA LBT is enabled and there is a failure of a single channel access, it is possible
                                to perform a reattempt process. Single channel LBT reattempt is enabled when:
                                • bit 1 of configuration register 453 is set to 1
                                • bit 0 of configuration register 501 is set to 1
                                • bit 1 of configuration register 501 is set to 0
                                • bit 3 of configuration register 501 is set to 1
                                Single channel LBT reattempt parameters can be set using configuration registers 520-522. */
        
        DIF_FRM_LBT_REATTEMPT   /**< Enables different frames between an LBT reattempt and the next one */
} lbt_options_t;

typedef enum
{
        FREQUENT_ACCESS_CYCLE = 0,  /**< Allows enabling support for the Frequent Access Cycle on meter side. Indications are required 
                                    for this functionality. */
       
        FAST_RESPONSE_DELAY         /**< If the bit 1 of register 530 is set to 1, module will use the fast response delay (registers 531
                                    and 533) */
} fac_options_t;

typedef enum
{
        GFSK = 0,       /**< Gaussian Frequency Shift Keying */
        GFSK_4 = 1      /**< Gaussian Frequency Shift Keying 4 */
} modulation_t;

typedef struct
{
        bool wake_up_field;         /**< No Wake-up Pin connected... Very useful especially in Mode R2 to work as “Wake On Radio” way.
                                    With this character the user can be woken up by serial if a valid radio frame is received. This 
                                    option comes in addition to the STANDBY STATUS signal. */
        
        bool length_field;          /**< Indicates to the user the length of serial frame he is receiving. Length value takes into 
                                    account the subsequent bytes, including other serial options fields if any, but excluding LQI 
                                    and RSSI fields. */

        bool c_field;               /**< Specifies the role of the frame (Request, ACK, ...). */
        
        bool m_field;               /**< Indicate the M-field and A-field of the received frame. M and A can be */
        bool a_field;               /**< activated separately. */

        bool ci_field;              /**< Option to be used if several applicative layers use the wireless M-Bus link. */

        bool lqi_field;             /**< This byte indicates the level of radio reception, from 0 (poor) to 3 (excellent). */

        bool rssi_field;            /**< Received Signal Strength Indicator, containing the input power of the received radio frame 
                                    expressed in dBm as a signed 8 bit number. */

        bool freq_offset_field;     /**< This byte indicates the estimated frequency offset of the received signal compared to the 
                                    module frequency, expressed in ppm as a signed 8 bit number. */
} receive_frame_format_t;

typedef struct
{
        bool length_field;          /**< Giving the serial frame length to the RF module shortcuts the serial time out
                                    at the end of RX, leading in a very short wake up duration and very low
                                    power results. Using this field allows to save at least 2 ms for each wake up
                                    cycle. The RF module considers that the serial frame is complete as soon as
                                    the specified length is reached.
                                    Length value should count all subsequent bytes, including other serial
                                    options fields if any. Only Wake-up and Length bytes don’t enter in the
                                    calculation of Length. */

        bool c_field;               /**< It specifies the role of the frame (Request, ACK ...). */

        bool m_field;               /**< Use this option to simplify the maintenance: in case of radio module */
        bool a_field;               /**< replacement, the ID is already specified in the host and doesn’t need to be set
                                    through registers. However this option makes the serial frame longer and increases the work
                                    duration (more power consumption). M and A can be activated separately. */

        bool ci_field;              /**< Option to be used if several applicative layers use the wireless M-Bus link. If
                                    only one application is running, the CI-field can be fixed and specified in the
                                    corresponding register. */
} transmit_frame_format_t;

typedef struct
{
        uint8_t length_field;       /**< Indicates to the user the length of serial frame he is receiving. Length value takes into 
                                    account the subsequent bytes, including other serial options fields if any, but excluding LQI 
                                    and RSSI fields. */

        uint8_t c_field;            /**< Specifies the role of the frame (Request, ACK, ...). */

        uint8_t m_field[2];         /**< Indicate the M-field and A-field of the received frame. M and A can be */
        uint8_t a_field[6];         /**< activated separately. */

        uint8_t ci_field;           /**< Option to be used if several applicative layers use the wireless M-Bus link. */    

        uint8_t data_field[245];    /**< Data Field */

        uint8_t lqi_field;          /**< This byte indicates the level of radio reception, from 0 (poor) to 3 (excellent). */

        uint8_t rssi_field;         /**< Received Signal Strength Indicator, containing the input power of the received radio frame 
                                    expressed in dBm as a signed 8 bit number. */

        uint8_t freq_offset_field;  /**< This byte indicates the estimated frequency offset of the received signal compared to the 
                                    module frequency, expressed in ppm as a signed 8 bit number. */
} receive_frame_t;

typedef struct
{
        uint8_t length_field;       /**< Giving the serial frame length to the RF module shortcuts the serial time out
                                    at the end of RX, leading in a very short wake up duration and very low
                                    power results. Using this field allows to save at least 2 ms for each wake up
                                    cycle. The RF module considers that the serial frame is complete as soon as
                                    the specified length is reached.
                                    Length value should count all subsequent bytes, including other serial
                                    options fields if any. Only Wake-up and Length bytes don’t enter in the
                                    calculation of Length. */

        uint8_t c_field;            /**< It specifies the role of the frame (Request, ACK ...). */

        uint8_t m_field[2];         /**< Use this option to simplify the maintenance: in case of radio module */
        uint8_t a_field[6];         /**< replacement, the ID is already specified in the host and doesn’t need to be set
                                    through registers. However this option makes the serial frame longer and increases the work
                                    duration (more power consumption). M and A can be activated separately. */

        uint8_t ci_field;           /**< Option to be used if several applicative layers use the wireless M-Bus link. If
                                    only one application is running, the CI-field can be fixed and specified in the
                                    corresponding register. */

        uint8_t data_field[245];    /**< Data Field */
} transmit_frame_t;

typedef struct
{
        uint8_t month;  /**< Month from 1 to 12 */                
        uint8_t day;    /**< Day from 1 to 31 */
        uint8_t hour;   /**< Hour from 0 to 23 */
        uint8_t minute; /**< Minute from 0 to 59 */
        uint8_t year;   /**< Year from 5 to 99 */
        uint8_t second; /**< Second from 0 to 59 */
} date_time_t;

//Not implemented yet.... 
typedef enum 
{
        NO_CHANNEL_SEL = 0x00,  /**< Frame will be sent on the channel on which it has transmitted the last frame, without using
                                any LBT method (register 501 and bit 1 of register 453 are ignored). */
        
        CHANNEL_SEL    = 0x01,  /**< Before transmitting any radio frame, depending on the configuration for multichannel (register 423) 
                                and LBT (register 501 and bit 1 of register 453), module selects a random channel and/or performs LBT.
                                If the user host sends a MBUS frame with Header equal to 0x01, an indication with Indication Type 0x0000, 
                                0x0001, 0x0002 or 0x0003 will be sent to the user host just after the frame is sent to RF. */
        
        NEW_FRAME_LBT  = 0x02   /**< When bit 4 of register 501 is set to 1, a new frame can be sent between an LBT attempt and the next 
                                one. This frame can be sent after the indication 0x0004. The first attempt is performed using the
                                header 0x01, the following ones using 0x02. */
} indication_header_t;

typedef enum 
{
        LBT_OK                          = 0x0000,   /**< This outcoming indication is sent when channel assessment is performed 
                                                    and LBT returns OK (channel free: frame can be sent) or LBT is disabled. This 
                                                    indication is sent just after the frame is sent to RF. */
        
        LBT_OVERRIDE                    = 0x0001,   /**< This outcoming indication is sent when channel assessment is performed, LBT
                                                    returns FAIL but override option is enabled. This indication is sent just after 
                                                    the frame is sent to RF. */
        
        LBT_ERROR                       = 0x0002,   /**< This outcoming indication is sent when channel assessment is performed, LBT 
                                                    returns FAIL and override option is disabled. This indication is sent just after 
                                                    LBT returns. If LBT reattempt is enabled, this indication is sent if the last 
                                                    attempt returns FAIL and override is disabled. */
        
        LBT_REATTEMPT_ERROR             = 0x0003,   /**< This outcoming indication is sent when channel assessment is performed with 
                                                    LBT reattempt, and the current attempt returns FAIL. This indication is sent just 
                                                    after LBT returns. */
        
        LBT_REATTEMPT_WAITING           = 0x0004,   /**< This outcoming indication is sent when bit 4 of register 501 is set to 1. 
                                                    Module waits for a new frame for the next attempt. */
        
        LBT_REATTEMPT_ALG_ERROR         = 0x0005,   /**< This outcoming indication is sent when module exits from LBT reattempt.
                                                    Examples:
                                                    ♦ bit 4 of register 501 is set to 0: a new serial frame is sent during the algorithm;
                                                    ♦ bit 4 of register 501 is set to 1: a new serial frame is sent before the indication 
                                                    0x0004 has been received. */
        
        LBT_STANDBY                     = 0x0010,   /**< This outcoming indication is sent just before the module goes in standby mode. 
                                                    This indication is not sent during the LBT reattempt algorithm and during FAC. */
        
        LBT_FAC_FRAME_SENT              = 0x0020,   /**< This outcoming indication is sent just after the frame (a valid frame has been 
                                                    previously stored in the meter) is sent to RF. */
        
        LBT_FAC_ACC_NR_SENT             = 0x0021,   /**< This outcoming indication is sent just after the automatic ACC-NR (there is no 
                                                    valid frame stored in the meter) is sent to RF. */
        
        LBT_FAC_FRAME_STORED            = 0x0022,   /**< This outcoming indication is sent just after a valid frame is stored in the meter. */
        
        LBT_FAC_NO_FRAME_RECEIVED       = 0x0023,   /**< This outcoming indication is sent just after tROmax if no frame has been received from other. */
        
        LBT_FAC_TIMEOUT                 = 0x0024,   /**< This outcoming indication is sent when the FAC timeout is reached */
        
        LBT_FAC_END                     = 0x0025,   /**< This outcoming indication is sent when a SND-NKE frame has been received. */
        
        LBT_FAC_ERROR                   = 0x0026    /**< This outcoming indication is sent when module exits from FAC because of an error. */
} indication_type_t;

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
 * @brief <h3> HW Layer Initialization </h3>
 *
 * @par
 *  Prepares library for usage and sets needed values to default.
 *
 * @note
 *  This function must be called first. All setters and getters are implemented, but to get
 * from the Mbus, user must use interrupt with delimiter of 13 AKA <CR> for data parsing.
 *
 * Example :
 * @code
 *
 * @endcode
 */
void mbus_init( void );

/**
* @brief <h3> MBus RX ISR </h3>
*
* @par
*  Receiving Interrupt Sub-Routine ( ISR ) for M-Bus
*
*/
void mbus_rx_isr( char rx_input );


/**
* @brief <h3> MBus AT Init </h3>
*
* @par
*  Sets communication mode to "AT" mode for configuration
*
* @param[out] status_t    -   OK_STATUS or ERROR
*/
status_t mbus_at_init( void );                                                                /**< AT Command Functions */

/**
* @brief <h3> MBus OP Init </h3>
*
* @par
*  Sets communication mode to "OP" mode for operation
*
* @param[out] status_t    -   OK_STATUS or ERROR
*/
status_t mbus_op_init( void );

/**
* @brief <h3> MBus Get Firmware Bootloader Version </h3>
*
* @par
*  Gets the Firmware Bootloader Version of this specific module
*
* @param[in] version    - Buffer for version number to be placed into.
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_firmware_bootloader_vers( uint8_t *version );

/**
* @brief <h3> MBus Reset Parameters </h3>
*
* @par
*  Resets all parameters on module to default settings.
*
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_reset_params( void );

/**
* @brief <h3> MBus Reset Meters List </h3>
*
* @par
*  Resets list of available meters
*
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_reset_meters_list( void );

/**
* @brief <h3> MBus Run Bootloader </h3>
*
* @par
*  Runs the bootloader( used for installing new Telit firmware )
*
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_run_bootloader( void );

/**
* @brief <h3> MBus Set Date / Time </h3>
*
* @par
*  Sets the date / time.
*
* @param[in] date       - date_time_t struct w/ time to set.
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_date_time( date_time_t *date );

/**
* @brief <h3> MBus Get Date / Time </h3>
*
* @par
*  Gets the Date / Time from the module.
*
* @param[in] date       - date_time_t struct to place date into
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_date_time( date_time_t *date );

/**
* @brief <h3> MBus Set Con </h3>
*
* @par
*  Continuous modulated carrier, simulating transmission of ‘01’ data (or
* ‘0111’ data if 4GFSK modulation is used in Mode N).
*
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_cont_modulated_carrier( void );

/**
* @brief <h3> MBus Set Pure Carrier Transmission </h3>
*
* @par
*  Pure Carrier Transmission at center frequency.
*
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_pure_carrier_trans( void );

/**
* @brief <h3> MBus Set Continuous Modulated Carrier Random </h3>
*
* @par
*  Continuous modulated carrier, simulating transmission of ‘01110010’
* data if 4GFSK modulation is used in Mode N. Other modulations
* simulate transmission of ‘01’ data.
*
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_cont_modulated_carrier_random( void );

/**
* @brief <h3> MBus Send Frame </h3>
*
* @par
*  Sends a Frame over M-Bus with pre-selected format.
*
* @param[in] transmit_frame     - transmit_frame_t struct w/ frame details
* @param[in] data_len           - Length of data_field in transmit_frame
* @param[out] status_t          - OK_STATUS or ERROR
*
*/
status_t mbus_send_frame( transmit_frame_t *transmit_frame, uint16_t data_len );

/**
* @brief <h3> MBus Receive Frame </h3>
*
* @par
*  Receives a frame over M-Bus when in OP mode (operating)
*
* @param[in] receive_frame      - receive_frame_t to hold received data.
* @param[out] status_t          - OK_STATUS or ERROR
*
*/
status_t mbus_receive_frame( receive_frame_t *receive_frame );

/**
* @brief <h3> MBus Add / Edit Meter</h3>
*
* @par
*  Adds a new meter or edits an existing one.
*
* @param[in] options            - date_time_t struct to place date into
* @param[in] meter_address      - Address of existing or new meter to edit / add.
* @param[in] encrypt_key        - Key for DES or AES encryption. DES = 8 bytes, AES = 16 bytes.
* @param[in] enc_mode           - encryption_type_t to tell what type of encryption, or no encryption.
* @param[in] manufac_id         - Manufacture ID if desired, ( send NULL if not wanted )
* @param[out] status_t          - OK_STATUS or ERROR
*
*/
status_t mbus_add_edit_meter( meter_options_t options, uint8_t *meter_address, uint8_t *encrypt_key,
                              encryption_type_t enc_mode, uint8_t *manufac_id );

/**
* @brief <h3> MBus Remove Meter </h3>
*
* @par
*  Removes a meter from the registered meters list on the module.
*
* @param[in] meter_address      - Address of meter to remove from meters list.
* @param[out] status_t          - OK_STATUS or ERROR
*
*/
status_t mbus_remove_meter( uint8_t *meter_address );

/**
* @brief <h3> MBus Get Serial Number </h3>
*
* @par
*  Gets the serial number of this specific module.
*
* @param[in] serial_num -
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_serial_number( uint8_t *serial_num );                                        /**< Register Reading Functions */

/**
* @brief <h3> MBus Get MBus Mode </h3>
*
* @par
*  Returns the current mode of MBus
*
* @param[in] mode       - Current mode of MBUS
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_mbus_mode( uint8_t *mode );

/**
* @brief <h3> MBus Get Serial RX Format </h3>
*
* @par
*  Gets the current format for receiving frames
*
* @param[in] format     - Current format of receiving
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_serial_rx_format( uint8_t *format );

/**
* @brief <h3> MBus Get Serial TX Format </h3>
*
* @par
*  Gets the current format for transmitting frames
* @note
*  Always set format to atleast LENGTH_TX, and remember that if another
* format is added on top of that, you must add it to your transmit_frame
*
* @param[in] format     - Current format of transmitting
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_serial_tx_format( uint8_t *format );

/**
* @brief <h3> MBus Get TX / RX Pins </h3>
*
* @par
*  Gets the Current TX and RX Pins
*
* @param[in] pins       - 0:J1, 1:J3, 2:J4, 3:J5 .... 7:J9
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_tx_rx_pins( uint8_t *pins );

/**
* @brief <h3> MBus Get Estimated Frequency Offset </h3>
*
* @par
*  Checks if indication of estimated frequency offset when a frame is
* received from radio is enabled or not.
*
* @param[in] offset     - 1:enabled, 0:disabled
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_estim_freq_offset( uint8_t *offset );

/**
* @brief <h3> MBus Get C Field </h3>
*
* @par
*  Gets C-Field Value when not activated on serial format
*
* @param[in] field      - Default:68, From 0 - 255
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_c_field( uint8_t *field );

/**
* @brief <h3> MBus Get M Field Byte 0 </h3>
*
* @par
*  Gets M-Field Byte 0 Value when not activated on serial format
*
* @param[in] field      - Default:174, From 0 - 255
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_m_field_0( uint8_t *field );

/**
* @brief <h3> MBus Get M Field Byte 1 </h3>
*
* @par
*  Gets M-Field Byte 1 Value when not activated on serial format
*
* @param[in] field      - Default:12, From 0 - 255
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_m_field_1( uint8_t *field );

/**
* @brief <h3> MBus Get A Field Byte 0 </h3>
*
* @par
*  Gets A-Field Byte 0 Value when not activated on serial format
*
* @param[in] field      - Default:120, From 0 - 255
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_a_field_0( uint8_t *field );

/**
* @brief <h3> MBus Get A Field Byte 1 </h3>
*
* @par
*  Gets A-Field Byte 1 Value when not activated on serial format
*
* @param[in] field      - Default:86, From 0 - 255
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_a_field_1( uint8_t *field );

/**
* @brief <h3> MBus Get A Field Byte 2 </h3>
*
* @par
*  Gets A-Field Byte 2 Value when not activated on serial format
*
* @param[in] field      - Default:52, From 0 - 255
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_a_field_2( uint8_t *field );

/**
* @brief <h3> MBus Get A Field Byte 3 </h3>
*
* @par
*  Gets A-Field Byte 3 Value when not activated on serial format
*
* @param[in] field      - Default:18, From 0 - 255
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_a_field_3( uint8_t *field );

/**
* @brief <h3> MBus Get A Field Byte 4 </h3>
*
* @par
*  Gets A-Field Byte 4 Value when not activated on serial format
*
* @param[in] field      - Default:1, From 0 - 255
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_a_field_4( uint8_t *field );

/**
* @brief <h3> MBus Get A Field Byte 5 </h3>
*
* @par
*  Gets A-Field Byte 5 Value when not activated on serial format
*
* @param[in] field      - Default:7, From 0 - 255
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_a_field_5( uint8_t *field );

/**
* @brief <h3> MBus Get CI Field </h3>
*
* @par
*  Gets CI-Field Value when not activated on serial format
*
* @param[in] field      - Default:120, From 0 - 255
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_ci_field( uint8_t *field );

/**
* @brief <h3> MBus Get Radio Channel </h3>
*
* @par
*  Gets the Current Radio Channel
* @note
*  0: (default) 1a 4800bps, 1: 1b 4800 bps,
*  2: 2a 2400 bps, 3: 2b 2400 bps, 4: 3a 4800 bps,
*  5: 3b 4800 bps, 6: 0 19200 bps, 7: 2a 4800 bps,
*  8: 2b 4800 bps
*
* @param[in] channel    - Current channel BPS
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_radio_channel( uint8_t *channel );

/**
* @brief <h3> MBus Get Preamble Length </h3>
*
* @par
*  Gets current preamble length
*
* @param[in] length     - Default:0(short) 1: long
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_preamble_length( uint8_t *length );

/**
* @brief <h3> MBus Get Radio Output Power </h3>
*
* @par
*  Gets the current Radio Output Power
* @note
*  0: 21dBm, 1: 24dBm, 2: 27dBm, 3: 30dBm, 4: 18dBm
*  5: 15dBm, 6: 12dBm
*
* @param[in] power      - Default: 2( +27dBm )
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_radio_output_power( uint8_t *power );

/**
* @brief <h3> MBus Get Channel Plan </h3>
*
* @par
*  Gets the current channel plan
*
* @note
* • Bit 0: 1a @ 4800 bps
* • Bit 1: 1b @ 4800 bps
* • Bit 2: 2a @ 2400 bps
* • Bit 3: 2b @ 2400 bps
* • Bit 4: 3a @ 4800 bps
* • Bit 5: 3b @ 4800 bps
* • Bit 6: 2a @ 4800 bps
* • Bit 7: 2b @ 4800 bps
*
* @param[in] plan       - Default: 0, Bit mask containing list of channels used
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_channel_plan( uint8_t *plan );

/**
* @brief <h3> MBus Get Current Channel </h3>
*
* @par
*  Gets the current channel ( only useful when multichannel mode is enabled )
* @note
* • ‘0’: 1a @ 4800 bps
* • ‘1’: 1b @ 4800 bps
* • ‘2’: 2a @ 2400 bps
* • ‘3’: 2b @ 2400 bps
* • ‘4’: 3a @ 4800 bps
* • ‘5’: 3b @ 4800 bps
* • ‘6’: 0 @ 19200 bps
* • ‘7’: 2a @ 4800 bps
* • ‘8’: 2b @ 4800 bps
*
* @param[in] channel    - Current Channel
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_current_channel( uint8_t *channel );

/**
* @brief <h3> MBus Get Radio Output DBM </h3>
*
* @par
*  Gets the Output Power of the RF module expressed in dBm
* @note
*  Valid values 12, 15, 18, 21, 24, 27, 30
*
* @param[in] dbm        - Current dBm value of radio
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_radio_output_dbm( uint8_t *dbm );

/**
* @brief <h3> MBus Get Frequency Offset </h3>
*
* @par
*  Gets the current
* @note
*  Valid values 12, 15, 18, 21, 24, 27, 30
*
* @param[in] offset     - Current Offset compared to nominal frequency expressed in ppm. Default: 0
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_freq_offset( int8_t *offset );

/**
* @brief <h3> MBus Get Preamble Word </h3>
*
* @par
*  Gets the Current Preamble Word ( Mode N Only )
*
* @param[in] word       - Default: 0x55, 1: 0xAA
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_preamble_word( uint8_t *word );

/**
* @brief <h3> MBus Get Serial Speed </h3>
*
* @par
*  Gets the current speed on the serial link.
* @note
* • ‘1’: 1200 bits/s
* • ‘2’: 2400 bits/s
* • ‘3’: 4800 bits/s
* • ‘4’: 9600 bits/s
* • ‘5’: 19200 bits/s (default)
* • ‘6’: 38400 bits/s
* • ‘7’: 57600 bits/s
* • ‘8’: 115200 bits/s
*
* @param[in] speed      - Baud rate of serial link
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_serial_speed( uint8_t *speed );

/**
* @brief <h3> MBus Get Serial Timeout </h3>
*
* @par
*  Gets the current serial time-out time when length field is not activated
* @note
*  Default: 5
* Min. timeout    Serial speed
* 17 ms           1200 bits/s
* 9 ms            2400 bits/s
* 5 ms            4800 bits/s
* 3 ms            9600 bits/s
* 2 ms            ≥ 19200 bits/s
*
* @param[in] timeout    - Time of timeout in ms
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_serial_timeout( uint8_t *timeout );

/**
* @brief <h3> MBus Get CTS Management </h3>
*
* @par
*  Checks if CTS Management is enabled or disabled
*
* @param[in] cts        - Default: 0(diabled), 1: enabled
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_cts_management( uint8_t *cts );

/**
* @brief <h3> MBus Get CTS Timeout </h3>
*
* @par
*  Gets the current Timeout for CTS in seconds
*
* @param[in] timeout    - Timeout for CTS when CTS is enabled, in seconds
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_cts_timeout( uint8_t *timeout );

//status_t mbus_get_wakeup_options( void );             /**< Wakeup pin not connected :( */

/**
* @brief <h3> MBus Get Wakeup Timeout </h3>
*
* @par
*  Gets the wakeup timeout( duration between end of an event and return to stand-by )
*
* @param[in] timeout    - Time in ms Default: 0
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_wakeup_timeout( uint8_t *timeout );

/**
* @brief <h3> MBus Get Sleep Time </h3>
*
* @par
*  Gets sleep time in seconds between 2 wake-up events( this module has no wakeup pin connected )
*
* @param[in] time       - Default: 1, time in seconds 9 = 500 ms
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_sleep_time( uint8_t *time );

/**
* @brief <h3> MBus Get RX Filter </h3>
*
* @par
*  Gets the bitmask indicating whether received radio frames are filtered
*
* @note
* • Bit 0: enables Rx filter
* • Bit 1: enables multicast when Rx filter is enabled
* • Bit 2: enables broadcast when Rx filter is enabled
* • Bit 3-7: reserved
*
* @param[in] filter     - Default: 0, Filter bit-mask
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_rx_filter( uint8_t *filter );

/**
* @brief <h3> MBus Get TX Options </h3>
*
* @par
*  Gets Transmitting Options
*
* @note
* • Bit 0: reserved
* • Bit 1: enables Listen Before Talk
* • Bit 2: enables frame format B (only for Modes C and N)
* • Bit 3: enables automatic frame transmission
* • Bit 4: enables synchronized frame transmission
* • Bit 5: enables multi-frame operation
* • Bit 6: enables serial acknowledge
* • Bit 7: reserved
*
* @param[in] options    - Bitmask of transmitting options Default: 0
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_tx_options( uint8_t *options );

/**
* @brief <h3> MBus Get Manufacturer Address </h3>
*
* @par
*  Gets the Manufacturer ID for Registered Meter
*
* @param[in] address    - ID of Manufacturer, ( 2 bytes )
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_manufac_address( uint8_t *address );

/**
* @brief <h3> MBus Get Meter Address </h3>
*
* @par
*  Gets the Meter Address of a registered Meter
*
* @param[in] address    - Address of registered meter, ( 6 bytes )
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_meter_address( uint8_t *address );

/**
* @brief <h3> MBus Get Meter Key </h3>
*
* @par
*  Gets the Meter Encryption Key of a registered meter
*
* @param[in] key        - Key for encryption, AES: 16 Bytes, DES: 8
* @param[in] type       - Type of Encryption to use
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_meter_key( uint8_t *key, encryption_type_t type );

/**
* @brief <h3> MBus Get Indications </h3>
*
* @par
*  Checks if Indications are enabled or disabled
*
* @param[in] indications        - Default: 0 (disabled) 1: enabled
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_indications( uint8_t *indications );

/**
* @brief <h3> MBus Get LBT Threshold </h3>
*
* @par
*  Gets the LBT Threshold in dBm
*
* @param[in] threshold  - Default: 99 ( -99dbm ),Values:50(-50dBm) to 110(-110dBm)
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_lbt_threshold( uint8_t *threshold );

/**
* @brief <h3> MBus Get LBT Advanced Options </h3>
*
* @par
*  Gets the Bitmask of current LBT Advanced Options
*
* @note
* • Bit 0: enables ALOHA LBT
* • Bit 1: enables AFA LBT
* • Bit 2: enables override
* • Bit 3: enables LBT reattempt
* • Bit 4: enables different frames between an LBT
*   reattempt and the next one
* • Bit 5-7: reserved
*
* @param[in] opt        - LBT Advanced Options bitmask, Default: 0
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_lbt_advanced_opt( uint8_t *opt );

/**
* @brief <h3> MBus Get Single Channel LBT BO Max </h3>
*
* @par
*  Gets the current max value of the LBT Backoff Count that is allowed for ALOHA LBT operation.
*
* @param[in] max        - Values from 3 to 8, Default: 5
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_single_channel_lbt_bo_max( uint8_t *max );

/**
* @brief <h3> MBus Get Single Channel LBT BO Flat </h3>
*
* @par
*  Gets the current value to keep the LBT Backoff Exponential Flat for ALOHA LBT operation
*
* @param[in] flat       - Values from 1 to 8, Default: 3
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_single_channel_lbt_bo_flat( uint8_t *flat );

/**
* @brief <h3> MBus Get Single Channel LBT Delay </h3>
*
* @par
*  Gets the current maximum amount of total time allowed for ALOHA LBT operation
*
* @param[in] delay      - Delay in ms, Default:750
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_single_channel_lbt_delay( uint16_t *delay );

/**
* @brief <h3> MBus Get Single Channel LBT BO Period </h3>
*
* @par
*  Gets the current multiplier period of time for the backoff calculation for ALOHA LBT operation
*
* @param[in] period     - Period in MS, Default: 20
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_single_channel_lbt_bo_period( uint16_t *period );

/**
* @brief <h3> MBus Get Multi Channel LBT BO Max </h3>
*
* @par
*  Gets the current maximum value of the LBT backoff count that is allowed, the number
* of total available channels to use for AFA LBT operation
*
* @param[in] max        - Default: 6, Values 1 to 6
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_multi_channel_lbt_bo_max( uint8_t *max );

/**
* @brief <h3> MBus Get Multicast Address </h3>
*
* @par
*  Gets the current multicast address:manufacturer ID
*
* @note
*  First 2 bytes: Manufacturer ID, Last 6 bytes: Multicast Address
*
* @param[in] address    - Address and Manufacturer ID of multicast address( 8 bytes total )
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_multicast_address( uint8_t *address );

/**
* @brief <h3> MBus Get Single Channel LBT RA Max </h3>
*
* @par
*  Gets the current maximum number of single channel re-attempts
*
*
* @param[in] max        - Values 3 to 10, Default:3 Max number of single channel re-attempts 
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_single_channel_lbt_ra_max( uint8_t *max );

/**
* @brief <h3> MBus Get Single Channel LBT Ra Flat </h3>
*
* @par
*  Gets the current value to keep the LBT backoff exponential flat for single channel reattempt operation
*
* @param[in] flat       - Values from 1 to 10, Default: 10, Value to keep LBT backoff exponential flat
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_single_channel_lbt_ra_flat( uint8_t *flat );

/**
* @brief <h3> MBus Get Single Channel LBT RA Period </h3>
*
* @par
*  Gets the current multiplier period of time in 100s of ms for the backoff caluclation for single channel reattempt operation
*
* @param[in] period     - Period in ms, Default 16(1.6 sec) Values from 0 to 255
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_single_channel_lbt_ra_period( uint8_t *period );

/**
* @brief <h3> MBus Get FAC Options </h3>
*
* @par
*  Bitmask containing the Frequent Access Cycle Options
*
* @note
* • Bit 0: enables Frequent Access Cycle
* • Bit 1: enables the fast response delay
* • Bit 2-7: reserved
*
* @param[in] options    - Default: 0, Bitmask for FAC 
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_fac_options( uint8_t *options );

/**
* @brief <h3> MBus Get FAC Fast tROmin </h3>
*
* @par
*  Gets the minimum of the fast response delay for tRO.
*
* @param[in] min        - Default: 100, Values from 0 to 1000 ms
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_fac_fast_tro_min( uint16_t *min );

/**
* @brief <h3> MBus Get FAC Fast tROmax </h3>
*
* @par
*  Gets the current maximum of the fast response delay for tRO
*
* @param[in] max        - Default: 101, Value 0 to 1000 ms
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_fac_fast_tro_max( uint16_t *max );

/**
* @brief <h3> MBus Get FAC Slow tROmin </h3>
*
* @par
*  Gets the minimum of the slow response delay for tRO.
*
* @param[in] min        - Default: 1100, Values from 0 to 4000 ms
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_fac_slow_tro_min( uint16_t *min );

/**
* @brief <h3> MBus Get FAC Slow tROmax </h3>
*
* @par
*  Gets the maximum of the slow response delay for tRO.
*
* @param[in] min        - Default: 1101, Values from 0 to 4000 ms
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_fac_slow_tro_max( uint16_t *max );

/**
* @brief <h3> MBus Get FAC txD </h3>
*
* @par
*  Gets the current transmission delay for FAC.
*
* @param[in] txd        - Default: 5, Values 1 to 15 seconds
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_fac_txd( uint8_t *txd );

/**
* @brief <h3> MBus Get FAC Timeout </h3>
*
* @par
*  Gets current timeout for FAC.
*
* @param[in] timeout    - Timeout for FAC, Default: 30, Values 20 to 255 seconds
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_get_fac_timeout( uint8_t *timeout );

/**
* @brief <h3> MBus Set MBus Mode </h3>
*
* @par
*  Sets the MBus Mode / Role
*
* @param[in] role       - mbus_role_t indicating desired mode
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_mbus_mode( mbus_role_t role );                        /**< Register Writing Functions         */

/**
* @brief <h3> MBus Set Serial RX Format </h3>
*
* @par
*  Sets the Serial Receiving Format
*
* @param[in] format     - serial_rx_format_t indicating desired format
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_serial_rx_format( serial_rx_format_t format );                 /**< User can or multiples of the serial_rx_format_t enum to initiate more than 1 field         */

/**
* @brief <h3> MBus Set Serial TX Format </h3>
*
* @par
*  Sets the Serial Transmitting Format
*
* @note
*  When transmitting, always use length field ( LENGTH_RX ), 
* and if any are also included, remember to use them as well.
*
* @param[in] format     - serial_tx_format_t indicating desired format
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_serial_tx_format( serial_tx_format_t format );                /**< User can or multiples of the serial_tx_format_t enum to initiate more than 1 field         */

/**
* @brief <h3> MBus Set TX RX Pins </h3>
*
* @par
*  Sets the current RX / TX Pins
*
* @param[in] pins       - 0:J1, 1:J3, 2:J4, 3:J5 .... 7:J9
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_tx_rx_pins( uint8_t pins );

/**
* @brief <h3> MBus Set Estimated Frequency Offset </h3>
*
* @par
*  Sets the Estimated Frequency Offset indication to enabled or disabled
*
* @param[in] offset     - Default: 0( disabled), 1: enabled
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_estim_freq_offset( uint8_t offset );

/**
* @brief <h3> MBus Set C Field </h3>
*
* @par
*  Sets the C-Field Value when not activated on serial format
*
* @param[in] c_field_val        - Desired C field value Default:68, Values 0 to 255
* @param[out] status_t          - OK_STATUS or ERROR
*
*/
status_t mbus_set_c_field( uint8_t c_field_val );

/**
* @brief <h3> MBus Set M Field Byte 0 </h3>
*
* @par
*  Sets the M-Field Byte 0 Value when not activated on serial format
*
* @param[in] m_field_val        - Desired M field value Default:174, Values 0 to 255
* @param[out] status_t          - OK_STATUS or ERROR
*
*/
status_t mbus_set_m_field_0( uint8_t m_field_val );

/**
* @brief <h3> MBus Set M Field Byte 1 </h3>
*
* @par
*  Sets the M-Field Byte 1 Value when not activated on serial format
*
* @param[in] m_field_val        - Desired M field value Default:12, Values 0 to 255
* @param[out] status_t          - OK_STATUS or ERROR
*
*/
status_t mbus_set_m_field_1( uint8_t m_field_val );

/**
* @brief <h3> MBus Set A Field Byte 0 </h3>
*
* @par
*  Sets the A-Field Byte 0 Value when not activated on serial format
*
* @param[in] a_field_val        - Desired A field value Default:120, Values 0 to 255
* @param[out] status_t          - OK_STATUS or ERROR
*
*/
status_t mbus_set_a_field_0( uint8_t a_field_val );

/**
* @brief <h3> MBus Set A Field Byte 1 </h3>
*
* @par
*  Sets the A-Field Byte 1 Value when not activated on serial format
*
* @param[in] a_field_val        - Desired A field value Default:86, Values 0 to 255
* @param[out] status_t          - OK_STATUS or ERROR
*
*/
status_t mbus_set_a_field_1( uint8_t a_field_val );

/**
* @brief <h3> MBus Set A Field Byte 2 </h3>
*
* @par
*  Sets the A-Field Byte 2 Value when not activated on serial format
*
* @param[in] a_field_val        - Desired A field value Default:52, Values 0 to 255
* @param[out] status_t          - OK_STATUS or ERROR
*
*/
status_t mbus_set_a_field_2( uint8_t a_field_val );

/**
* @brief <h3> MBus Set A Field Byte 3 </h3>
*
* @par
*  Sets the A-Field Byte 3 Value when not activated on serial format
*
* @param[in] a_field_val        - Desired A field value Default:18, Values 0 to 255
* @param[out] status_t          - OK_STATUS or ERROR
*
*/
status_t mbus_set_a_field_3( uint8_t a_field_val );

/**
* @brief <h3> MBus Set A Field Byte 4 </h3>
*
* @par
*  Sets the A-Field Byte 4 Value when not activated on serial format
*
* @param[in] a_field_val        - Desired A field value Default:1, Values 0 to 255
* @param[out] status_t          - OK_STATUS or ERROR
*
*/
status_t mbus_set_a_field_4( uint8_t a_field_val );

/**
* @brief <h3> MBus Set A Field Byte 5 </h3>
*
* @par
*  Sets the A-Field Byte 5 Value when not activated on serial format
*
* @param[in] a_field_val        - Desired A field value Default:7, Values 0 to 255
* @param[out] status_t          - OK_STATUS or ERROR
*
*/
status_t mbus_set_a_field_5( uint8_t a_field_val );

/**
* @brief <h3> MBus Set CI Field </h3>
*
* @par
*  Sets the CI-Field Value when not activated on serial format
*
* @param[in] ci_field_val       - Desired CI field value Default:120, Values 0 to 255
* @param[out] status_t          - OK_STATUS or ERROR
*
*/
status_t mbus_set_ci_field( uint8_t ci_field_val );

/**
* @brief <h3> MBus Set Radio Channel </h3>
*
* @par
*  Sets the desired Radio Channel( for R2 and N Modes only )
*
* @param[in] channel            - channel_t indicating which channel to use
* @param[out] status_t          - OK_STATUS or ERROR
*
*/
status_t mbus_set_radio_channel( channel_t channel );

/**
* @brief <h3> MBus Set Preamble Length </h3>
*
* @par
*  Sets the Preamble Length( short or long )
*
* @param[in] length             - preamble_length_t indicating length of preamble
* @param[out] status_t          - OK_STATUS or ERROR
*
*/
status_t mbus_set_preamble_length( preamble_length_t length );

/**
* @brief <h3> MBus Set Radio Output Power </h3>
*
* @par
*  Sets the desired Radio Output Power
*
* @param[in] radio_pwr  - radio_output_pwr_t indicating desired radio output power
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_radio_output_power( radio_output_pwr_t radio_pwr );

/**
* @brief <h3> MBus Set Channel Plan </h3>
*
* @par
*  Sets the Channel Plan 
*
* @param[in] channel            - channel_t indicating channel plan bitmask
* @param[out] status_t          - OK_STATUS or ERROR
*
*/
status_t mbus_set_channel_plan( channel_t channel );

/**
* @brief <h3> MBus Set Radio Output dBm </h3>
*
* @par
*  Sets the Radio output in dBm
*
* @param[in] output_pwr         - radio_output_pwr_t idicating radio output power in dBm
* @param[out] status_t          - OK_STATUS or ERROR
*
*/
status_t mbus_set_radio_output_dbm( radio_output_pwr_t output_pwr );

/**
* @brief <h3> MBus Set Frequency Offset </h3>
*
* @par
*  Sets the Frequency Offset in ppm (-128 to 127 )
*
* @param[in] offset     - offset compared to the nominal frequency in ppm, Default:0
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_freq_offset( int8_t offset );

/**
* @brief <h3> MBus Set Preamble Word </h3>
*
* @par
*  Sets the Preamble Word 0: 0x55, 1: 0xAA
*
* @param[in] pre_word   - preamble_word_t indicating preamble word
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_preamble_word( preamble_word_t pre_word );

/**
* @brief <h3> MBus Set Serial Speed </h3>
*
* @par
*  Sets the Serial Baud Rate Speed
*
* @param[in] baud       - serial_baud_t indicating baud rate
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_serial_speed( serial_baud_t baud );

/**
* @brief <h3> MBus Set Serial Timeout </h3>
*
* @par
*  Sets the Serial timeout on the serial link when length field is not activated
*  Default: 5, Values 2 to 100 ms
*
* @param[in] ms         - timeout in ms
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_serial_timeout( uint8_t ms );

/**
* @brief <h3> MBus Set CTS Management </h3>
*
* @par
*  Sets the Preamble Length( short or long )
*
* @param[in] length             - preamble_length_t indicating length of preamble
* @param[out] status_t          - OK_STATUS or ERROR
*
*/
status_t mbus_set_cts_management( bool enable );

/**
* @brief <h3> MBus Set CTS Timeout </h3>
*
* @par
*  Sets the value of the time-out in seconds when CTS management is enabled.
*
* @param[in] seconds    - Default: 5, Values 0 to 20 seconds
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_cts_timeout( uint8_t seconds );

//status_t mbus_set_wakeup_options( wakeup_opt_t option );                /**< Wakeup pin not connected :( */

/**
* @brief <h3> MBus Set Wakeup Timeout </h3>
*
* @par
*  (No wakeup pin connected), Defines duration between the end of an event and the return to standy.
*
* @param[in] ms         - Default: 0, Values 0 to 255 ms
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_wakeup_timeout( uint8_t ms );

/**
* @brief <h3> MBus Set Sleep Time </h3>
*
* @par
*  Sets sleep time between 2 wake-up events when wake-up time option is activated.
*
* @param[in] ms         - Default: 1, Values 0 to 255 ms, 0 = 500 ms
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_sleep_time( uint8_t ms );

/**
* @brief <h3> MBus Set RX Filter </h3>
*
* @par
*  Sets the receiving filter using a bitmask
*
* @param[in] filter     - rx_filter_t indicating bitmask for receiving filter Default: 0
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_rx_filter( rx_filter_t filter );

/**
* @brief <h3> MBus Set TX Options </h3>
*
* @par
*  Sets the transmitting filter using a bitmask
*
* @param[in] option     - tx_option_t indicating bitmask for transmitting options Default: 0
* @param[out] status_t          - OK_STATUS or ERROR
*
*/
status_t mbus_set_tx_options( tx_option_t option );

/**
* @brief <h3> MBus Set Registered Meter Options </h3>
*
* @par
*  Sets options for when Adding / Editing / Removing registered meters
*
* @param[in] option     - meter_options_t indicating options bitmask for registered meters
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_registered_meter_options( meter_options_t option );

/**
* @brief <h3> MBus Set Manufacturer Address </h3>
*
* @par
*  Sets the Manufacturer address, usually used for adding/editing/removing registered meters.
*
* @param[in] address    - 2 byte Manufacturer ID
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_manufac_address( uint8_t *address );

/**
* @brief <h3> MBus Set Meter Address </h3>
*
* @par
*  Sets the Meter address, usually used for adding/editing/removing registered meters.
*
* @param[in] address    - 6 byte Meter Address
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_meter_address( uint8_t *address );

/**
* @brief <h3> MBus Set Meter Key </h3>
*
* @par
*  Sets the Key for AES / DES encryption when adding registered meters
*
* @param[in] key        - 8 or 16 byte ( depending on type of encryption ) key
* @param[in] type       - Type of encryption (AES or DES)
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_meter_key( uint8_t *key, encryption_type_t type );

/**
* @brief <h3> MBus Set Indications </h3>
*
* @par
*  Sets Indications to enabled or disabled
*
* @param[in] enable     - Enable or Disable Indications
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_indications( bool enable );

/**
* @brief <h3> MBus Set LBT Threshold </h3>
*
* @par
*  Sets the LBT Threshold in dBm
*
* @param[in] threshold  - Values 50(-50dBm) to 110(-110dBm) Default: 99(-99dBm)
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_lbt_threshold( uint8_t threshold );

/**
* @brief <h3> MBus Set LBT Advanced Options </h3>
*
* @par
*  Sets the bitmask containing LBT Advanced options for ALOHA LBT, AFA LBT, LBT reattempt, override and 
* enables different frames between an LBT reattempt and the next one
*
* @param[in] option     - Bitmask for LBT Advanced options
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_lbt_advanced_opt( lbt_options_t option );

/**
* @brief <h3> MBus Set Single Channel LBT BO Max </h3>
*
* @par
*  Sets the maximum value of the LBT backoff count that is allowed for ALOHA LBT
*
* @param[in] max        - Values 3 to 8, Default: 5
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_single_channel_lbt_bo_max( uint8_t max );

/**
* @brief <h3> MBus Set Single Channel LBT BO Flat </h3>
*
* @par
*  Sets the value to keep the LBT Backoff exponential flat for ALOHA LBT operation
*
* @param[in] flat       - Values 1 to 8, Default: 3
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_single_channel_lbt_bo_flat( uint8_t flat );

/**
* @brief <h3> MBus Set Single Channel LBT Delay </h3>
*
* @par
*  Sets the maxmum amount of total time allowed for ALOHA LBT operation
*
* @param[in] ms         - Values from 250 to 1000 ms, Default: 750 
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_single_channel_lbt_delay( uint16_t ms );

/**
* @brief <h3> MBus Set Single Channel LBT BO Period </h3>
*
* @par
*  Sets the multiplier period of time for the backoff calculation for ALHOA LBT operation
*
* @param[in] ms         - Values 0 to 65535 ms, Default: 20
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_single_channel_lbt_bo_period( uint16_t ms );

/**
* @brief <h3> MBus Set Multi Channel LBT BO Max </h3>
*
* @par
*  Sets the maximum value of the LBT backoff count that is allowed, the number of 
* total available channels to use for AFA LBT operation.
*
* @param[in] max        - Values 1 to 6, Default: 6
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_multi_channel_lbt_bo_max( uint8_t max );

/**
* @brief <h3> MBus Set Multicast Address </h3>
*
* @par
*  Sets the multicast address for adding/editing/removing registered meters
*
* @param[in] address    - 6 byte address
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_multicast_address( uint8_t *address );

/**
* @brief <h3> MBus Set Single Channel LBT RA Max </h3>
*
* @par
*  Sets the maximum number of single channel reattempts
*
* @param[in] max        - Values 3 to 10, Default: 3
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_single_channel_lbt_ra_max( uint8_t max );

/**
* @brief <h3> MBus Set Single Channel LBT RA Flat </h3>
*
* @par
*  Sets the value to keep the LBT backoff exponential flat for single channel reattempt operation
*
* @param[in] flat       - Values from 1 to 10, Default: 3
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_single_channel_lbt_ra_flat( uint8_t flat );

/**
* @brief <h3> MBus Set Single Channel LBT RA Period </h3>
*
* @par
*  Sets the multiplier period of time in 100s of ms for the backoff calculation for single 
* channel reattempt operation
*
* @param[in] seconds    - Values from 0 to 255 seconds, Default: 16( 1.6sec )
* @param[out] status_t          - OK_STATUS or ERROR
*
*/
status_t mbus_set_single_channel_lbt_ra_period( uint8_t seconds );

/**
* @brief <h3> MBus Set FAC Options </h3>
*
* @par
*  Sets the FAC Options for Frequent Access Cycle Options
*
* @param[in] option     - Default: 0, Bitmask for FAC options
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_fac_options( fac_options_t option );

/**
* @brief <h3> MBus Set FAC Fast tROmin </h3>
*
* @par
*  Sets the minimum of the fast response delay for tRO
*
* @param[in] min        - Values 0 to 1000 ms, Default: 100
* @param[out] status_t  - OK_STATUS or ERROR
*/
status_t mbus_set_fac_fast_tro_min( uint16_t min );

/**
* @brief <h3> MBus Set FAC Fast tROmax</h3>
*
* @par
*  Sets the maximum of the fast response delay for tRO
*
* @param[in] max        - Values 0 to 1000 ms, Default: 101
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_fac_fast_tro_max( uint16_t max );

/**
* @brief <h3> MBus Set FAC Slow tROmin </h3>
*
* @par
*  Sets the minimum of the slow response delay for tRO
*
* @param[in] min        - Values from 0 to 4000 ms, Default: 1100
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_fac_slow_tro_min( uint16_t min );

/**
* @brief <h3> MBus Set FAC Slow tROmax </h3>
*
* @par
*  Sets the maximum of the slow response delay for tRO
*
* @param[in] min        - Values from 0 to 4000 ms, Default: 1101
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_fac_slow_tro_max( uint16_t max );

/**
* @brief <h3> MBus Set FAC txD </h3>
*
* @par
*  Sets the transmission delay for FAC
*
* @param[in] trans_delay        - Values 1 to 15 seconds, Default:5
* @param[out] status_t          - OK_STATUS or ERROR
*
*/
status_t mbus_set_fac_txd( uint8_t trans_delay );

/**
* @brief <h3> MBus Set FAC Timeout </h3>
*
* @par
*  Sets the timeout for FAC
*
* @param[in] timeout    - Values from 20 to 255 seconds, Default: 30
* @param[out] status_t  - OK_STATUS or ERROR
*
*/
status_t mbus_set_fac_timeout( uint8_t timeout );

#ifdef __cplusplus
} // extern "C"
#endif

#endif /* MBUS_H */
/*** End of File **************************************************************/
