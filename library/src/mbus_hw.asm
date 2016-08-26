mbus_hw_mbus_read_reg:
;mbus_hw.c,70 :: 		static status_t mbus_read_reg( uint8_t *buffer )
; buffer start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
;mbus_hw.c,72 :: 		mbus_hal_write_text( buffer );                                  /**< Register to Read */
; buffer end address is: 0 (R0)
BL	_mbus_hal_write_text+0
;mbus_hw.c,73 :: 		mbus_hal_write( creturn );                                      /**< Carriage Return */
MOVW	R1, #lo_addr(mbus_hw_creturn+0)
MOVT	R1, #hi_addr(mbus_hw_creturn+0)
LDRB	R1, [R1, #0]
UXTB	R0, R1
BL	_mbus_hal_write+0
;mbus_hw.c,74 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,75 :: 		}
L_end_mbus_read_reg:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of mbus_hw_mbus_read_reg
mbus_hw_mbus_write_reg:
;mbus_hw.c,77 :: 		static status_t mbus_write_reg( uint8_t *buffer )
; buffer start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
;mbus_hw.c,79 :: 		mbus_hal_write_text( buffer );                                  /**< Register + Data to write to register */
; buffer end address is: 0 (R0)
BL	_mbus_hal_write_text+0
;mbus_hw.c,80 :: 		mbus_hal_write( creturn );                                      /**< Carriage Return */
MOVW	R1, #lo_addr(mbus_hw_creturn+0)
MOVT	R1, #hi_addr(mbus_hw_creturn+0)
LDRB	R1, [R1, #0]
UXTB	R0, R1
BL	_mbus_hal_write+0
;mbus_hw.c,81 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,82 :: 		}
L_end_mbus_write_reg:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of mbus_hw_mbus_write_reg
mbus_hw_mbus_update_tx_format:
;mbus_hw.c,84 :: 		static void mbus_update_tx_format( serial_tx_format_t format )
; format start address is: 0 (R0)
; format end address is: 0 (R0)
; format start address is: 0 (R0)
;mbus_hw.c,86 :: 		if ( format & CI_FIELD_TX )                     /**< Update all formats */
AND	R1, R0, #16
UXTB	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L_mbus_hw_mbus_update_tx_format0
;mbus_hw.c,87 :: 		transmit_frame_format.ci_field = true;
MOVS	R2, #1
MOVW	R1, #lo_addr(mbus_hw_transmit_frame_format+4)
MOVT	R1, #hi_addr(mbus_hw_transmit_frame_format+4)
STRB	R2, [R1, #0]
IT	AL
BAL	L_mbus_hw_mbus_update_tx_format1
L_mbus_hw_mbus_update_tx_format0:
;mbus_hw.c,89 :: 		transmit_frame_format.ci_field = false;
MOVS	R2, #0
MOVW	R1, #lo_addr(mbus_hw_transmit_frame_format+4)
MOVT	R1, #hi_addr(mbus_hw_transmit_frame_format+4)
STRB	R2, [R1, #0]
L_mbus_hw_mbus_update_tx_format1:
;mbus_hw.c,90 :: 		if ( format & A_FIELD_TX )
AND	R1, R0, #8
UXTB	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L_mbus_hw_mbus_update_tx_format2
;mbus_hw.c,91 :: 		transmit_frame_format.a_field = true;
MOVS	R2, #1
MOVW	R1, #lo_addr(mbus_hw_transmit_frame_format+3)
MOVT	R1, #hi_addr(mbus_hw_transmit_frame_format+3)
STRB	R2, [R1, #0]
IT	AL
BAL	L_mbus_hw_mbus_update_tx_format3
L_mbus_hw_mbus_update_tx_format2:
;mbus_hw.c,93 :: 		transmit_frame_format.a_field = false;
MOVS	R2, #0
MOVW	R1, #lo_addr(mbus_hw_transmit_frame_format+3)
MOVT	R1, #hi_addr(mbus_hw_transmit_frame_format+3)
STRB	R2, [R1, #0]
L_mbus_hw_mbus_update_tx_format3:
;mbus_hw.c,94 :: 		if ( format & M_FIELD_TX )
AND	R1, R0, #4
UXTB	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L_mbus_hw_mbus_update_tx_format4
;mbus_hw.c,95 :: 		transmit_frame_format.m_field = true;
MOVS	R2, #1
MOVW	R1, #lo_addr(mbus_hw_transmit_frame_format+2)
MOVT	R1, #hi_addr(mbus_hw_transmit_frame_format+2)
STRB	R2, [R1, #0]
IT	AL
BAL	L_mbus_hw_mbus_update_tx_format5
L_mbus_hw_mbus_update_tx_format4:
;mbus_hw.c,97 :: 		transmit_frame_format.m_field = false;
MOVS	R2, #0
MOVW	R1, #lo_addr(mbus_hw_transmit_frame_format+2)
MOVT	R1, #hi_addr(mbus_hw_transmit_frame_format+2)
STRB	R2, [R1, #0]
L_mbus_hw_mbus_update_tx_format5:
;mbus_hw.c,98 :: 		if ( format & C_FIELD_TX )
AND	R1, R0, #2
UXTB	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L_mbus_hw_mbus_update_tx_format6
;mbus_hw.c,99 :: 		transmit_frame_format.c_field = true;
MOVS	R2, #1
MOVW	R1, #lo_addr(mbus_hw_transmit_frame_format+1)
MOVT	R1, #hi_addr(mbus_hw_transmit_frame_format+1)
STRB	R2, [R1, #0]
IT	AL
BAL	L_mbus_hw_mbus_update_tx_format7
L_mbus_hw_mbus_update_tx_format6:
;mbus_hw.c,101 :: 		transmit_frame_format.c_field = false;
MOVS	R2, #0
MOVW	R1, #lo_addr(mbus_hw_transmit_frame_format+1)
MOVT	R1, #hi_addr(mbus_hw_transmit_frame_format+1)
STRB	R2, [R1, #0]
L_mbus_hw_mbus_update_tx_format7:
;mbus_hw.c,102 :: 		if ( format & LENGTH_TX )
AND	R1, R0, #1
UXTB	R1, R1
; format end address is: 0 (R0)
CMP	R1, #0
IT	EQ
BEQ	L_mbus_hw_mbus_update_tx_format8
;mbus_hw.c,103 :: 		transmit_frame_format.length_field = true;
MOVS	R2, #1
MOVW	R1, #lo_addr(mbus_hw_transmit_frame_format+0)
MOVT	R1, #hi_addr(mbus_hw_transmit_frame_format+0)
STRB	R2, [R1, #0]
IT	AL
BAL	L_mbus_hw_mbus_update_tx_format9
L_mbus_hw_mbus_update_tx_format8:
;mbus_hw.c,105 :: 		transmit_frame_format.length_field = false;
MOVS	R2, #0
MOVW	R1, #lo_addr(mbus_hw_transmit_frame_format+0)
MOVT	R1, #hi_addr(mbus_hw_transmit_frame_format+0)
STRB	R2, [R1, #0]
L_mbus_hw_mbus_update_tx_format9:
;mbus_hw.c,106 :: 		}
L_end_mbus_update_tx_format:
BX	LR
; end of mbus_hw_mbus_update_tx_format
mbus_hw_mbus_update_rx_format:
;mbus_hw.c,108 :: 		static void mbus_update_rx_format( serial_rx_format_t format )
; format start address is: 0 (R0)
; format end address is: 0 (R0)
; format start address is: 0 (R0)
;mbus_hw.c,110 :: 		if ( format & RSSI_RX )                         /**< Update all formats */
AND	R1, R0, #128
UXTB	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L_mbus_hw_mbus_update_rx_format10
;mbus_hw.c,111 :: 		receive_frame_format.rssi_field = true;
MOVS	R2, #1
MOVW	R1, #lo_addr(mbus_hw_receive_frame_format+7)
MOVT	R1, #hi_addr(mbus_hw_receive_frame_format+7)
STRB	R2, [R1, #0]
IT	AL
BAL	L_mbus_hw_mbus_update_rx_format11
L_mbus_hw_mbus_update_rx_format10:
;mbus_hw.c,113 :: 		receive_frame_format.rssi_field = false;
MOVS	R2, #0
MOVW	R1, #lo_addr(mbus_hw_receive_frame_format+7)
MOVT	R1, #hi_addr(mbus_hw_receive_frame_format+7)
STRB	R2, [R1, #0]
L_mbus_hw_mbus_update_rx_format11:
;mbus_hw.c,114 :: 		if ( format & WAKEUP_CHAR_RX )
AND	R1, R0, #64
UXTB	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L_mbus_hw_mbus_update_rx_format12
;mbus_hw.c,115 :: 		receive_frame_format.wake_up_field = true;
MOVS	R2, #1
MOVW	R1, #lo_addr(mbus_hw_receive_frame_format+0)
MOVT	R1, #hi_addr(mbus_hw_receive_frame_format+0)
STRB	R2, [R1, #0]
IT	AL
BAL	L_mbus_hw_mbus_update_rx_format13
L_mbus_hw_mbus_update_rx_format12:
;mbus_hw.c,117 :: 		receive_frame_format.wake_up_field = false;
MOVS	R2, #0
MOVW	R1, #lo_addr(mbus_hw_receive_frame_format+0)
MOVT	R1, #hi_addr(mbus_hw_receive_frame_format+0)
STRB	R2, [R1, #0]
L_mbus_hw_mbus_update_rx_format13:
;mbus_hw.c,118 :: 		if ( format & LQI_RX )
AND	R1, R0, #32
UXTB	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L_mbus_hw_mbus_update_rx_format14
;mbus_hw.c,119 :: 		receive_frame_format.lqi_field = true;
MOVS	R2, #1
MOVW	R1, #lo_addr(mbus_hw_receive_frame_format+6)
MOVT	R1, #hi_addr(mbus_hw_receive_frame_format+6)
STRB	R2, [R1, #0]
IT	AL
BAL	L_mbus_hw_mbus_update_rx_format15
L_mbus_hw_mbus_update_rx_format14:
;mbus_hw.c,121 :: 		receive_frame_format.lqi_field = false;
MOVS	R2, #0
MOVW	R1, #lo_addr(mbus_hw_receive_frame_format+6)
MOVT	R1, #hi_addr(mbus_hw_receive_frame_format+6)
STRB	R2, [R1, #0]
L_mbus_hw_mbus_update_rx_format15:
;mbus_hw.c,122 :: 		if ( format & CI_FIELD_RX )
AND	R1, R0, #16
UXTB	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L_mbus_hw_mbus_update_rx_format16
;mbus_hw.c,123 :: 		receive_frame_format.ci_field = true;
MOVS	R2, #1
MOVW	R1, #lo_addr(mbus_hw_receive_frame_format+5)
MOVT	R1, #hi_addr(mbus_hw_receive_frame_format+5)
STRB	R2, [R1, #0]
IT	AL
BAL	L_mbus_hw_mbus_update_rx_format17
L_mbus_hw_mbus_update_rx_format16:
;mbus_hw.c,125 :: 		receive_frame_format.ci_field = false;
MOVS	R2, #0
MOVW	R1, #lo_addr(mbus_hw_receive_frame_format+5)
MOVT	R1, #hi_addr(mbus_hw_receive_frame_format+5)
STRB	R2, [R1, #0]
L_mbus_hw_mbus_update_rx_format17:
;mbus_hw.c,126 :: 		if ( format & A_FIELD_RX )
AND	R1, R0, #8
UXTB	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L_mbus_hw_mbus_update_rx_format18
;mbus_hw.c,127 :: 		receive_frame_format.a_field = true;
MOVS	R2, #1
MOVW	R1, #lo_addr(mbus_hw_receive_frame_format+4)
MOVT	R1, #hi_addr(mbus_hw_receive_frame_format+4)
STRB	R2, [R1, #0]
IT	AL
BAL	L_mbus_hw_mbus_update_rx_format19
L_mbus_hw_mbus_update_rx_format18:
;mbus_hw.c,129 :: 		receive_frame_format.a_field = false;
MOVS	R2, #0
MOVW	R1, #lo_addr(mbus_hw_receive_frame_format+4)
MOVT	R1, #hi_addr(mbus_hw_receive_frame_format+4)
STRB	R2, [R1, #0]
L_mbus_hw_mbus_update_rx_format19:
;mbus_hw.c,130 :: 		if ( format & M_FIELD_RX )
AND	R1, R0, #4
UXTB	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L_mbus_hw_mbus_update_rx_format20
;mbus_hw.c,131 :: 		receive_frame_format.m_field = true;
MOVS	R2, #1
MOVW	R1, #lo_addr(mbus_hw_receive_frame_format+3)
MOVT	R1, #hi_addr(mbus_hw_receive_frame_format+3)
STRB	R2, [R1, #0]
IT	AL
BAL	L_mbus_hw_mbus_update_rx_format21
L_mbus_hw_mbus_update_rx_format20:
;mbus_hw.c,133 :: 		receive_frame_format.m_field = false;
MOVS	R2, #0
MOVW	R1, #lo_addr(mbus_hw_receive_frame_format+3)
MOVT	R1, #hi_addr(mbus_hw_receive_frame_format+3)
STRB	R2, [R1, #0]
L_mbus_hw_mbus_update_rx_format21:
;mbus_hw.c,134 :: 		if ( format & C_FIELD_RX )
AND	R1, R0, #2
UXTB	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L_mbus_hw_mbus_update_rx_format22
;mbus_hw.c,135 :: 		receive_frame_format.c_field = true;
MOVS	R2, #1
MOVW	R1, #lo_addr(mbus_hw_receive_frame_format+2)
MOVT	R1, #hi_addr(mbus_hw_receive_frame_format+2)
STRB	R2, [R1, #0]
IT	AL
BAL	L_mbus_hw_mbus_update_rx_format23
L_mbus_hw_mbus_update_rx_format22:
;mbus_hw.c,137 :: 		receive_frame_format.c_field = false;
MOVS	R2, #0
MOVW	R1, #lo_addr(mbus_hw_receive_frame_format+2)
MOVT	R1, #hi_addr(mbus_hw_receive_frame_format+2)
STRB	R2, [R1, #0]
L_mbus_hw_mbus_update_rx_format23:
;mbus_hw.c,138 :: 		if ( format & LENGTH_RX )
AND	R1, R0, #1
UXTB	R1, R1
; format end address is: 0 (R0)
CMP	R1, #0
IT	EQ
BEQ	L_mbus_hw_mbus_update_rx_format24
;mbus_hw.c,139 :: 		receive_frame_format.length_field = true;
MOVS	R2, #1
MOVW	R1, #lo_addr(mbus_hw_receive_frame_format+1)
MOVT	R1, #hi_addr(mbus_hw_receive_frame_format+1)
STRB	R2, [R1, #0]
IT	AL
BAL	L_mbus_hw_mbus_update_rx_format25
L_mbus_hw_mbus_update_rx_format24:
;mbus_hw.c,141 :: 		receive_frame_format.length_field = false;
MOVS	R2, #0
MOVW	R1, #lo_addr(mbus_hw_receive_frame_format+1)
MOVT	R1, #hi_addr(mbus_hw_receive_frame_format+1)
STRB	R2, [R1, #0]
L_mbus_hw_mbus_update_rx_format25:
;mbus_hw.c,142 :: 		}
L_end_mbus_update_rx_format:
BX	LR
; end of mbus_hw_mbus_update_rx_format
mbus_hw_mbus_set_formats_false:
;mbus_hw.c,144 :: 		static void mbus_set_formats_false( void )
;mbus_hw.c,146 :: 		receive_frame_format.wake_up_field      = false;
MOVS	R1, #0
MOVW	R0, #lo_addr(mbus_hw_receive_frame_format+0)
MOVT	R0, #hi_addr(mbus_hw_receive_frame_format+0)
STRB	R1, [R0, #0]
;mbus_hw.c,147 :: 		receive_frame_format.length_field       = false;
MOVS	R1, #0
MOVW	R0, #lo_addr(mbus_hw_receive_frame_format+1)
MOVT	R0, #hi_addr(mbus_hw_receive_frame_format+1)
STRB	R1, [R0, #0]
;mbus_hw.c,148 :: 		receive_frame_format.c_field            = false;
MOVS	R1, #0
MOVW	R0, #lo_addr(mbus_hw_receive_frame_format+2)
MOVT	R0, #hi_addr(mbus_hw_receive_frame_format+2)
STRB	R1, [R0, #0]
;mbus_hw.c,149 :: 		receive_frame_format.m_field            = false;
MOVS	R1, #0
MOVW	R0, #lo_addr(mbus_hw_receive_frame_format+3)
MOVT	R0, #hi_addr(mbus_hw_receive_frame_format+3)
STRB	R1, [R0, #0]
;mbus_hw.c,150 :: 		receive_frame_format.a_field            = false;
MOVS	R1, #0
MOVW	R0, #lo_addr(mbus_hw_receive_frame_format+4)
MOVT	R0, #hi_addr(mbus_hw_receive_frame_format+4)
STRB	R1, [R0, #0]
;mbus_hw.c,151 :: 		receive_frame_format.ci_field           = false;
MOVS	R1, #0
MOVW	R0, #lo_addr(mbus_hw_receive_frame_format+5)
MOVT	R0, #hi_addr(mbus_hw_receive_frame_format+5)
STRB	R1, [R0, #0]
;mbus_hw.c,152 :: 		receive_frame_format.lqi_field          = false;
MOVS	R1, #0
MOVW	R0, #lo_addr(mbus_hw_receive_frame_format+6)
MOVT	R0, #hi_addr(mbus_hw_receive_frame_format+6)
STRB	R1, [R0, #0]
;mbus_hw.c,153 :: 		receive_frame_format.rssi_field         = false;
MOVS	R1, #0
MOVW	R0, #lo_addr(mbus_hw_receive_frame_format+7)
MOVT	R0, #hi_addr(mbus_hw_receive_frame_format+7)
STRB	R1, [R0, #0]
;mbus_hw.c,154 :: 		receive_frame_format.freq_offset_field  = false;
MOVS	R1, #0
MOVW	R0, #lo_addr(mbus_hw_receive_frame_format+8)
MOVT	R0, #hi_addr(mbus_hw_receive_frame_format+8)
STRB	R1, [R0, #0]
;mbus_hw.c,155 :: 		transmit_frame_format.length_field      = false;
MOVS	R1, #0
MOVW	R0, #lo_addr(mbus_hw_transmit_frame_format+0)
MOVT	R0, #hi_addr(mbus_hw_transmit_frame_format+0)
STRB	R1, [R0, #0]
;mbus_hw.c,156 :: 		transmit_frame_format.c_field           = false;
MOVS	R1, #0
MOVW	R0, #lo_addr(mbus_hw_transmit_frame_format+1)
MOVT	R0, #hi_addr(mbus_hw_transmit_frame_format+1)
STRB	R1, [R0, #0]
;mbus_hw.c,157 :: 		transmit_frame_format.m_field           = false;
MOVS	R1, #0
MOVW	R0, #lo_addr(mbus_hw_transmit_frame_format+2)
MOVT	R0, #hi_addr(mbus_hw_transmit_frame_format+2)
STRB	R1, [R0, #0]
;mbus_hw.c,158 :: 		transmit_frame_format.a_field           = false;
MOVS	R1, #0
MOVW	R0, #lo_addr(mbus_hw_transmit_frame_format+3)
MOVT	R0, #hi_addr(mbus_hw_transmit_frame_format+3)
STRB	R1, [R0, #0]
;mbus_hw.c,159 :: 		transmit_frame_format.ci_field          = false;
MOVS	R1, #0
MOVW	R0, #lo_addr(mbus_hw_transmit_frame_format+4)
MOVT	R0, #hi_addr(mbus_hw_transmit_frame_format+4)
STRB	R1, [R0, #0]
;mbus_hw.c,160 :: 		}
L_end_mbus_set_formats_false:
BX	LR
; end of mbus_hw_mbus_set_formats_false
mbus_hw_reset_flags_buffers:
;mbus_hw.c,162 :: 		static void reset_flags_buffers( void )
;mbus_hw.c,164 :: 		uint16_t i = 0;
;mbus_hw.c,166 :: 		for ( i = 0; i < RX_BUFFER_SIZE; i++ )
; i start address is: 8 (R2)
MOVS	R2, #0
; i end address is: 8 (R2)
L_mbus_hw_reset_flags_buffers26:
; i start address is: 8 (R2)
CMP	R2, #300
IT	CS
BCS	L_mbus_hw_reset_flags_buffers27
;mbus_hw.c,167 :: 		rx_buffer[i] = 0;
MOVW	R0, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R0, #hi_addr(mbus_hw_rx_buffer+0)
ADDS	R1, R0, R2
MOVS	R0, #0
STRB	R0, [R1, #0]
;mbus_hw.c,166 :: 		for ( i = 0; i < RX_BUFFER_SIZE; i++ )
ADDS	R2, R2, #1
UXTH	R2, R2
;mbus_hw.c,167 :: 		rx_buffer[i] = 0;
; i end address is: 8 (R2)
IT	AL
BAL	L_mbus_hw_reset_flags_buffers26
L_mbus_hw_reset_flags_buffers27:
;mbus_hw.c,169 :: 		rx_buffer_cnt = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(mbus_hw_rx_buffer_cnt+0)
MOVT	R0, #hi_addr(mbus_hw_rx_buffer_cnt+0)
STRH	R1, [R0, #0]
;mbus_hw.c,170 :: 		response_finished = false;
MOVS	R1, #0
MOVW	R0, #lo_addr(mbus_hw_response_finished+0)
MOVT	R0, #hi_addr(mbus_hw_response_finished+0)
STRB	R1, [R0, #0]
;mbus_hw.c,171 :: 		}
L_end_reset_flags_buffers:
BX	LR
; end of mbus_hw_reset_flags_buffers
mbus_hw_set_time_buffer:
;mbus_hw.c,173 :: 		static status_t set_time_buffer( date_time_t *date, uint8_t *temp_buffer )
; temp_buffer start address is: 4 (R1)
; date start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
MOV	R7, R0
MOV	R8, R1
; temp_buffer end address is: 4 (R1)
; date end address is: 0 (R0)
; date start address is: 28 (R7)
; temp_buffer start address is: 32 (R8)
;mbus_hw.c,175 :: 		char tmp[10] = { 0 };
ADD	R11, SP, #4
ADD	R10, R11, #10
MOVW	R12, #lo_addr(?ICSmbus_hw_set_time_buffer_tmp_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_hw_set_time_buffer_tmp_L0+0)
BL	___CC2DW+0
;mbus_hw.c,177 :: 		if ( date->month < 10 && date->month > 0 )          /**< Set Month if Month is less than 13 and greater than 0 */
LDRB	R2, [R7, #0]
CMP	R2, #10
IT	CS
BCS	L_mbus_hw_set_time_buffer513
LDRB	R2, [R7, #0]
CMP	R2, #0
IT	LS
BLS	L_mbus_hw_set_time_buffer512
L_mbus_hw_set_time_buffer511:
;mbus_hw.c,179 :: 		ByteToStr( date->month, tmp );
ADD	R3, SP, #4
STR	R3, [SP, #16]
LDRB	R2, [R7, #0]
MOV	R1, R3
UXTB	R0, R2
BL	_ByteToStr+0
;mbus_hw.c,180 :: 		Ltrim( tmp );
ADD	R2, SP, #4
MOV	R0, R2
BL	_Ltrim+0
;mbus_hw.c,181 :: 		tmp[1] = tmp[0];
ADD	R2, SP, #4
ADDS	R3, R2, #1
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;mbus_hw.c,182 :: 		tmp[0] = '0';
MOVS	R3, #48
LDR	R2, [SP, #16]
STRB	R3, [R2, #0]
;mbus_hw.c,183 :: 		strncat( temp_buffer, tmp, 2 );
MOV	R1, R2
MOVS	R2, #2
SXTH	R2, R2
MOV	R0, R8
BL	_strncat+0
;mbus_hw.c,184 :: 		}
IT	AL
BAL	L_mbus_hw_set_time_buffer32
;mbus_hw.c,177 :: 		if ( date->month < 10 && date->month > 0 )          /**< Set Month if Month is less than 13 and greater than 0 */
L_mbus_hw_set_time_buffer513:
L_mbus_hw_set_time_buffer512:
;mbus_hw.c,185 :: 		else if ( date->month >= 10 && date->month < 13 )
LDRB	R2, [R7, #0]
CMP	R2, #10
IT	CC
BCC	L_mbus_hw_set_time_buffer515
LDRB	R2, [R7, #0]
CMP	R2, #13
IT	CS
BCS	L_mbus_hw_set_time_buffer514
L_mbus_hw_set_time_buffer510:
;mbus_hw.c,187 :: 		ByteToStr( date->month, tmp );
ADD	R3, SP, #4
LDRB	R2, [R7, #0]
MOV	R1, R3
UXTB	R0, R2
BL	_ByteToStr+0
;mbus_hw.c,188 :: 		Ltrim( tmp );
ADD	R2, SP, #4
MOV	R0, R2
BL	_Ltrim+0
;mbus_hw.c,189 :: 		strncat( temp_buffer, tmp, 2 );
ADD	R2, SP, #4
MOV	R1, R2
MOVS	R2, #2
SXTH	R2, R2
MOV	R0, R8
BL	_strncat+0
;mbus_hw.c,190 :: 		}
IT	AL
BAL	L_mbus_hw_set_time_buffer36
; date end address is: 28 (R7)
; temp_buffer end address is: 32 (R8)
;mbus_hw.c,185 :: 		else if ( date->month >= 10 && date->month < 13 )
L_mbus_hw_set_time_buffer515:
L_mbus_hw_set_time_buffer514:
;mbus_hw.c,191 :: 		else return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_set_time_buffer
L_mbus_hw_set_time_buffer36:
; temp_buffer start address is: 32 (R8)
; date start address is: 28 (R7)
L_mbus_hw_set_time_buffer32:
;mbus_hw.c,192 :: 		tmp[0] = 0;
ADD	R4, SP, #4
MOVS	R2, #0
STRB	R2, [R4, #0]
;mbus_hw.c,193 :: 		tmp[1] = 0;
ADDS	R3, R4, #1
MOVS	R2, #0
STRB	R2, [R3, #0]
;mbus_hw.c,194 :: 		tmp[2] = 0;
ADDS	R3, R4, #2
MOVS	R2, #0
STRB	R2, [R3, #0]
;mbus_hw.c,196 :: 		if ( date->day < 10 && date->day > 0 )              /**< Set Day if Day is less than 32 and greater than 0 */
ADDS	R2, R7, #1
LDRB	R2, [R2, #0]
CMP	R2, #10
IT	CS
BCS	L_mbus_hw_set_time_buffer517
ADDS	R2, R7, #1
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	LS
BLS	L_mbus_hw_set_time_buffer516
L_mbus_hw_set_time_buffer509:
;mbus_hw.c,198 :: 		ByteToStr( date->day, tmp );
ADD	R3, SP, #4
STR	R3, [SP, #16]
ADDS	R2, R7, #1
LDRB	R2, [R2, #0]
MOV	R1, R3
UXTB	R0, R2
BL	_ByteToStr+0
;mbus_hw.c,199 :: 		Ltrim( tmp );
ADD	R2, SP, #4
MOV	R0, R2
BL	_Ltrim+0
;mbus_hw.c,200 :: 		tmp[1] = tmp[0];
ADD	R2, SP, #4
ADDS	R3, R2, #1
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;mbus_hw.c,201 :: 		tmp[0] = '0';
MOVS	R3, #48
LDR	R2, [SP, #16]
STRB	R3, [R2, #0]
;mbus_hw.c,202 :: 		strncat( temp_buffer, tmp, 2 );
MOV	R1, R2
MOVS	R2, #2
SXTH	R2, R2
MOV	R0, R8
BL	_strncat+0
;mbus_hw.c,203 :: 		}
IT	AL
BAL	L_mbus_hw_set_time_buffer40
;mbus_hw.c,196 :: 		if ( date->day < 10 && date->day > 0 )              /**< Set Day if Day is less than 32 and greater than 0 */
L_mbus_hw_set_time_buffer517:
L_mbus_hw_set_time_buffer516:
;mbus_hw.c,204 :: 		else if ( date->day >= 10 && date->day < 32 )
ADDS	R2, R7, #1
LDRB	R2, [R2, #0]
CMP	R2, #10
IT	CC
BCC	L_mbus_hw_set_time_buffer519
ADDS	R2, R7, #1
LDRB	R2, [R2, #0]
CMP	R2, #32
IT	CS
BCS	L_mbus_hw_set_time_buffer518
L_mbus_hw_set_time_buffer508:
;mbus_hw.c,206 :: 		ByteToStr( date->day, tmp );
ADD	R3, SP, #4
ADDS	R2, R7, #1
LDRB	R2, [R2, #0]
MOV	R1, R3
UXTB	R0, R2
BL	_ByteToStr+0
;mbus_hw.c,207 :: 		Ltrim( tmp );
ADD	R2, SP, #4
MOV	R0, R2
BL	_Ltrim+0
;mbus_hw.c,208 :: 		strncat( temp_buffer, tmp, 2 );
ADD	R2, SP, #4
MOV	R1, R2
MOVS	R2, #2
SXTH	R2, R2
MOV	R0, R8
BL	_strncat+0
;mbus_hw.c,209 :: 		}
IT	AL
BAL	L_mbus_hw_set_time_buffer44
; date end address is: 28 (R7)
; temp_buffer end address is: 32 (R8)
;mbus_hw.c,204 :: 		else if ( date->day >= 10 && date->day < 32 )
L_mbus_hw_set_time_buffer519:
L_mbus_hw_set_time_buffer518:
;mbus_hw.c,210 :: 		else return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_set_time_buffer
L_mbus_hw_set_time_buffer44:
; temp_buffer start address is: 32 (R8)
; date start address is: 28 (R7)
L_mbus_hw_set_time_buffer40:
;mbus_hw.c,211 :: 		tmp[0] = 0;
ADD	R4, SP, #4
MOVS	R2, #0
STRB	R2, [R4, #0]
;mbus_hw.c,212 :: 		tmp[1] = 0;
ADDS	R3, R4, #1
MOVS	R2, #0
STRB	R2, [R3, #0]
;mbus_hw.c,213 :: 		tmp[2] = 0;
ADDS	R3, R4, #2
MOVS	R2, #0
STRB	R2, [R3, #0]
;mbus_hw.c,215 :: 		if ( date->hour < 10 && date->hour >= 0 )           /**< Set Hour if Hour is less than 24 and greater than or equal to 0 */
ADDS	R2, R7, #2
LDRB	R2, [R2, #0]
CMP	R2, #10
IT	CS
BCS	L_mbus_hw_set_time_buffer521
ADDS	R2, R7, #2
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	CC
BCC	L_mbus_hw_set_time_buffer520
L_mbus_hw_set_time_buffer507:
;mbus_hw.c,217 :: 		ByteToStr( date->hour, tmp );
ADD	R3, SP, #4
STR	R3, [SP, #16]
ADDS	R2, R7, #2
LDRB	R2, [R2, #0]
MOV	R1, R3
UXTB	R0, R2
BL	_ByteToStr+0
;mbus_hw.c,218 :: 		Ltrim( tmp );
ADD	R2, SP, #4
MOV	R0, R2
BL	_Ltrim+0
;mbus_hw.c,219 :: 		tmp[1] = tmp[0];
ADD	R2, SP, #4
ADDS	R3, R2, #1
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;mbus_hw.c,220 :: 		tmp[0] = '0';
MOVS	R3, #48
LDR	R2, [SP, #16]
STRB	R3, [R2, #0]
;mbus_hw.c,221 :: 		strncat( temp_buffer, tmp, 2 );
MOV	R1, R2
MOVS	R2, #2
SXTH	R2, R2
MOV	R0, R8
BL	_strncat+0
;mbus_hw.c,222 :: 		}
IT	AL
BAL	L_mbus_hw_set_time_buffer48
;mbus_hw.c,215 :: 		if ( date->hour < 10 && date->hour >= 0 )           /**< Set Hour if Hour is less than 24 and greater than or equal to 0 */
L_mbus_hw_set_time_buffer521:
L_mbus_hw_set_time_buffer520:
;mbus_hw.c,223 :: 		else if ( date->hour >= 10 && date->hour < 24 )
ADDS	R2, R7, #2
LDRB	R2, [R2, #0]
CMP	R2, #10
IT	CC
BCC	L_mbus_hw_set_time_buffer523
ADDS	R2, R7, #2
LDRB	R2, [R2, #0]
CMP	R2, #24
IT	CS
BCS	L_mbus_hw_set_time_buffer522
L_mbus_hw_set_time_buffer506:
;mbus_hw.c,225 :: 		ByteToStr( date->hour, tmp );
ADD	R3, SP, #4
ADDS	R2, R7, #2
LDRB	R2, [R2, #0]
MOV	R1, R3
UXTB	R0, R2
BL	_ByteToStr+0
;mbus_hw.c,226 :: 		Ltrim( tmp );
ADD	R2, SP, #4
MOV	R0, R2
BL	_Ltrim+0
;mbus_hw.c,227 :: 		strncat( temp_buffer, tmp, 2 );
ADD	R2, SP, #4
MOV	R1, R2
MOVS	R2, #2
SXTH	R2, R2
MOV	R0, R8
BL	_strncat+0
;mbus_hw.c,228 :: 		}
IT	AL
BAL	L_mbus_hw_set_time_buffer52
; date end address is: 28 (R7)
; temp_buffer end address is: 32 (R8)
;mbus_hw.c,223 :: 		else if ( date->hour >= 10 && date->hour < 24 )
L_mbus_hw_set_time_buffer523:
L_mbus_hw_set_time_buffer522:
;mbus_hw.c,229 :: 		else return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_set_time_buffer
L_mbus_hw_set_time_buffer52:
; temp_buffer start address is: 32 (R8)
; date start address is: 28 (R7)
L_mbus_hw_set_time_buffer48:
;mbus_hw.c,230 :: 		tmp[0] = 0;
ADD	R4, SP, #4
MOVS	R2, #0
STRB	R2, [R4, #0]
;mbus_hw.c,231 :: 		tmp[1] = 0;
ADDS	R3, R4, #1
MOVS	R2, #0
STRB	R2, [R3, #0]
;mbus_hw.c,232 :: 		tmp[2] = 0;
ADDS	R3, R4, #2
MOVS	R2, #0
STRB	R2, [R3, #0]
;mbus_hw.c,234 :: 		if ( date->minute < 10 && date->minute >= 0 )       /**< Set Minute if Minute is less than 60 and greater than or equal to 0 */
ADDS	R2, R7, #3
LDRB	R2, [R2, #0]
CMP	R2, #10
IT	CS
BCS	L_mbus_hw_set_time_buffer525
ADDS	R2, R7, #3
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	CC
BCC	L_mbus_hw_set_time_buffer524
L_mbus_hw_set_time_buffer505:
;mbus_hw.c,236 :: 		ByteToStr( date->minute, tmp );
ADD	R3, SP, #4
STR	R3, [SP, #16]
ADDS	R2, R7, #3
LDRB	R2, [R2, #0]
MOV	R1, R3
UXTB	R0, R2
BL	_ByteToStr+0
;mbus_hw.c,237 :: 		Ltrim( tmp );
ADD	R2, SP, #4
MOV	R0, R2
BL	_Ltrim+0
;mbus_hw.c,238 :: 		tmp[1] = tmp[0];
ADD	R2, SP, #4
ADDS	R3, R2, #1
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;mbus_hw.c,239 :: 		tmp[0] = '0';
MOVS	R3, #48
LDR	R2, [SP, #16]
STRB	R3, [R2, #0]
;mbus_hw.c,240 :: 		strncat( temp_buffer, tmp, 2 );
MOV	R1, R2
MOVS	R2, #2
SXTH	R2, R2
MOV	R0, R8
BL	_strncat+0
;mbus_hw.c,241 :: 		}
IT	AL
BAL	L_mbus_hw_set_time_buffer56
;mbus_hw.c,234 :: 		if ( date->minute < 10 && date->minute >= 0 )       /**< Set Minute if Minute is less than 60 and greater than or equal to 0 */
L_mbus_hw_set_time_buffer525:
L_mbus_hw_set_time_buffer524:
;mbus_hw.c,242 :: 		else if ( date->minute >= 10 && date->minute < 60 )
ADDS	R2, R7, #3
LDRB	R2, [R2, #0]
CMP	R2, #10
IT	CC
BCC	L_mbus_hw_set_time_buffer527
ADDS	R2, R7, #3
LDRB	R2, [R2, #0]
CMP	R2, #60
IT	CS
BCS	L_mbus_hw_set_time_buffer526
L_mbus_hw_set_time_buffer504:
;mbus_hw.c,244 :: 		ByteToStr( date->minute, tmp );
ADD	R3, SP, #4
ADDS	R2, R7, #3
LDRB	R2, [R2, #0]
MOV	R1, R3
UXTB	R0, R2
BL	_ByteToStr+0
;mbus_hw.c,245 :: 		Ltrim( tmp );
ADD	R2, SP, #4
MOV	R0, R2
BL	_Ltrim+0
;mbus_hw.c,246 :: 		strncat( temp_buffer, tmp, 2 );
ADD	R2, SP, #4
MOV	R1, R2
MOVS	R2, #2
SXTH	R2, R2
MOV	R0, R8
BL	_strncat+0
;mbus_hw.c,247 :: 		}
IT	AL
BAL	L_mbus_hw_set_time_buffer60
; date end address is: 28 (R7)
; temp_buffer end address is: 32 (R8)
;mbus_hw.c,242 :: 		else if ( date->minute >= 10 && date->minute < 60 )
L_mbus_hw_set_time_buffer527:
L_mbus_hw_set_time_buffer526:
;mbus_hw.c,248 :: 		else return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_set_time_buffer
L_mbus_hw_set_time_buffer60:
; temp_buffer start address is: 32 (R8)
; date start address is: 28 (R7)
L_mbus_hw_set_time_buffer56:
;mbus_hw.c,249 :: 		tmp[0] = 0;
ADD	R4, SP, #4
MOVS	R2, #0
STRB	R2, [R4, #0]
;mbus_hw.c,250 :: 		tmp[1] = 0;
ADDS	R3, R4, #1
MOVS	R2, #0
STRB	R2, [R3, #0]
;mbus_hw.c,251 :: 		tmp[2] = 0;
ADDS	R3, R4, #2
MOVS	R2, #0
STRB	R2, [R3, #0]
;mbus_hw.c,253 :: 		if ( date->year < 10 && date->year >= 5 )           /**< Set Year if Year is less than 100 and greater than or equal to 5*/
ADDS	R2, R7, #4
LDRB	R2, [R2, #0]
CMP	R2, #10
IT	CS
BCS	L_mbus_hw_set_time_buffer529
ADDS	R2, R7, #4
LDRB	R2, [R2, #0]
CMP	R2, #5
IT	CC
BCC	L_mbus_hw_set_time_buffer528
L_mbus_hw_set_time_buffer503:
;mbus_hw.c,255 :: 		ByteToStr( date->year, tmp );
ADD	R3, SP, #4
STR	R3, [SP, #16]
ADDS	R2, R7, #4
LDRB	R2, [R2, #0]
MOV	R1, R3
UXTB	R0, R2
BL	_ByteToStr+0
;mbus_hw.c,256 :: 		Ltrim( tmp );
ADD	R2, SP, #4
MOV	R0, R2
BL	_Ltrim+0
;mbus_hw.c,257 :: 		tmp[1] = tmp[0];
ADD	R2, SP, #4
ADDS	R3, R2, #1
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;mbus_hw.c,258 :: 		tmp[0] = '0';
MOVS	R3, #48
LDR	R2, [SP, #16]
STRB	R3, [R2, #0]
;mbus_hw.c,259 :: 		strncat( temp_buffer, tmp, 2 );
MOV	R1, R2
MOVS	R2, #2
SXTH	R2, R2
MOV	R0, R8
BL	_strncat+0
;mbus_hw.c,260 :: 		}
IT	AL
BAL	L_mbus_hw_set_time_buffer64
;mbus_hw.c,253 :: 		if ( date->year < 10 && date->year >= 5 )           /**< Set Year if Year is less than 100 and greater than or equal to 5*/
L_mbus_hw_set_time_buffer529:
L_mbus_hw_set_time_buffer528:
;mbus_hw.c,261 :: 		else if ( date->year >= 10 && date->year < 100 )
ADDS	R2, R7, #4
LDRB	R2, [R2, #0]
CMP	R2, #10
IT	CC
BCC	L_mbus_hw_set_time_buffer531
ADDS	R2, R7, #4
LDRB	R2, [R2, #0]
CMP	R2, #100
IT	CS
BCS	L_mbus_hw_set_time_buffer530
L_mbus_hw_set_time_buffer502:
;mbus_hw.c,263 :: 		ByteToStr( date->year, tmp );
ADD	R3, SP, #4
ADDS	R2, R7, #4
LDRB	R2, [R2, #0]
MOV	R1, R3
UXTB	R0, R2
BL	_ByteToStr+0
;mbus_hw.c,264 :: 		Ltrim( tmp );
ADD	R2, SP, #4
MOV	R0, R2
BL	_Ltrim+0
;mbus_hw.c,265 :: 		strncat( temp_buffer, tmp, 2 );
ADD	R2, SP, #4
MOV	R1, R2
MOVS	R2, #2
SXTH	R2, R2
MOV	R0, R8
BL	_strncat+0
;mbus_hw.c,266 :: 		}
IT	AL
BAL	L_mbus_hw_set_time_buffer68
; date end address is: 28 (R7)
; temp_buffer end address is: 32 (R8)
;mbus_hw.c,261 :: 		else if ( date->year >= 10 && date->year < 100 )
L_mbus_hw_set_time_buffer531:
L_mbus_hw_set_time_buffer530:
;mbus_hw.c,267 :: 		else return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_set_time_buffer
L_mbus_hw_set_time_buffer68:
; temp_buffer start address is: 32 (R8)
; date start address is: 28 (R7)
L_mbus_hw_set_time_buffer64:
;mbus_hw.c,268 :: 		tmp[0] = 0;
ADD	R4, SP, #4
MOVS	R2, #0
STRB	R2, [R4, #0]
;mbus_hw.c,269 :: 		tmp[1] = 0;
ADDS	R3, R4, #1
MOVS	R2, #0
STRB	R2, [R3, #0]
;mbus_hw.c,270 :: 		tmp[2] = 0;
ADDS	R3, R4, #2
MOVS	R2, #0
STRB	R2, [R3, #0]
;mbus_hw.c,272 :: 		if ( date->second < 10 && date->second >= 0 )       /**< Set Second if Second is less than 60 and greater than or equal to 0 */
ADDS	R2, R7, #5
LDRB	R2, [R2, #0]
CMP	R2, #10
IT	CS
BCS	L_mbus_hw_set_time_buffer533
ADDS	R2, R7, #5
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	CC
BCC	L_mbus_hw_set_time_buffer532
L_mbus_hw_set_time_buffer501:
;mbus_hw.c,274 :: 		ByteToStr( date->second, tmp );
ADD	R3, SP, #4
STR	R3, [SP, #16]
ADDS	R2, R7, #5
; date end address is: 28 (R7)
LDRB	R2, [R2, #0]
MOV	R1, R3
UXTB	R0, R2
BL	_ByteToStr+0
;mbus_hw.c,275 :: 		Ltrim( tmp );
ADD	R2, SP, #4
MOV	R0, R2
BL	_Ltrim+0
;mbus_hw.c,276 :: 		tmp[1] = tmp[0];
ADD	R2, SP, #4
ADDS	R3, R2, #1
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
;mbus_hw.c,277 :: 		tmp[0] = '0';
MOVS	R3, #48
LDR	R2, [SP, #16]
STRB	R3, [R2, #0]
;mbus_hw.c,278 :: 		strncat( temp_buffer, tmp, 2 );
MOV	R1, R2
MOVS	R2, #2
SXTH	R2, R2
MOV	R0, R8
; temp_buffer end address is: 32 (R8)
BL	_strncat+0
;mbus_hw.c,279 :: 		}
IT	AL
BAL	L_mbus_hw_set_time_buffer72
;mbus_hw.c,272 :: 		if ( date->second < 10 && date->second >= 0 )       /**< Set Second if Second is less than 60 and greater than or equal to 0 */
L_mbus_hw_set_time_buffer533:
; temp_buffer start address is: 32 (R8)
; date start address is: 28 (R7)
L_mbus_hw_set_time_buffer532:
;mbus_hw.c,280 :: 		else if ( date->second >= 10 && date->second < 60 )
ADDS	R2, R7, #5
LDRB	R2, [R2, #0]
CMP	R2, #10
IT	CC
BCC	L_mbus_hw_set_time_buffer535
ADDS	R2, R7, #5
LDRB	R2, [R2, #0]
CMP	R2, #60
IT	CS
BCS	L_mbus_hw_set_time_buffer534
L_mbus_hw_set_time_buffer500:
;mbus_hw.c,282 :: 		ByteToStr( date->second, tmp );
ADD	R3, SP, #4
ADDS	R2, R7, #5
; date end address is: 28 (R7)
LDRB	R2, [R2, #0]
MOV	R1, R3
UXTB	R0, R2
BL	_ByteToStr+0
;mbus_hw.c,283 :: 		Ltrim( tmp );
ADD	R2, SP, #4
MOV	R0, R2
BL	_Ltrim+0
;mbus_hw.c,284 :: 		strncat( temp_buffer, tmp, 2 );
ADD	R2, SP, #4
MOV	R1, R2
MOVS	R2, #2
SXTH	R2, R2
MOV	R0, R8
; temp_buffer end address is: 32 (R8)
BL	_strncat+0
;mbus_hw.c,285 :: 		}
IT	AL
BAL	L_mbus_hw_set_time_buffer76
;mbus_hw.c,280 :: 		else if ( date->second >= 10 && date->second < 60 )
L_mbus_hw_set_time_buffer535:
L_mbus_hw_set_time_buffer534:
;mbus_hw.c,286 :: 		else return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_set_time_buffer
L_mbus_hw_set_time_buffer76:
L_mbus_hw_set_time_buffer72:
;mbus_hw.c,287 :: 		tmp[0] = 0;
ADD	R4, SP, #4
MOVS	R2, #0
STRB	R2, [R4, #0]
;mbus_hw.c,288 :: 		tmp[1] = 0;
ADDS	R3, R4, #1
MOVS	R2, #0
STRB	R2, [R3, #0]
;mbus_hw.c,289 :: 		tmp[2] = 0;
ADDS	R3, R4, #2
MOVS	R2, #0
STRB	R2, [R3, #0]
;mbus_hw.c,291 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,292 :: 		}
L_end_set_time_buffer:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of mbus_hw_set_time_buffer
mbus_hw_get_register_contents:
;mbus_hw.c,294 :: 		static void get_register_contents( uint8_t *buffer )
; buffer start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
;mbus_hw.c,296 :: 		uint8_t i = 0;
; i start address is: 32 (R8)
MOVW	R8, #0
;mbus_hw.c,297 :: 		uint8_t end = 0;
; end start address is: 8 (R2)
MOVS	R2, #0
;mbus_hw.c,298 :: 		char str[6] = { 0 };
MOVS	R1, #0
STRB	R1, [SP, #4]
MOVS	R1, #0
STRB	R1, [SP, #5]
STRB	R1, [SP, #6]
STRB	R1, [SP, #7]
STRB	R1, [SP, #8]
STRB	R1, [SP, #9]
; buffer end address is: 0 (R0)
; end end address is: 8 (R2)
; i end address is: 32 (R8)
MOV	R7, R0
UXTB	R0, R2
;mbus_hw.c,300 :: 		while ( rx_buffer[rx_buffer_cnt] != '=' )       /**< Format of registers after a requested read is ATSn=m */
L_mbus_hw_get_register_contents77:
; end start address is: 0 (R0)
; i start address is: 32 (R8)
; buffer start address is: 28 (R7)
MOVW	R1, #lo_addr(mbus_hw_rx_buffer_cnt+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer_cnt+0)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
ADDS	R1, R1, R2
LDRB	R1, [R1, #0]
CMP	R1, #61
IT	EQ
BEQ	L_mbus_hw_get_register_contents78
;mbus_hw.c,302 :: 		rx_buffer_cnt--;
MOVW	R2, #lo_addr(mbus_hw_rx_buffer_cnt+0)
MOVT	R2, #hi_addr(mbus_hw_rx_buffer_cnt+0)
LDRH	R1, [R2, #0]
SUBS	R1, R1, #1
STRH	R1, [R2, #0]
;mbus_hw.c,303 :: 		end++;
ADDS	R0, R0, #1
UXTB	R0, R0
;mbus_hw.c,304 :: 		}
IT	AL
BAL	L_mbus_hw_get_register_contents77
L_mbus_hw_get_register_contents78:
;mbus_hw.c,305 :: 		rx_buffer_cnt++;
MOVW	R2, #lo_addr(mbus_hw_rx_buffer_cnt+0)
MOVT	R2, #hi_addr(mbus_hw_rx_buffer_cnt+0)
LDRH	R1, [R2, #0]
ADDS	R1, R1, #1
STRH	R1, [R2, #0]
;mbus_hw.c,306 :: 		end--;
SUBS	R0, R0, #1
UXTB	R0, R0
; buffer end address is: 28 (R7)
; i end address is: 32 (R8)
; end end address is: 0 (R0)
;mbus_hw.c,308 :: 		while ( end )                                   /**< Put those characters into a string */
L_mbus_hw_get_register_contents79:
; end start address is: 0 (R0)
; buffer start address is: 28 (R7)
; i start address is: 32 (R8)
CMP	R0, #0
IT	EQ
BEQ	L_mbus_hw_get_register_contents80
;mbus_hw.c,310 :: 		str[i++] = rx_buffer[rx_buffer_cnt++];
ADD	R1, SP, #4
ADD	R4, R1, R8, LSL #0
MOVW	R3, #lo_addr(mbus_hw_rx_buffer_cnt+0)
MOVT	R3, #hi_addr(mbus_hw_rx_buffer_cnt+0)
LDRH	R2, [R3, #0]
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
ADDS	R1, R1, R2
LDRB	R1, [R1, #0]
STRB	R1, [R4, #0]
ADD	R8, R8, #1
UXTB	R8, R8
MOV	R1, R3
LDRH	R1, [R1, #0]
ADDS	R1, R1, #1
STRH	R1, [R3, #0]
;mbus_hw.c,311 :: 		end--;
SUBS	R0, R0, #1
UXTB	R0, R0
;mbus_hw.c,312 :: 		}
; end end address is: 0 (R0)
IT	AL
BAL	L_mbus_hw_get_register_contents79
L_mbus_hw_get_register_contents80:
;mbus_hw.c,313 :: 		str[i] = 0;
ADD	R3, SP, #4
ADD	R2, R3, R8, LSL #0
; i end address is: 32 (R8)
MOVS	R1, #0
STRB	R1, [R2, #0]
;mbus_hw.c,314 :: 		*buffer = atoi( str );                          /**< Convert the ascii to a integer */
MOV	R0, R3
BL	_atoi+0
STRB	R0, [R7, #0]
; buffer end address is: 28 (R7)
;mbus_hw.c,316 :: 		}
L_end_get_register_contents:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of mbus_hw_get_register_contents
mbus_hw_get_register_contents_long:
;mbus_hw.c,318 :: 		static void get_register_contents_long( uint16_t *buffer )
; buffer start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
;mbus_hw.c,320 :: 		uint8_t i = 0;
; i start address is: 32 (R8)
MOVW	R8, #0
;mbus_hw.c,321 :: 		uint8_t end = 0;
; end start address is: 8 (R2)
MOVS	R2, #0
;mbus_hw.c,322 :: 		char str[6] = { 0 };
MOVS	R1, #0
STRB	R1, [SP, #4]
MOVS	R1, #0
STRB	R1, [SP, #5]
STRB	R1, [SP, #6]
STRB	R1, [SP, #7]
STRB	R1, [SP, #8]
STRB	R1, [SP, #9]
; buffer end address is: 0 (R0)
; end end address is: 8 (R2)
; i end address is: 32 (R8)
MOV	R7, R0
UXTB	R0, R2
;mbus_hw.c,324 :: 		while ( rx_buffer[rx_buffer_cnt] != '=' )       /**< Same as get_register_contents except... */
L_mbus_hw_get_register_contents_long81:
; end start address is: 0 (R0)
; i start address is: 32 (R8)
; buffer start address is: 28 (R7)
MOVW	R1, #lo_addr(mbus_hw_rx_buffer_cnt+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer_cnt+0)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
ADDS	R1, R1, R2
LDRB	R1, [R1, #0]
CMP	R1, #61
IT	EQ
BEQ	L_mbus_hw_get_register_contents_long82
;mbus_hw.c,326 :: 		rx_buffer_cnt--;
MOVW	R2, #lo_addr(mbus_hw_rx_buffer_cnt+0)
MOVT	R2, #hi_addr(mbus_hw_rx_buffer_cnt+0)
LDRH	R1, [R2, #0]
SUBS	R1, R1, #1
STRH	R1, [R2, #0]
;mbus_hw.c,327 :: 		end++;
ADDS	R0, R0, #1
UXTB	R0, R0
;mbus_hw.c,328 :: 		}
IT	AL
BAL	L_mbus_hw_get_register_contents_long81
L_mbus_hw_get_register_contents_long82:
;mbus_hw.c,329 :: 		rx_buffer_cnt++;
MOVW	R2, #lo_addr(mbus_hw_rx_buffer_cnt+0)
MOVT	R2, #hi_addr(mbus_hw_rx_buffer_cnt+0)
LDRH	R1, [R2, #0]
ADDS	R1, R1, #1
STRH	R1, [R2, #0]
;mbus_hw.c,330 :: 		end--;
SUBS	R0, R0, #1
UXTB	R0, R0
; buffer end address is: 28 (R7)
; i end address is: 32 (R8)
; end end address is: 0 (R0)
;mbus_hw.c,332 :: 		while ( end )
L_mbus_hw_get_register_contents_long83:
; end start address is: 0 (R0)
; buffer start address is: 28 (R7)
; i start address is: 32 (R8)
CMP	R0, #0
IT	EQ
BEQ	L_mbus_hw_get_register_contents_long84
;mbus_hw.c,334 :: 		str[i++] = rx_buffer[rx_buffer_cnt++];
ADD	R1, SP, #4
ADD	R4, R1, R8, LSL #0
MOVW	R3, #lo_addr(mbus_hw_rx_buffer_cnt+0)
MOVT	R3, #hi_addr(mbus_hw_rx_buffer_cnt+0)
LDRH	R2, [R3, #0]
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
ADDS	R1, R1, R2
LDRB	R1, [R1, #0]
STRB	R1, [R4, #0]
ADD	R8, R8, #1
UXTB	R8, R8
MOV	R1, R3
LDRH	R1, [R1, #0]
ADDS	R1, R1, #1
STRH	R1, [R3, #0]
;mbus_hw.c,335 :: 		end--;
SUBS	R0, R0, #1
UXTB	R0, R0
;mbus_hw.c,336 :: 		}
; end end address is: 0 (R0)
IT	AL
BAL	L_mbus_hw_get_register_contents_long83
L_mbus_hw_get_register_contents_long84:
;mbus_hw.c,337 :: 		str[i] = NULL;
ADD	R3, SP, #4
ADD	R2, R3, R8, LSL #0
; i end address is: 32 (R8)
MOVS	R1, #0
STRB	R1, [R2, #0]
;mbus_hw.c,338 :: 		*buffer = atol( str );                          /**< Convert the ascii to a long instead of integer */
MOV	R0, R3
BL	_atol+0
STRH	R0, [R7, #0]
; buffer end address is: 28 (R7)
;mbus_hw.c,339 :: 		}
L_end_get_register_contents_long:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of mbus_hw_get_register_contents_long
_mbus_rx_isr:
;mbus_hw.c,350 :: 		void mbus_rx_isr( char rx_input )
; rx_input start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; rx_input end address is: 0 (R0)
; rx_input start address is: 0 (R0)
;mbus_hw.c,352 :: 		rx_buffer[rx_buffer_cnt++] = rx_input;
MOVW	R3, #lo_addr(mbus_hw_rx_buffer_cnt+0)
MOVT	R3, #hi_addr(mbus_hw_rx_buffer_cnt+0)
LDRH	R2, [R3, #0]
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
ADDS	R1, R1, R2
STRB	R0, [R1, #0]
MOV	R1, R3
LDRH	R1, [R1, #0]
ADDS	R1, R1, #1
STRH	R1, [R3, #0]
;mbus_hw.c,354 :: 		if ( !configuration )
MOVW	R1, #lo_addr(mbus_hw_configuration+0)
MOVT	R1, #hi_addr(mbus_hw_configuration+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_rx_isr85
; rx_input end address is: 0 (R0)
;mbus_hw.c,356 :: 		if ( rx_buffer_cnt >= rx_buffer[0] + 1 )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
ADDS	R2, R1, #1
SXTH	R2, R2
MOVW	R1, #lo_addr(mbus_hw_rx_buffer_cnt+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer_cnt+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	CC
BCC	L_mbus_rx_isr86
;mbus_hw.c,358 :: 		response_finished = true;
MOVS	R2, #1
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
STRB	R2, [R1, #0]
;mbus_hw.c,359 :: 		my_receive_flag = true;
MOVS	R2, #1
MOVW	R1, #lo_addr(_my_receive_flag+0)
MOVT	R1, #hi_addr(_my_receive_flag+0)
STRB	R2, [R1, #0]
;mbus_hw.c,360 :: 		}
L_mbus_rx_isr86:
;mbus_hw.c,361 :: 		}
IT	AL
BAL	L_mbus_rx_isr87
L_mbus_rx_isr85:
;mbus_hw.c,362 :: 		else if ( configuration )
; rx_input start address is: 0 (R0)
MOVW	R1, #lo_addr(mbus_hw_configuration+0)
MOVT	R1, #hi_addr(mbus_hw_configuration+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_mbus_rx_isr88
;mbus_hw.c,364 :: 		if ( rx_input == 13 )
CMP	R0, #13
IT	NE
BNE	L_mbus_rx_isr89
; rx_input end address is: 0 (R0)
;mbus_hw.c,366 :: 		response_finished = true;
MOVS	R2, #1
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
STRB	R2, [R1, #0]
;mbus_hw.c,367 :: 		rx_buffer[--rx_buffer_cnt] = NULL;      /**< Set the Carriage return to a null */
MOVW	R3, #lo_addr(mbus_hw_rx_buffer_cnt+0)
MOVT	R3, #hi_addr(mbus_hw_rx_buffer_cnt+0)
LDRH	R1, [R3, #0]
SUBS	R2, R1, #1
UXTH	R2, R2
STRH	R2, [R3, #0]
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
ADDS	R2, R1, R2
MOVS	R1, #0
STRB	R1, [R2, #0]
;mbus_hw.c,368 :: 		}
L_mbus_rx_isr89:
;mbus_hw.c,369 :: 		}
L_mbus_rx_isr88:
L_mbus_rx_isr87:
;mbus_hw.c,370 :: 		if( rx_buffer_cnt >= RX_BUFFER_SIZE )           /**< If the buffer is full, wait to give me more data */
MOVW	R1, #lo_addr(mbus_hw_rx_buffer_cnt+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer_cnt+0)
LDRH	R1, [R1, #0]
CMP	R1, #300
IT	CC
BCC	L_mbus_rx_isr90
;mbus_hw.c,371 :: 		mbus_rx_ctl( false );
MOVS	R0, #0
BL	_mbus_rx_ctl+0
IT	AL
BAL	L_mbus_rx_isr91
L_mbus_rx_isr90:
;mbus_hw.c,373 :: 		mbus_rx_ctl( true );
MOVS	R0, #1
BL	_mbus_rx_ctl+0
L_mbus_rx_isr91:
;mbus_hw.c,375 :: 		}
L_end_mbus_rx_isr:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _mbus_rx_isr
_mbus_init:
;mbus_hw.c,377 :: 		void mbus_init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mbus_hw.c,379 :: 		mbus_hal_init();                                /**< HAL initialization ( UART Comm., GPIO Externs, Reset )        */
BL	_mbus_hal_init+0
;mbus_hw.c,380 :: 		mbus_set_formats_false();
BL	mbus_hw_mbus_set_formats_false+0
;mbus_hw.c,381 :: 		}
L_end_mbus_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _mbus_init
_mbus_at_init:
;mbus_hw.c,383 :: 		status_t mbus_at_init( void )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mbus_hw.c,385 :: 		configuration = true;
MOVS	R1, #1
MOVW	R0, #lo_addr(mbus_hw_configuration+0)
MOVT	R0, #hi_addr(mbus_hw_configuration+0)
STRB	R1, [R0, #0]
;mbus_hw.c,386 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,389 :: 		mbus_hal_write_text( AT_MODE );
MOVW	R0, #lo_addr(?lstr1_mbus_hw+0)
MOVT	R0, #hi_addr(?lstr1_mbus_hw+0)
BL	_mbus_hal_write_text+0
;mbus_hw.c,391 :: 		while ( !response_finished );                   /**< Wait for response */
L_mbus_at_init92:
MOVW	R0, #lo_addr(mbus_hw_response_finished+0)
MOVT	R0, #hi_addr(mbus_hw_response_finished+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_mbus_at_init93
IT	AL
BAL	L_mbus_at_init92
L_mbus_at_init93:
;mbus_hw.c,393 :: 		if ( rx_buffer[0] == 'O' && rx_buffer[1] == 'K' )
MOVW	R0, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R0, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R0, [R0, #0]
CMP	R0, #79
IT	NE
BNE	L__mbus_at_init538
MOVW	R0, #lo_addr(mbus_hw_rx_buffer+1)
MOVT	R0, #hi_addr(mbus_hw_rx_buffer+1)
LDRB	R0, [R0, #0]
CMP	R0, #75
IT	NE
BNE	L__mbus_at_init537
L__mbus_at_init536:
;mbus_hw.c,395 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,396 :: 		return OK_STATUS;
MOVS	R0, #1
IT	AL
BAL	L_end_mbus_at_init
;mbus_hw.c,393 :: 		if ( rx_buffer[0] == 'O' && rx_buffer[1] == 'K' )
L__mbus_at_init538:
L__mbus_at_init537:
;mbus_hw.c,400 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,401 :: 		return ERROR;
MOVS	R0, #2
;mbus_hw.c,403 :: 		}
L_end_mbus_at_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _mbus_at_init
_mbus_op_init:
;mbus_hw.c,405 :: 		status_t mbus_op_init( void )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mbus_hw.c,407 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,412 :: 		mbus_hal_write_text( OP_MODE );               /**< Initializes Modems Operating Mode */
MOVW	R0, #lo_addr(?lstr2_mbus_hw+0)
MOVT	R0, #hi_addr(?lstr2_mbus_hw+0)
BL	_mbus_hal_write_text+0
;mbus_hw.c,413 :: 		mbus_hal_write( creturn );                    /**< Carriage Return */
MOVW	R0, #lo_addr(mbus_hw_creturn+0)
MOVT	R0, #hi_addr(mbus_hw_creturn+0)
LDRB	R0, [R0, #0]
BL	_mbus_hal_write+0
;mbus_hw.c,415 :: 		while ( !response_finished );                   /**< Wait for response */
L_mbus_op_init98:
MOVW	R0, #lo_addr(mbus_hw_response_finished+0)
MOVT	R0, #hi_addr(mbus_hw_response_finished+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_mbus_op_init99
IT	AL
BAL	L_mbus_op_init98
L_mbus_op_init99:
;mbus_hw.c,417 :: 		configuration = false;
MOVS	R1, #0
MOVW	R0, #lo_addr(mbus_hw_configuration+0)
MOVT	R0, #hi_addr(mbus_hw_configuration+0)
STRB	R1, [R0, #0]
;mbus_hw.c,418 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R0, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R0, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R0, [R0, #0]
CMP	R0, #69
IT	NE
BNE	L_mbus_op_init100
;mbus_hw.c,420 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,421 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_op_init
;mbus_hw.c,422 :: 		}
L_mbus_op_init100:
;mbus_hw.c,425 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,426 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,428 :: 		}
L_end_mbus_op_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _mbus_op_init
_mbus_get_firmware_bootloader_vers:
;mbus_hw.c,430 :: 		status_t mbus_get_firmware_bootloader_vers( uint8_t *version )
SUB	SP, SP, #8
STR	LR, [SP, #0]
STR	R0, [SP, #4]
;mbus_hw.c,432 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,436 :: 		mbus_hal_write_text( FIRMWARE_READ );           /**< Requests Firmware / Bootloader Data */
MOVW	R1, #lo_addr(?lstr3_mbus_hw+0)
MOVT	R1, #hi_addr(?lstr3_mbus_hw+0)
MOV	R0, R1
BL	_mbus_hal_write_text+0
;mbus_hw.c,437 :: 		mbus_hal_write( creturn );                      /**< Carriage Return */
MOVW	R1, #lo_addr(mbus_hw_creturn+0)
MOVT	R1, #hi_addr(mbus_hw_creturn+0)
LDRB	R1, [R1, #0]
UXTB	R0, R1
BL	_mbus_hal_write+0
;mbus_hw.c,439 :: 		while ( !response_finished );
L_mbus_get_firmware_bootloader_vers102:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_firmware_bootloader_vers103
IT	AL
BAL	L_mbus_get_firmware_bootloader_vers102
L_mbus_get_firmware_bootloader_vers103:
;mbus_hw.c,441 :: 		strcpy( version, rx_buffer );
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDR	R0, [SP, #4]
BL	_strcpy+0
;mbus_hw.c,443 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,444 :: 		}
L_end_mbus_get_firmware_bootloader_vers:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _mbus_get_firmware_bootloader_vers
_mbus_reset_params:
;mbus_hw.c,483 :: 		status_t mbus_reset_params( void )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mbus_hw.c,485 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,490 :: 		mbus_hal_write_text( RESET_MODEM_PARAM );       /**< Tells MBus to reset Modem Params */
MOVW	R0, #lo_addr(?lstr4_mbus_hw+0)
MOVT	R0, #hi_addr(?lstr4_mbus_hw+0)
BL	_mbus_hal_write_text+0
;mbus_hw.c,491 :: 		mbus_hal_write( creturn );                      /**< Carriage Return */
MOVW	R0, #lo_addr(mbus_hw_creturn+0)
MOVT	R0, #hi_addr(mbus_hw_creturn+0)
LDRB	R0, [R0, #0]
BL	_mbus_hal_write+0
;mbus_hw.c,493 :: 		while ( !response_finished );
L_mbus_reset_params104:
MOVW	R0, #lo_addr(mbus_hw_response_finished+0)
MOVT	R0, #hi_addr(mbus_hw_response_finished+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_mbus_reset_params105
IT	AL
BAL	L_mbus_reset_params104
L_mbus_reset_params105:
;mbus_hw.c,495 :: 		if ( rx_buffer[0] != 'O' )
MOVW	R0, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R0, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R0, [R0, #0]
CMP	R0, #79
IT	EQ
BEQ	L_mbus_reset_params106
;mbus_hw.c,496 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_reset_params
L_mbus_reset_params106:
;mbus_hw.c,498 :: 		mbus_set_formats_false();
BL	mbus_hw_mbus_set_formats_false+0
;mbus_hw.c,500 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,501 :: 		}
L_end_mbus_reset_params:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _mbus_reset_params
_mbus_reset_meters_list:
;mbus_hw.c,503 :: 		status_t mbus_reset_meters_list( void )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mbus_hw.c,505 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,509 :: 		mbus_hal_write_text( RESET_REGISTERED_METER );  /**< Tells MBus to reset Registered Meters */
MOVW	R0, #lo_addr(?lstr5_mbus_hw+0)
MOVT	R0, #hi_addr(?lstr5_mbus_hw+0)
BL	_mbus_hal_write_text+0
;mbus_hw.c,510 :: 		mbus_hal_write( creturn );
MOVW	R0, #lo_addr(mbus_hw_creturn+0)
MOVT	R0, #hi_addr(mbus_hw_creturn+0)
LDRB	R0, [R0, #0]
BL	_mbus_hal_write+0
;mbus_hw.c,512 :: 		while ( !response_finished );
L_mbus_reset_meters_list107:
MOVW	R0, #lo_addr(mbus_hw_response_finished+0)
MOVT	R0, #hi_addr(mbus_hw_response_finished+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_mbus_reset_meters_list108
IT	AL
BAL	L_mbus_reset_meters_list107
L_mbus_reset_meters_list108:
;mbus_hw.c,514 :: 		if ( rx_buffer[0] != 'O' )
MOVW	R0, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R0, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R0, [R0, #0]
CMP	R0, #79
IT	EQ
BEQ	L_mbus_reset_meters_list109
;mbus_hw.c,515 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_reset_meters_list
L_mbus_reset_meters_list109:
;mbus_hw.c,517 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,518 :: 		}
L_end_mbus_reset_meters_list:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _mbus_reset_meters_list
_mbus_run_bootloader:
;mbus_hw.c,520 :: 		status_t mbus_run_bootloader( void )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mbus_hw.c,522 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,526 :: 		mbus_hal_write_text( RUN_BOOTLOADER );          /**< Runs the Bootloader */
MOVW	R0, #lo_addr(?lstr6_mbus_hw+0)
MOVT	R0, #hi_addr(?lstr6_mbus_hw+0)
BL	_mbus_hal_write_text+0
;mbus_hw.c,527 :: 		mbus_hal_write( creturn );                      /**< Carriage Return */
MOVW	R0, #lo_addr(mbus_hw_creturn+0)
MOVT	R0, #hi_addr(mbus_hw_creturn+0)
LDRB	R0, [R0, #0]
BL	_mbus_hal_write+0
;mbus_hw.c,529 :: 		while ( !response_finished );
L_mbus_run_bootloader110:
MOVW	R0, #lo_addr(mbus_hw_response_finished+0)
MOVT	R0, #hi_addr(mbus_hw_response_finished+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_mbus_run_bootloader111
IT	AL
BAL	L_mbus_run_bootloader110
L_mbus_run_bootloader111:
;mbus_hw.c,531 :: 		if ( rx_buffer[0] != 'O' )
MOVW	R0, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R0, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R0, [R0, #0]
CMP	R0, #79
IT	EQ
BEQ	L_mbus_run_bootloader112
;mbus_hw.c,532 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_run_bootloader
L_mbus_run_bootloader112:
;mbus_hw.c,534 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,535 :: 		}
L_end_mbus_run_bootloader:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _mbus_run_bootloader
_mbus_set_date_time:
;mbus_hw.c,537 :: 		status_t mbus_set_date_time( date_time_t *date )
; date start address is: 0 (R0)
SUB	SP, SP, #44
STR	LR, [SP, #0]
MOV	R7, R0
; date end address is: 0 (R0)
; date start address is: 28 (R7)
;mbus_hw.c,539 :: 		uint8_t buffer[20] = { 0 };
ADD	R11, SP, #4
ADD	R10, R11, #40
MOVW	R12, #lo_addr(?ICSmbus_set_date_time_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_date_time_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,540 :: 		uint8_t temp_buffer[20] = { 0 };
;mbus_hw.c,543 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,544 :: 		strncat( buffer, SET_DATE_TIME, 5 );
MOVW	R2, #lo_addr(?lstr7_mbus_hw+0)
MOVT	R2, #hi_addr(?lstr7_mbus_hw+0)
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
MOVS	R2, #5
SXTH	R2, R2
BL	_strncat+0
;mbus_hw.c,545 :: 		status = set_time_buffer( date, temp_buffer );
ADD	R1, SP, #24
MOV	R0, R7
; date end address is: 28 (R7)
BL	mbus_hw_set_time_buffer+0
;mbus_hw.c,547 :: 		if ( status == ERROR )                          /**< Check if date was invalid */
CMP	R0, #2
IT	NE
BNE	L_mbus_set_date_time113
;mbus_hw.c,548 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_date_time
L_mbus_set_date_time113:
;mbus_hw.c,550 :: 		strcat( buffer, temp_buffer );
ADD	R2, SP, #24
ADD	R1, SP, #4
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,553 :: 		mbus_hal_write_text( buffer );
ADD	R1, SP, #4
MOV	R0, R1
BL	_mbus_hal_write_text+0
;mbus_hw.c,554 :: 		mbus_hal_write( creturn );                    /**< Carriage Return */
MOVW	R1, #lo_addr(mbus_hw_creturn+0)
MOVT	R1, #hi_addr(mbus_hw_creturn+0)
LDRB	R1, [R1, #0]
UXTB	R0, R1
BL	_mbus_hal_write+0
;mbus_hw.c,556 :: 		while ( !response_finished );
L_mbus_set_date_time114:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_date_time115
IT	AL
BAL	L_mbus_set_date_time114
L_mbus_set_date_time115:
;mbus_hw.c,558 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_date_time116
;mbus_hw.c,559 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_date_time
L_mbus_set_date_time116:
;mbus_hw.c,561 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,562 :: 		}
L_end_mbus_set_date_time:
LDR	LR, [SP, #0]
ADD	SP, SP, #44
BX	LR
; end of _mbus_set_date_time
_mbus_get_date_time:
;mbus_hw.c,563 :: 		status_t mbus_get_date_time( date_time_t *date )
; date start address is: 0 (R0)
SUB	SP, SP, #44
STR	LR, [SP, #0]
; date end address is: 0 (R0)
; date start address is: 0 (R0)
;mbus_hw.c,566 :: 		char tmp[3] = { 0, 0, 0 };
ADD	R11, SP, #8
ADD	R10, R11, #23
MOVW	R12, #lo_addr(?ICSmbus_get_date_time_tmp_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_date_time_tmp_L0+0)
BL	___CC2DW+0
;mbus_hw.c,567 :: 		uint8_t i = 0;
;mbus_hw.c,568 :: 		uint8_t temp_buffer[20] = { 0 };
;mbus_hw.c,570 :: 		reset_flags_buffers();
STR	R0, [SP, #4]
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,573 :: 		mbus_hal_write_text( GET_DATE_TIME );           /**< Gets the Date and Time */
MOVW	R1, #lo_addr(?lstr8_mbus_hw+0)
MOVT	R1, #hi_addr(?lstr8_mbus_hw+0)
MOV	R0, R1
BL	_mbus_hal_write_text+0
;mbus_hw.c,574 :: 		mbus_hal_write( creturn );                      /**< Carriage Return */
MOVW	R1, #lo_addr(mbus_hw_creturn+0)
MOVT	R1, #hi_addr(mbus_hw_creturn+0)
LDRB	R1, [R1, #0]
UXTB	R0, R1
BL	_mbus_hal_write+0
; date end address is: 0 (R0)
LDR	R0, [SP, #4]
MOV	R7, R0
;mbus_hw.c,576 :: 		while ( !response_finished );
L_mbus_get_date_time117:
; date start address is: 28 (R7)
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_date_time118
IT	AL
BAL	L_mbus_get_date_time117
L_mbus_get_date_time118:
;mbus_hw.c,578 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_get_date_time119
; date end address is: 28 (R7)
;mbus_hw.c,579 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_get_date_time
L_mbus_get_date_time119:
;mbus_hw.c,581 :: 		memcpy( temp_buffer, rx_buffer, rx_buffer_cnt );
; date start address is: 28 (R7)
MOVW	R1, #lo_addr(mbus_hw_rx_buffer_cnt+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer_cnt+0)
LDRH	R2, [R1, #0]
ADD	R1, SP, #11
STR	R1, [SP, #40]
MOV	R0, R1
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
BL	_memcpy+0
;mbus_hw.c,583 :: 		tmp[0] = temp_buffer[0];                        /**< Month */
ADD	R3, SP, #8
STR	R3, [SP, #36]
ADD	R1, SP, #11
LDRB	R1, [R1, #0]
STRB	R1, [R3, #0]
;mbus_hw.c,584 :: 		tmp[1] = temp_buffer[1];
ADDS	R2, R3, #1
LDR	R1, [SP, #40]
ADDS	R1, R1, #1
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;mbus_hw.c,585 :: 		date->month = atoi( tmp );
MOV	R1, R7
STR	R1, [SP, #32]
MOV	R0, R3
BL	_atoi+0
LDR	R1, [SP, #32]
STRB	R0, [R1, #0]
;mbus_hw.c,586 :: 		tmp[0] = temp_buffer[2];                        /**< Day */
LDR	R4, [SP, #40]
ADDS	R1, R4, #2
LDRB	R1, [R1, #0]
LDR	R3, [SP, #36]
STRB	R1, [R3, #0]
;mbus_hw.c,587 :: 		tmp[1] = temp_buffer[3];
ADDS	R2, R3, #1
ADDS	R1, R4, #3
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;mbus_hw.c,588 :: 		date->day = atoi( tmp );
ADDS	R1, R7, #1
STR	R1, [SP, #32]
MOV	R0, R3
BL	_atoi+0
LDR	R1, [SP, #32]
STRB	R0, [R1, #0]
;mbus_hw.c,589 :: 		tmp[0] = temp_buffer[4];                        /**< Hour */
LDR	R4, [SP, #40]
ADDS	R1, R4, #4
LDRB	R1, [R1, #0]
LDR	R3, [SP, #36]
STRB	R1, [R3, #0]
;mbus_hw.c,590 :: 		tmp[1] = temp_buffer[5];
ADDS	R2, R3, #1
ADDS	R1, R4, #5
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;mbus_hw.c,591 :: 		date->hour = atoi( tmp );
ADDS	R1, R7, #2
STR	R1, [SP, #32]
MOV	R0, R3
BL	_atoi+0
LDR	R1, [SP, #32]
STRB	R0, [R1, #0]
;mbus_hw.c,592 :: 		tmp[0] = temp_buffer[6];                        /**< Minute */
LDR	R4, [SP, #40]
ADDS	R1, R4, #6
LDRB	R1, [R1, #0]
LDR	R3, [SP, #36]
STRB	R1, [R3, #0]
;mbus_hw.c,593 :: 		tmp[1] = temp_buffer[7];
ADDS	R2, R3, #1
ADDS	R1, R4, #7
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;mbus_hw.c,594 :: 		date->minute = atoi( tmp );
ADDS	R1, R7, #3
STR	R1, [SP, #32]
MOV	R0, R3
BL	_atoi+0
LDR	R1, [SP, #32]
STRB	R0, [R1, #0]
;mbus_hw.c,595 :: 		tmp[0] = temp_buffer[8];                        /**< Year */
LDR	R4, [SP, #40]
ADDW	R1, R4, #8
LDRB	R1, [R1, #0]
LDR	R3, [SP, #36]
STRB	R1, [R3, #0]
;mbus_hw.c,596 :: 		tmp[1] = temp_buffer[9];
ADDS	R2, R3, #1
ADDW	R1, R4, #9
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;mbus_hw.c,597 :: 		date->year = atoi( tmp );
ADDS	R1, R7, #4
STR	R1, [SP, #32]
MOV	R0, R3
BL	_atoi+0
LDR	R1, [SP, #32]
STRB	R0, [R1, #0]
;mbus_hw.c,598 :: 		tmp[0] = temp_buffer[10];                       /**< Second */
LDR	R4, [SP, #40]
ADDW	R1, R4, #10
LDRB	R1, [R1, #0]
LDR	R3, [SP, #36]
STRB	R1, [R3, #0]
;mbus_hw.c,599 :: 		tmp[1] = temp_buffer[11];
ADDS	R2, R3, #1
ADDW	R1, R4, #11
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
;mbus_hw.c,600 :: 		date->second = atoi( tmp );
ADDS	R1, R7, #5
; date end address is: 28 (R7)
STR	R1, [SP, #32]
MOV	R0, R3
BL	_atoi+0
LDR	R1, [SP, #32]
STRB	R0, [R1, #0]
;mbus_hw.c,602 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,603 :: 		}
L_end_mbus_get_date_time:
LDR	LR, [SP, #0]
ADD	SP, SP, #44
BX	LR
; end of _mbus_get_date_time
_mbus_set_cont_modulated_carrier:
;mbus_hw.c,605 :: 		status_t mbus_set_cont_modulated_carrier( void )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mbus_hw.c,607 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,608 :: 		mbus_hal_write_text( CONT_MODE_0 );             /**< Sets Coninuous Modulated Carrier Mode */
MOVW	R0, #lo_addr(?lstr9_mbus_hw+0)
MOVT	R0, #hi_addr(?lstr9_mbus_hw+0)
BL	_mbus_hal_write_text+0
;mbus_hw.c,609 :: 		mbus_hal_write( creturn );                      /**< Carriage Return */
MOVW	R0, #lo_addr(mbus_hw_creturn+0)
MOVT	R0, #hi_addr(mbus_hw_creturn+0)
LDRB	R0, [R0, #0]
BL	_mbus_hal_write+0
;mbus_hw.c,611 :: 		while ( !response_finished );
L_mbus_set_cont_modulated_carrier120:
MOVW	R0, #lo_addr(mbus_hw_response_finished+0)
MOVT	R0, #hi_addr(mbus_hw_response_finished+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_mbus_set_cont_modulated_carrier121
IT	AL
BAL	L_mbus_set_cont_modulated_carrier120
L_mbus_set_cont_modulated_carrier121:
;mbus_hw.c,613 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R0, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R0, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R0, [R0, #0]
CMP	R0, #69
IT	NE
BNE	L_mbus_set_cont_modulated_carrier122
;mbus_hw.c,614 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_cont_modulated_carrier
L_mbus_set_cont_modulated_carrier122:
;mbus_hw.c,616 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,617 :: 		}
L_end_mbus_set_cont_modulated_carrier:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _mbus_set_cont_modulated_carrier
_mbus_set_pure_carrier_trans:
;mbus_hw.c,619 :: 		status_t mbus_set_pure_carrier_trans( void )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mbus_hw.c,621 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,622 :: 		mbus_hal_write_text( CONT_MODE_1 );             /**< Sets Coninuous Modulated Carrier Mode */
MOVW	R0, #lo_addr(?lstr10_mbus_hw+0)
MOVT	R0, #hi_addr(?lstr10_mbus_hw+0)
BL	_mbus_hal_write_text+0
;mbus_hw.c,623 :: 		mbus_hal_write( creturn );                      /**< Carriage Return */
MOVW	R0, #lo_addr(mbus_hw_creturn+0)
MOVT	R0, #hi_addr(mbus_hw_creturn+0)
LDRB	R0, [R0, #0]
BL	_mbus_hal_write+0
;mbus_hw.c,625 :: 		while ( !response_finished );
L_mbus_set_pure_carrier_trans123:
MOVW	R0, #lo_addr(mbus_hw_response_finished+0)
MOVT	R0, #hi_addr(mbus_hw_response_finished+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_mbus_set_pure_carrier_trans124
IT	AL
BAL	L_mbus_set_pure_carrier_trans123
L_mbus_set_pure_carrier_trans124:
;mbus_hw.c,627 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R0, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R0, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R0, [R0, #0]
CMP	R0, #69
IT	NE
BNE	L_mbus_set_pure_carrier_trans125
;mbus_hw.c,628 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_pure_carrier_trans
L_mbus_set_pure_carrier_trans125:
;mbus_hw.c,630 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,631 :: 		}
L_end_mbus_set_pure_carrier_trans:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _mbus_set_pure_carrier_trans
_mbus_set_cont_modulated_carrier_random:
;mbus_hw.c,633 :: 		status_t mbus_set_cont_modulated_carrier_random( void )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mbus_hw.c,635 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,636 :: 		mbus_hal_write_text( CONT_MODE_3 );             /**< Sets Coninuous Modulated Carrier Mode ( random ) */
MOVW	R0, #lo_addr(?lstr11_mbus_hw+0)
MOVT	R0, #hi_addr(?lstr11_mbus_hw+0)
BL	_mbus_hal_write_text+0
;mbus_hw.c,637 :: 		mbus_hal_write( creturn );                      /**< Carriage Return */
MOVW	R0, #lo_addr(mbus_hw_creturn+0)
MOVT	R0, #hi_addr(mbus_hw_creturn+0)
LDRB	R0, [R0, #0]
BL	_mbus_hal_write+0
;mbus_hw.c,639 :: 		while ( !response_finished );
L_mbus_set_cont_modulated_carrier_random126:
MOVW	R0, #lo_addr(mbus_hw_response_finished+0)
MOVT	R0, #hi_addr(mbus_hw_response_finished+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_mbus_set_cont_modulated_carrier_random127
IT	AL
BAL	L_mbus_set_cont_modulated_carrier_random126
L_mbus_set_cont_modulated_carrier_random127:
;mbus_hw.c,641 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R0, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R0, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R0, [R0, #0]
CMP	R0, #69
IT	NE
BNE	L_mbus_set_cont_modulated_carrier_random128
;mbus_hw.c,642 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_cont_modulated_carrier_random
L_mbus_set_cont_modulated_carrier_random128:
;mbus_hw.c,644 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,645 :: 		}
L_end_mbus_set_cont_modulated_carrier_random:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _mbus_set_cont_modulated_carrier_random
_mbus_send_frame:
;mbus_hw.c,647 :: 		status_t mbus_send_frame( transmit_frame_t *transmit_frame, uint16_t data_len )
; i start address is: 16 (R4)
; transmit_frame start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mbus_hw.c,649 :: 		uint8_t i = 0;
;mbus_hw.c,647 :: 		status_t mbus_send_frame( transmit_frame_t *transmit_frame, uint16_t data_len )
;mbus_hw.c,649 :: 		uint8_t i = 0;
;mbus_hw.c,647 :: 		status_t mbus_send_frame( transmit_frame_t *transmit_frame, uint16_t data_len )
; i end address is: 16 (R4)
; transmit_frame end address is: 0 (R0)
; transmit_frame start address is: 0 (R0)
;mbus_hw.c,649 :: 		uint8_t i = 0;
; i start address is: 16 (R4)
MOVS	R4, #0
;mbus_hw.c,650 :: 		uint8_t k = 0;
; k start address is: 4 (R1)
MOVS	R1, #0
;mbus_hw.c,652 :: 		if ( transmit_frame_format.length_field )               /**< In the case of this library, to send a frame a length field is required */
MOVW	R2, #lo_addr(mbus_hw_transmit_frame_format+0)
MOVT	R2, #hi_addr(mbus_hw_transmit_frame_format+0)
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L__mbus_send_frame539
;mbus_hw.c,653 :: 		tx_buffer[i++] = transmit_frame->length_field;      /**< Because no timeout is implemented */
MOVW	R2, #lo_addr(mbus_hw_tx_buffer+0)
MOVT	R2, #hi_addr(mbus_hw_tx_buffer+0)
ADDS	R3, R2, R4
LDRB	R2, [R0, #0]
STRB	R2, [R3, #0]
ADDS	R4, R4, #1
UXTB	R4, R4
; i end address is: 16 (R4)
IT	AL
BAL	L_mbus_send_frame129
L__mbus_send_frame539:
;mbus_hw.c,652 :: 		if ( transmit_frame_format.length_field )               /**< In the case of this library, to send a frame a length field is required */
;mbus_hw.c,653 :: 		tx_buffer[i++] = transmit_frame->length_field;      /**< Because no timeout is implemented */
L_mbus_send_frame129:
;mbus_hw.c,654 :: 		if ( transmit_frame_format.c_field )
; i start address is: 16 (R4)
MOVW	R2, #lo_addr(mbus_hw_transmit_frame_format+1)
MOVT	R2, #hi_addr(mbus_hw_transmit_frame_format+1)
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L__mbus_send_frame540
;mbus_hw.c,655 :: 		tx_buffer[i++] = transmit_frame->c_field;
MOVW	R2, #lo_addr(mbus_hw_tx_buffer+0)
MOVT	R2, #hi_addr(mbus_hw_tx_buffer+0)
ADDS	R3, R2, R4
ADDS	R2, R0, #1
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
ADDS	R4, R4, #1
UXTB	R4, R4
; i end address is: 16 (R4)
IT	AL
BAL	L_mbus_send_frame130
L__mbus_send_frame540:
;mbus_hw.c,654 :: 		if ( transmit_frame_format.c_field )
;mbus_hw.c,655 :: 		tx_buffer[i++] = transmit_frame->c_field;
L_mbus_send_frame130:
;mbus_hw.c,656 :: 		if ( transmit_frame_format.m_field )
; i start address is: 16 (R4)
MOVW	R2, #lo_addr(mbus_hw_transmit_frame_format+2)
MOVT	R2, #hi_addr(mbus_hw_transmit_frame_format+2)
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L__mbus_send_frame541
;mbus_hw.c,658 :: 		tx_buffer[i++] = transmit_frame->m_field[0];
MOVW	R2, #lo_addr(mbus_hw_tx_buffer+0)
MOVT	R2, #hi_addr(mbus_hw_tx_buffer+0)
ADDS	R3, R2, R4
ADDS	R2, R0, #2
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
ADDS	R3, R4, #1
UXTB	R3, R3
UXTB	R4, R3
;mbus_hw.c,659 :: 		tx_buffer[i++] = transmit_frame->m_field[1];
MOVW	R2, #lo_addr(mbus_hw_tx_buffer+0)
MOVT	R2, #hi_addr(mbus_hw_tx_buffer+0)
ADDS	R3, R2, R3
ADDS	R2, R0, #2
ADDS	R2, R2, #1
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
ADDS	R4, R4, #1
UXTB	R4, R4
; i end address is: 16 (R4)
;mbus_hw.c,660 :: 		}
IT	AL
BAL	L_mbus_send_frame131
L__mbus_send_frame541:
;mbus_hw.c,656 :: 		if ( transmit_frame_format.m_field )
;mbus_hw.c,660 :: 		}
L_mbus_send_frame131:
;mbus_hw.c,661 :: 		if ( transmit_frame_format.a_field )
; i start address is: 16 (R4)
MOVW	R2, #lo_addr(mbus_hw_transmit_frame_format+3)
MOVT	R2, #hi_addr(mbus_hw_transmit_frame_format+3)
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L__mbus_send_frame542
;mbus_hw.c,663 :: 		tx_buffer[i++] = transmit_frame->a_field[0];
MOVW	R2, #lo_addr(mbus_hw_tx_buffer+0)
MOVT	R2, #hi_addr(mbus_hw_tx_buffer+0)
ADDS	R3, R2, R4
ADDS	R2, R0, #4
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
ADDS	R3, R4, #1
UXTB	R3, R3
UXTB	R4, R3
;mbus_hw.c,664 :: 		tx_buffer[i++] = transmit_frame->a_field[1];
MOVW	R2, #lo_addr(mbus_hw_tx_buffer+0)
MOVT	R2, #hi_addr(mbus_hw_tx_buffer+0)
ADDS	R3, R2, R3
ADDS	R2, R0, #4
ADDS	R2, R2, #1
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
ADDS	R3, R4, #1
UXTB	R3, R3
UXTB	R4, R3
;mbus_hw.c,665 :: 		tx_buffer[i++] = transmit_frame->a_field[2];
MOVW	R2, #lo_addr(mbus_hw_tx_buffer+0)
MOVT	R2, #hi_addr(mbus_hw_tx_buffer+0)
ADDS	R3, R2, R3
ADDS	R2, R0, #4
ADDS	R2, R2, #2
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
ADDS	R3, R4, #1
UXTB	R3, R3
UXTB	R4, R3
;mbus_hw.c,666 :: 		tx_buffer[i++] = transmit_frame->a_field[3];
MOVW	R2, #lo_addr(mbus_hw_tx_buffer+0)
MOVT	R2, #hi_addr(mbus_hw_tx_buffer+0)
ADDS	R3, R2, R3
ADDS	R2, R0, #4
ADDS	R2, R2, #3
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
ADDS	R3, R4, #1
UXTB	R3, R3
UXTB	R4, R3
;mbus_hw.c,667 :: 		tx_buffer[i++] = transmit_frame->a_field[4];
MOVW	R2, #lo_addr(mbus_hw_tx_buffer+0)
MOVT	R2, #hi_addr(mbus_hw_tx_buffer+0)
ADDS	R3, R2, R3
ADDS	R2, R0, #4
ADDS	R2, R2, #4
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
ADDS	R3, R4, #1
UXTB	R3, R3
UXTB	R4, R3
;mbus_hw.c,668 :: 		tx_buffer[i++] = transmit_frame->a_field[5];
MOVW	R2, #lo_addr(mbus_hw_tx_buffer+0)
MOVT	R2, #hi_addr(mbus_hw_tx_buffer+0)
ADDS	R3, R2, R3
ADDS	R2, R0, #4
ADDS	R2, R2, #5
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
ADDS	R4, R4, #1
UXTB	R4, R4
; i end address is: 16 (R4)
;mbus_hw.c,669 :: 		}
IT	AL
BAL	L_mbus_send_frame132
L__mbus_send_frame542:
;mbus_hw.c,661 :: 		if ( transmit_frame_format.a_field )
;mbus_hw.c,669 :: 		}
L_mbus_send_frame132:
;mbus_hw.c,670 :: 		if ( transmit_frame_format.ci_field )
; i start address is: 16 (R4)
MOVW	R2, #lo_addr(mbus_hw_transmit_frame_format+4)
MOVT	R2, #hi_addr(mbus_hw_transmit_frame_format+4)
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L__mbus_send_frame543
;mbus_hw.c,671 :: 		tx_buffer[i++] = transmit_frame->ci_field;
MOVW	R2, #lo_addr(mbus_hw_tx_buffer+0)
MOVT	R2, #hi_addr(mbus_hw_tx_buffer+0)
ADDS	R3, R2, R4
ADDW	R2, R0, #10
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
ADDS	R2, R4, #1
; i end address is: 16 (R4)
; i start address is: 12 (R3)
UXTB	R3, R2
; i end address is: 12 (R3)
UXTB	R4, R3
IT	AL
BAL	L_mbus_send_frame133
L__mbus_send_frame543:
;mbus_hw.c,670 :: 		if ( transmit_frame_format.ci_field )
;mbus_hw.c,671 :: 		tx_buffer[i++] = transmit_frame->ci_field;
L_mbus_send_frame133:
;mbus_hw.c,672 :: 		while ( k < transmit_frame->length_field )
; i start address is: 16 (R4)
; transmit_frame end address is: 0 (R0)
; i end address is: 16 (R4)
; k end address is: 4 (R1)
L_mbus_send_frame134:
; i start address is: 16 (R4)
; k start address is: 4 (R1)
; transmit_frame start address is: 0 (R0)
LDRB	R2, [R0, #0]
CMP	R1, R2
IT	CS
BCS	L_mbus_send_frame135
;mbus_hw.c,673 :: 		tx_buffer[i++] = transmit_frame->data_field[k++];
MOVW	R2, #lo_addr(mbus_hw_tx_buffer+0)
MOVT	R2, #hi_addr(mbus_hw_tx_buffer+0)
ADDS	R3, R2, R4
ADDW	R2, R0, #11
ADDS	R2, R2, R1
LDRB	R2, [R2, #0]
STRB	R2, [R3, #0]
ADDS	R4, R4, #1
UXTB	R4, R4
ADDS	R1, R1, #1
UXTB	R1, R1
; transmit_frame end address is: 0 (R0)
; i end address is: 16 (R4)
; k end address is: 4 (R1)
IT	AL
BAL	L_mbus_send_frame134
L_mbus_send_frame135:
;mbus_hw.c,675 :: 		mbus_hal_write_text( tx_buffer );
MOVW	R0, #lo_addr(mbus_hw_tx_buffer+0)
MOVT	R0, #hi_addr(mbus_hw_tx_buffer+0)
BL	_mbus_hal_write_text+0
;mbus_hw.c,676 :: 		}
L_end_mbus_send_frame:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _mbus_send_frame
_mbus_receive_frame:
;mbus_hw.c,678 :: 		status_t mbus_receive_frame( receive_frame_t *receive_frame )
; receive_frame start address is: 0 (R0)
; receive_frame end address is: 0 (R0)
; receive_frame start address is: 0 (R0)
;mbus_hw.c,680 :: 		uint8_t i = 0;
; i start address is: 8 (R2)
MOVS	R2, #0
;mbus_hw.c,681 :: 		uint8_t k = 0;
;mbus_hw.c,682 :: 		uint16_t remaining = 0;
; remaining start address is: 16 (R4)
MOVW	R4, #0
;mbus_hw.c,685 :: 		if ( receive_frame_format.wake_up_field )
MOVW	R1, #lo_addr(mbus_hw_receive_frame_format+0)
MOVT	R1, #hi_addr(mbus_hw_receive_frame_format+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L__mbus_receive_frame544
;mbus_hw.c,686 :: 		i++;                                                /** Wake up pin NC */
ADDS	R5, R2, #1
UXTB	R5, R5
; i end address is: 8 (R2)
; i start address is: 20 (R5)
; i end address is: 20 (R5)
IT	AL
BAL	L_mbus_receive_frame136
L__mbus_receive_frame544:
;mbus_hw.c,685 :: 		if ( receive_frame_format.wake_up_field )
UXTB	R5, R2
;mbus_hw.c,686 :: 		i++;                                                /** Wake up pin NC */
L_mbus_receive_frame136:
;mbus_hw.c,687 :: 		if ( receive_frame_format.length_field )
; i start address is: 20 (R5)
MOVW	R1, #lo_addr(mbus_hw_receive_frame_format+1)
MOVT	R1, #hi_addr(mbus_hw_receive_frame_format+1)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L__mbus_receive_frame545
;mbus_hw.c,688 :: 		receive_frame->length_field = rx_buffer[i++];
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
ADDS	R1, R1, R5
LDRB	R1, [R1, #0]
STRB	R1, [R0, #0]
ADDS	R5, R5, #1
UXTB	R5, R5
; i end address is: 20 (R5)
IT	AL
BAL	L_mbus_receive_frame137
L__mbus_receive_frame545:
;mbus_hw.c,687 :: 		if ( receive_frame_format.length_field )
;mbus_hw.c,688 :: 		receive_frame->length_field = rx_buffer[i++];
L_mbus_receive_frame137:
;mbus_hw.c,689 :: 		if ( receive_frame_format.c_field )
; i start address is: 20 (R5)
MOVW	R1, #lo_addr(mbus_hw_receive_frame_format+2)
MOVT	R1, #hi_addr(mbus_hw_receive_frame_format+2)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L__mbus_receive_frame546
;mbus_hw.c,690 :: 		receive_frame->c_field = rx_buffer[i++];
ADDS	R2, R0, #1
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
ADDS	R1, R1, R5
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
ADDS	R5, R5, #1
UXTB	R5, R5
; i end address is: 20 (R5)
IT	AL
BAL	L_mbus_receive_frame138
L__mbus_receive_frame546:
;mbus_hw.c,689 :: 		if ( receive_frame_format.c_field )
;mbus_hw.c,690 :: 		receive_frame->c_field = rx_buffer[i++];
L_mbus_receive_frame138:
;mbus_hw.c,691 :: 		if ( receive_frame_format.m_field )
; i start address is: 20 (R5)
MOVW	R1, #lo_addr(mbus_hw_receive_frame_format+3)
MOVT	R1, #hi_addr(mbus_hw_receive_frame_format+3)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L__mbus_receive_frame547
;mbus_hw.c,693 :: 		receive_frame->m_field[0] = rx_buffer[i++];
ADDS	R2, R0, #2
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
ADDS	R1, R1, R5
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
ADDS	R3, R5, #1
UXTB	R3, R3
UXTB	R5, R3
;mbus_hw.c,694 :: 		receive_frame->m_field[1] = rx_buffer[i++];
ADDS	R1, R0, #2
ADDS	R2, R1, #1
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
ADDS	R1, R1, R3
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
ADDS	R5, R5, #1
UXTB	R5, R5
; i end address is: 20 (R5)
;mbus_hw.c,695 :: 		}
IT	AL
BAL	L_mbus_receive_frame139
L__mbus_receive_frame547:
;mbus_hw.c,691 :: 		if ( receive_frame_format.m_field )
;mbus_hw.c,695 :: 		}
L_mbus_receive_frame139:
;mbus_hw.c,696 :: 		if ( receive_frame_format.a_field )
; i start address is: 20 (R5)
MOVW	R1, #lo_addr(mbus_hw_receive_frame_format+4)
MOVT	R1, #hi_addr(mbus_hw_receive_frame_format+4)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L__mbus_receive_frame548
;mbus_hw.c,698 :: 		receive_frame->a_field[0] = rx_buffer[i++];
ADDS	R2, R0, #4
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
ADDS	R1, R1, R5
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
ADDS	R3, R5, #1
UXTB	R3, R3
UXTB	R5, R3
;mbus_hw.c,699 :: 		receive_frame->a_field[1] = rx_buffer[i++];
ADDS	R1, R0, #4
ADDS	R2, R1, #1
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
ADDS	R1, R1, R3
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
ADDS	R3, R5, #1
UXTB	R3, R3
UXTB	R5, R3
;mbus_hw.c,700 :: 		receive_frame->a_field[2] = rx_buffer[i++];
ADDS	R1, R0, #4
ADDS	R2, R1, #2
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
ADDS	R1, R1, R3
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
ADDS	R3, R5, #1
UXTB	R3, R3
UXTB	R5, R3
;mbus_hw.c,701 :: 		receive_frame->a_field[3] = rx_buffer[i++];
ADDS	R1, R0, #4
ADDS	R2, R1, #3
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
ADDS	R1, R1, R3
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
ADDS	R3, R5, #1
UXTB	R3, R3
UXTB	R5, R3
;mbus_hw.c,702 :: 		receive_frame->a_field[4] = rx_buffer[i++];
ADDS	R1, R0, #4
ADDS	R2, R1, #4
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
ADDS	R1, R1, R3
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
ADDS	R3, R5, #1
UXTB	R3, R3
UXTB	R5, R3
;mbus_hw.c,703 :: 		receive_frame->a_field[5] = rx_buffer[i++];
ADDS	R1, R0, #4
ADDS	R2, R1, #5
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
ADDS	R1, R1, R3
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
ADDS	R3, R5, #1
UXTB	R3, R3
; i end address is: 20 (R5)
; i start address is: 12 (R3)
; i end address is: 12 (R3)
;mbus_hw.c,704 :: 		}
IT	AL
BAL	L_mbus_receive_frame140
L__mbus_receive_frame548:
;mbus_hw.c,696 :: 		if ( receive_frame_format.a_field )
UXTB	R3, R5
;mbus_hw.c,704 :: 		}
L_mbus_receive_frame140:
;mbus_hw.c,705 :: 		if ( receive_frame_format.ci_field )
; i start address is: 12 (R3)
MOVW	R1, #lo_addr(mbus_hw_receive_frame_format+5)
MOVT	R1, #hi_addr(mbus_hw_receive_frame_format+5)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L__mbus_receive_frame549
;mbus_hw.c,706 :: 		receive_frame->ci_field = rx_buffer[i++];
ADDW	R2, R0, #10
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
ADDS	R1, R1, R3
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
ADDS	R2, R3, #1
UXTB	R2, R2
; i end address is: 12 (R3)
; i start address is: 8 (R2)
; i end address is: 8 (R2)
IT	AL
BAL	L_mbus_receive_frame141
L__mbus_receive_frame549:
;mbus_hw.c,705 :: 		if ( receive_frame_format.ci_field )
UXTB	R2, R3
;mbus_hw.c,706 :: 		receive_frame->ci_field = rx_buffer[i++];
L_mbus_receive_frame141:
;mbus_hw.c,712 :: 		k = 0;
; i start address is: 8 (R2)
; k start address is: 12 (R3)
MOVS	R3, #0
;mbus_hw.c,713 :: 		if ( receive_frame_format.lqi_field )           /**< Check to see if the lqi, rssi, or freq_offset fields are used */
MOVW	R1, #lo_addr(mbus_hw_receive_frame_format+6)
MOVT	R1, #hi_addr(mbus_hw_receive_frame_format+6)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L__mbus_receive_frame550
;mbus_hw.c,714 :: 		remaining++;                                /**< If they are, Subtract them from the length field when grabbing data */
ADDS	R4, R4, #1
UXTH	R4, R4
; remaining end address is: 16 (R4)
IT	AL
BAL	L_mbus_receive_frame142
L__mbus_receive_frame550:
;mbus_hw.c,713 :: 		if ( receive_frame_format.lqi_field )           /**< Check to see if the lqi, rssi, or freq_offset fields are used */
;mbus_hw.c,714 :: 		remaining++;                                /**< If they are, Subtract them from the length field when grabbing data */
L_mbus_receive_frame142:
;mbus_hw.c,715 :: 		if ( receive_frame_format.rssi_field )
; remaining start address is: 16 (R4)
MOVW	R1, #lo_addr(mbus_hw_receive_frame_format+7)
MOVT	R1, #hi_addr(mbus_hw_receive_frame_format+7)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L__mbus_receive_frame551
;mbus_hw.c,716 :: 		remaining++;
ADDS	R4, R4, #1
UXTH	R4, R4
; remaining end address is: 16 (R4)
IT	AL
BAL	L_mbus_receive_frame143
L__mbus_receive_frame551:
;mbus_hw.c,715 :: 		if ( receive_frame_format.rssi_field )
;mbus_hw.c,716 :: 		remaining++;
L_mbus_receive_frame143:
;mbus_hw.c,717 :: 		if ( receive_frame_format.freq_offset_field )
; remaining start address is: 16 (R4)
MOVW	R1, #lo_addr(mbus_hw_receive_frame_format+8)
MOVT	R1, #hi_addr(mbus_hw_receive_frame_format+8)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L__mbus_receive_frame552
;mbus_hw.c,718 :: 		remaining++;
ADDS	R1, R4, #1
UXTH	R4, R1
; remaining end address is: 16 (R4)
UXTH	R1, R4
IT	AL
BAL	L_mbus_receive_frame144
L__mbus_receive_frame552:
;mbus_hw.c,717 :: 		if ( receive_frame_format.freq_offset_field )
UXTH	R1, R4
;mbus_hw.c,718 :: 		remaining++;
L_mbus_receive_frame144:
;mbus_hw.c,719 :: 		while ( k < ( receive_frame->length_field - remaining ) )
; remaining start address is: 4 (R1)
; i end address is: 8 (R2)
; k end address is: 12 (R3)
; remaining end address is: 4 (R1)
; receive_frame end address is: 0 (R0)
UXTB	R4, R2
UXTB	R5, R3
UXTH	R3, R1
L_mbus_receive_frame145:
; remaining start address is: 12 (R3)
; k start address is: 20 (R5)
; i start address is: 16 (R4)
; receive_frame start address is: 0 (R0)
LDRB	R1, [R0, #0]
SUB	R1, R1, R3
UXTH	R1, R1
CMP	R5, R1
IT	CS
BCS	L_mbus_receive_frame146
;mbus_hw.c,720 :: 		receive_frame->data_field[k++] = rx_buffer[i++];
ADDW	R1, R0, #11
ADDS	R2, R1, R5
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
ADDS	R1, R1, R4
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
ADDS	R5, R5, #1
UXTB	R5, R5
ADDS	R4, R4, #1
UXTB	R4, R4
; remaining end address is: 12 (R3)
; k end address is: 20 (R5)
IT	AL
BAL	L_mbus_receive_frame145
L_mbus_receive_frame146:
;mbus_hw.c,721 :: 		if ( receive_frame_format.lqi_field )
MOVW	R1, #lo_addr(mbus_hw_receive_frame_format+6)
MOVT	R1, #hi_addr(mbus_hw_receive_frame_format+6)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L__mbus_receive_frame553
;mbus_hw.c,722 :: 		receive_frame->lqi_field = rx_buffer[i++];
ADD	R2, R0, #256
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
ADDS	R1, R1, R4
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
ADDS	R3, R4, #1
UXTB	R3, R3
; i end address is: 16 (R4)
; i start address is: 12 (R3)
; i end address is: 12 (R3)
IT	AL
BAL	L_mbus_receive_frame147
L__mbus_receive_frame553:
;mbus_hw.c,721 :: 		if ( receive_frame_format.lqi_field )
UXTB	R3, R4
;mbus_hw.c,722 :: 		receive_frame->lqi_field = rx_buffer[i++];
L_mbus_receive_frame147:
;mbus_hw.c,723 :: 		if ( receive_frame_format.rssi_field )
; i start address is: 12 (R3)
MOVW	R1, #lo_addr(mbus_hw_receive_frame_format+7)
MOVT	R1, #hi_addr(mbus_hw_receive_frame_format+7)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L__mbus_receive_frame554
;mbus_hw.c,724 :: 		receive_frame->rssi_field = rx_buffer[i++];
ADDW	R2, R0, #257
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
ADDS	R1, R1, R3
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
ADDS	R3, R3, #1
UXTB	R3, R3
; i end address is: 12 (R3)
IT	AL
BAL	L_mbus_receive_frame148
L__mbus_receive_frame554:
;mbus_hw.c,723 :: 		if ( receive_frame_format.rssi_field )
;mbus_hw.c,724 :: 		receive_frame->rssi_field = rx_buffer[i++];
L_mbus_receive_frame148:
;mbus_hw.c,725 :: 		if ( receive_frame_format.freq_offset_field )
; i start address is: 12 (R3)
MOVW	R1, #lo_addr(mbus_hw_receive_frame_format+8)
MOVT	R1, #hi_addr(mbus_hw_receive_frame_format+8)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_mbus_receive_frame149
;mbus_hw.c,726 :: 		receive_frame->freq_offset_field = rx_buffer[i++];
ADD	R2, R0, #258
; receive_frame end address is: 0 (R0)
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
ADDS	R1, R1, R3
; i end address is: 12 (R3)
LDRB	R1, [R1, #0]
STRB	R1, [R2, #0]
L_mbus_receive_frame149:
;mbus_hw.c,728 :: 		my_receive_flag = false;                        /**< Once frame is put together, set flag to false */
MOVS	R2, #0
MOVW	R1, #lo_addr(_my_receive_flag+0)
MOVT	R1, #hi_addr(_my_receive_flag+0)
STRB	R2, [R1, #0]
;mbus_hw.c,729 :: 		}
L_end_mbus_receive_frame:
BX	LR
; end of _mbus_receive_frame
_mbus_add_edit_meter:
;mbus_hw.c,733 :: 		encryption_type_t enc_mode, uint8_t *manufac_id )
; enc_mode start address is: 12 (R3)
; meter_address start address is: 4 (R1)
SUB	SP, SP, #20
STR	LR, [SP, #0]
STRB	R0, [SP, #12]
UXTB	R0, R3
STR	R2, [SP, #16]
; enc_mode end address is: 12 (R3)
; meter_address end address is: 4 (R1)
; meter_address start address is: 4 (R1)
; enc_mode start address is: 0 (R0)
; manufac_id start address is: 8 (R2)
LDR	R2, [SP, #20]
;mbus_hw.c,737 :: 		mbus_set_meter_address( meter_address );        /**< The order for Editing/Adding meters is set the meter address/ manufacturer id/ meter encryption key */
STR	R2, [SP, #4]
; meter_address end address is: 4 (R1)
STRB	R0, [SP, #8]
MOV	R0, R1
BL	_mbus_set_meter_address+0
LDRB	R0, [SP, #8]
LDR	R2, [SP, #4]
;mbus_hw.c,738 :: 		if ( manufac_id != NULL )                       /**< And afterwards... set the options to what you want */
CMP	R2, #0
IT	EQ
BEQ	L_mbus_add_edit_meter150
;mbus_hw.c,739 :: 		mbus_set_manufac_address( manufac_id );
STRB	R0, [SP, #4]
; manufac_id end address is: 8 (R2)
MOV	R0, R2
BL	_mbus_set_manufac_address+0
LDRB	R0, [SP, #4]
L_mbus_add_edit_meter150:
;mbus_hw.c,741 :: 		if ( enc_mode == AES_MODE )
CMP	R0, #1
IT	NE
BNE	L_mbus_add_edit_meter151
;mbus_hw.c,743 :: 		mbus_set_meter_key( encrypt_key, enc_mode );
UXTB	R1, R0
; enc_mode end address is: 0 (R0)
LDR	R0, [SP, #16]
BL	_mbus_set_meter_key+0
;mbus_hw.c,744 :: 		status = mbus_set_registered_meter_options( options | 1 );
LDRB	R4, [SP, #12]
ORR	R4, R4, #1
UXTB	R0, R4
BL	_mbus_set_registered_meter_options+0
; status start address is: 0 (R0)
;mbus_hw.c,745 :: 		}
; status end address is: 0 (R0)
IT	AL
BAL	L_mbus_add_edit_meter152
L_mbus_add_edit_meter151:
;mbus_hw.c,746 :: 		else if ( enc_mode == DES_MODE )
; enc_mode start address is: 0 (R0)
CMP	R0, #0
IT	NE
BNE	L_mbus_add_edit_meter153
;mbus_hw.c,748 :: 		mbus_set_meter_key( encrypt_key, enc_mode );
UXTB	R1, R0
; enc_mode end address is: 0 (R0)
LDR	R0, [SP, #16]
BL	_mbus_set_meter_key+0
;mbus_hw.c,749 :: 		status = mbus_set_registered_meter_options( options | 1 );
LDRB	R4, [SP, #12]
ORR	R4, R4, #1
UXTB	R0, R4
BL	_mbus_set_registered_meter_options+0
; status start address is: 0 (R0)
;mbus_hw.c,750 :: 		}
; status end address is: 0 (R0)
IT	AL
BAL	L_mbus_add_edit_meter154
L_mbus_add_edit_meter153:
;mbus_hw.c,751 :: 		else if ( enc_mode == NO_ENCRYPT )
; enc_mode start address is: 0 (R0)
CMP	R0, #2
IT	NE
BNE	L_mbus_add_edit_meter155
; enc_mode end address is: 0 (R0)
;mbus_hw.c,753 :: 		status = mbus_set_registered_meter_options( options | 1 );
LDRB	R4, [SP, #12]
ORR	R4, R4, #1
UXTB	R0, R4
BL	_mbus_set_registered_meter_options+0
; status start address is: 0 (R0)
;mbus_hw.c,754 :: 		}
IT	AL
BAL	L_mbus_add_edit_meter156
; status end address is: 0 (R0)
L_mbus_add_edit_meter155:
;mbus_hw.c,756 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_add_edit_meter
L_mbus_add_edit_meter156:
; status start address is: 0 (R0)
L_mbus_add_edit_meter154:
; status end address is: 0 (R0)
; status start address is: 0 (R0)
; status end address is: 0 (R0)
L_mbus_add_edit_meter152:
;mbus_hw.c,758 :: 		return status;
; status start address is: 0 (R0)
; status end address is: 0 (R0)
;mbus_hw.c,759 :: 		}
L_end_mbus_add_edit_meter:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_add_edit_meter
_mbus_remove_meter:
;mbus_hw.c,761 :: 		status_t mbus_remove_meter( uint8_t *meter_address )
; meter_address start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; meter_address end address is: 0 (R0)
; meter_address start address is: 0 (R0)
;mbus_hw.c,763 :: 		mbus_set_meter_address( meter_address );        /**< When the meter address field is filled with a meter address that's already registered... */
; meter_address end address is: 0 (R0)
BL	_mbus_set_meter_address+0
;mbus_hw.c,764 :: 		mbus_set_registered_meter_options( 0 );         /**< And meter options are then set to 0, the meter is removed */
MOVS	R0, #0
BL	_mbus_set_registered_meter_options+0
;mbus_hw.c,765 :: 		}
L_end_mbus_remove_meter:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _mbus_remove_meter
_mbus_get_serial_number:
;mbus_hw.c,770 :: 		status_t mbus_get_serial_number( uint8_t *serial_num )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,772 :: 		uint8_t buffer[10] = REG_READ xstr( SERIAL_NUM_REG ) REG_READ_END;
ADD	R11, SP, #4
ADD	R10, R11, #10
MOVW	R12, #lo_addr(?ICSmbus_get_serial_number_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_serial_number_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,775 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,776 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #4
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
; status start address is: 24 (R6)
UXTB	R6, R0
; status end address is: 24 (R6)
;mbus_hw.c,778 :: 		while ( !response_finished );
L_mbus_get_serial_number157:
; status start address is: 24 (R6)
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_serial_number158
IT	AL
BAL	L_mbus_get_serial_number157
L_mbus_get_serial_number158:
;mbus_hw.c,780 :: 		memcpy( serial_num, rx_buffer, rx_buffer_cnt );
MOVW	R1, #lo_addr(mbus_hw_rx_buffer_cnt+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer_cnt+0)
LDRH	R1, [R1, #0]
SXTH	R2, R1
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDR	R0, [SP, #16]
BL	_memcpy+0
;mbus_hw.c,782 :: 		return status;
UXTB	R0, R6
; status end address is: 24 (R6)
;mbus_hw.c,783 :: 		}
L_end_mbus_get_serial_number:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_serial_number
_mbus_get_mbus_mode:
;mbus_hw.c,785 :: 		status_t mbus_get_mbus_mode( uint8_t *mode )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,787 :: 		uint8_t buffer[8] = REG_READ xstr( M_BUS_MODE_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_mbus_mode_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_mbus_mode_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,788 :: 		uint8_t end = 0;
;mbus_hw.c,789 :: 		uint8_t i = 0;
;mbus_hw.c,792 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,793 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,795 :: 		while ( !response_finished );
L_mbus_get_mbus_mode159:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_mbus_mode160
IT	AL
BAL	L_mbus_get_mbus_mode159
L_mbus_get_mbus_mode160:
;mbus_hw.c,797 :: 		get_register_contents( mode );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,799 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,800 :: 		}
L_end_mbus_get_mbus_mode:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_mbus_mode
_mbus_get_serial_tx_format:
;mbus_hw.c,802 :: 		status_t mbus_get_serial_tx_format( uint8_t *format )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,804 :: 		uint8_t buffer[8] = REG_READ xstr( RX_FORMAT_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_serial_tx_format_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_serial_tx_format_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,807 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,808 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,810 :: 		while ( !response_finished );
L_mbus_get_serial_tx_format161:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_serial_tx_format162
IT	AL
BAL	L_mbus_get_serial_tx_format161
L_mbus_get_serial_tx_format162:
;mbus_hw.c,812 :: 		get_register_contents( format );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,814 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,815 :: 		}
L_end_mbus_get_serial_tx_format:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_serial_tx_format
_mbus_get_serial_rx_format:
;mbus_hw.c,817 :: 		status_t mbus_get_serial_rx_format( uint8_t *format )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,819 :: 		uint8_t buffer[8] = REG_READ xstr( TX_FORMAT_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_serial_rx_format_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_serial_rx_format_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,822 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,823 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,825 :: 		while ( !response_finished );
L_mbus_get_serial_rx_format163:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_serial_rx_format164
IT	AL
BAL	L_mbus_get_serial_rx_format163
L_mbus_get_serial_rx_format164:
;mbus_hw.c,827 :: 		get_register_contents( format );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,829 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,830 :: 		}
L_end_mbus_get_serial_rx_format:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_serial_rx_format
_mbus_get_tx_rx_pins:
;mbus_hw.c,832 :: 		status_t mbus_get_tx_rx_pins( uint8_t *pins )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,834 :: 		uint8_t buffer[8] = REG_READ xstr( RX_TX_PIN_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_tx_rx_pins_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_tx_rx_pins_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,837 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,838 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,840 :: 		while ( !response_finished );
L_mbus_get_tx_rx_pins165:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_tx_rx_pins166
IT	AL
BAL	L_mbus_get_tx_rx_pins165
L_mbus_get_tx_rx_pins166:
;mbus_hw.c,842 :: 		get_register_contents( pins );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,844 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,845 :: 		}
L_end_mbus_get_tx_rx_pins:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_tx_rx_pins
_mbus_get_estim_freq_offset:
;mbus_hw.c,847 :: 		status_t mbus_get_estim_freq_offset( uint8_t *offset )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,849 :: 		uint8_t buffer[8] = REG_READ xstr( EST_FREQ_OFFSET_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_estim_freq_offset_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_estim_freq_offset_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,852 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,853 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,855 :: 		while ( !response_finished );
L_mbus_get_estim_freq_offset167:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_estim_freq_offset168
IT	AL
BAL	L_mbus_get_estim_freq_offset167
L_mbus_get_estim_freq_offset168:
;mbus_hw.c,857 :: 		get_register_contents( offset );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,859 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,860 :: 		}
L_end_mbus_get_estim_freq_offset:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_estim_freq_offset
_mbus_get_c_field:
;mbus_hw.c,862 :: 		status_t mbus_get_c_field( uint8_t *field )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,864 :: 		uint8_t buffer[8] = REG_READ xstr( C_FIELD_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_c_field_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_c_field_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,867 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,868 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,870 :: 		while ( !response_finished );
L_mbus_get_c_field169:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_c_field170
IT	AL
BAL	L_mbus_get_c_field169
L_mbus_get_c_field170:
;mbus_hw.c,872 :: 		get_register_contents( field );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,874 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,875 :: 		}
L_end_mbus_get_c_field:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_c_field
_mbus_get_m_field_0:
;mbus_hw.c,877 :: 		status_t mbus_get_m_field_0( uint8_t *field )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,879 :: 		uint8_t buffer[8] = REG_READ xstr( M_FIELD_BYTE_0_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_m_field_0_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_m_field_0_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,882 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,883 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,885 :: 		while ( !response_finished );
L_mbus_get_m_field_0171:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_m_field_0172
IT	AL
BAL	L_mbus_get_m_field_0171
L_mbus_get_m_field_0172:
;mbus_hw.c,887 :: 		get_register_contents( field );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,889 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,890 :: 		}
L_end_mbus_get_m_field_0:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_m_field_0
_mbus_get_m_field_1:
;mbus_hw.c,892 :: 		status_t mbus_get_m_field_1( uint8_t *field )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,894 :: 		uint8_t buffer[8] = REG_READ xstr( M_FIELD_BYTE_1_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_m_field_1_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_m_field_1_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,897 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,898 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,900 :: 		while ( !response_finished );
L_mbus_get_m_field_1173:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_m_field_1174
IT	AL
BAL	L_mbus_get_m_field_1173
L_mbus_get_m_field_1174:
;mbus_hw.c,902 :: 		get_register_contents( field );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,904 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,905 :: 		}
L_end_mbus_get_m_field_1:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_m_field_1
_mbus_get_a_field_0:
;mbus_hw.c,907 :: 		status_t mbus_get_a_field_0( uint8_t *field )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,909 :: 		uint8_t buffer[8] = REG_READ xstr( A_FIELD_BYTE_0_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_a_field_0_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_a_field_0_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,912 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,913 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,915 :: 		while ( !response_finished );
L_mbus_get_a_field_0175:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_a_field_0176
IT	AL
BAL	L_mbus_get_a_field_0175
L_mbus_get_a_field_0176:
;mbus_hw.c,917 :: 		get_register_contents( field );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,919 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,920 :: 		}
L_end_mbus_get_a_field_0:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_a_field_0
_mbus_get_a_field_1:
;mbus_hw.c,922 :: 		status_t mbus_get_a_field_1( uint8_t *field )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,924 :: 		uint8_t buffer[8] = REG_READ xstr( A_FIELD_BYTE_1_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_a_field_1_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_a_field_1_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,927 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,928 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,930 :: 		while ( !response_finished );
L_mbus_get_a_field_1177:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_a_field_1178
IT	AL
BAL	L_mbus_get_a_field_1177
L_mbus_get_a_field_1178:
;mbus_hw.c,932 :: 		get_register_contents( field );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,934 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,935 :: 		}
L_end_mbus_get_a_field_1:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_a_field_1
_mbus_get_a_field_2:
;mbus_hw.c,937 :: 		status_t mbus_get_a_field_2( uint8_t *field )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,939 :: 		uint8_t buffer[8] = REG_READ xstr( A_FIELD_BYTE_2_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_a_field_2_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_a_field_2_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,942 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,943 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,945 :: 		while ( !response_finished );
L_mbus_get_a_field_2179:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_a_field_2180
IT	AL
BAL	L_mbus_get_a_field_2179
L_mbus_get_a_field_2180:
;mbus_hw.c,947 :: 		get_register_contents( field );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,949 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,950 :: 		}
L_end_mbus_get_a_field_2:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_a_field_2
_mbus_get_a_field_3:
;mbus_hw.c,952 :: 		status_t mbus_get_a_field_3( uint8_t *field )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,954 :: 		uint8_t buffer[8] = REG_READ xstr( A_FIELD_BYTE_3_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_a_field_3_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_a_field_3_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,957 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,958 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,960 :: 		while ( !response_finished );
L_mbus_get_a_field_3181:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_a_field_3182
IT	AL
BAL	L_mbus_get_a_field_3181
L_mbus_get_a_field_3182:
;mbus_hw.c,962 :: 		get_register_contents( field );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,964 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,965 :: 		}
L_end_mbus_get_a_field_3:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_a_field_3
_mbus_get_a_field_4:
;mbus_hw.c,967 :: 		status_t mbus_get_a_field_4( uint8_t *field )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,969 :: 		uint8_t buffer[8] = REG_READ xstr( A_FIELD_BYTE_4_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_a_field_4_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_a_field_4_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,972 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,973 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,975 :: 		while ( !response_finished );
L_mbus_get_a_field_4183:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_a_field_4184
IT	AL
BAL	L_mbus_get_a_field_4183
L_mbus_get_a_field_4184:
;mbus_hw.c,977 :: 		get_register_contents( field );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,979 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,980 :: 		}
L_end_mbus_get_a_field_4:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_a_field_4
_mbus_get_a_field_5:
;mbus_hw.c,982 :: 		status_t mbus_get_a_field_5( uint8_t *field )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,984 :: 		uint8_t buffer[8] = REG_READ xstr( A_FIELD_BYTE_5_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_a_field_5_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_a_field_5_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,987 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,988 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,990 :: 		while ( !response_finished );
L_mbus_get_a_field_5185:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_a_field_5186
IT	AL
BAL	L_mbus_get_a_field_5185
L_mbus_get_a_field_5186:
;mbus_hw.c,992 :: 		get_register_contents( field );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,994 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,995 :: 		}
L_end_mbus_get_a_field_5:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_a_field_5
_mbus_get_ci_field:
;mbus_hw.c,997 :: 		status_t mbus_get_ci_field( uint8_t *field )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,999 :: 		uint8_t buffer[8] = REG_READ xstr( CI_FIELD_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_ci_field_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_ci_field_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1002 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1003 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1005 :: 		while ( !response_finished );
L_mbus_get_ci_field187:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_ci_field188
IT	AL
BAL	L_mbus_get_ci_field187
L_mbus_get_ci_field188:
;mbus_hw.c,1007 :: 		get_register_contents( field );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,1009 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1010 :: 		}
L_end_mbus_get_ci_field:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_ci_field
_mbus_get_radio_channel:
;mbus_hw.c,1012 :: 		status_t mbus_get_radio_channel( uint8_t *channel )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,1014 :: 		uint8_t buffer[8] = REG_READ xstr( RADIO_CHANNEL_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_radio_channel_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_radio_channel_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1017 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1018 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1020 :: 		while ( !response_finished );
L_mbus_get_radio_channel189:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_radio_channel190
IT	AL
BAL	L_mbus_get_radio_channel189
L_mbus_get_radio_channel190:
;mbus_hw.c,1022 :: 		get_register_contents( channel );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,1024 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1025 :: 		}
L_end_mbus_get_radio_channel:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_radio_channel
_mbus_get_preamble_length:
;mbus_hw.c,1027 :: 		status_t mbus_get_preamble_length( uint8_t *length )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,1029 :: 		uint8_t buffer[8] = REG_READ xstr( PREAMBLE_LEN_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_preamble_length_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_preamble_length_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1032 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1033 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1035 :: 		while ( !response_finished );
L_mbus_get_preamble_length191:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_preamble_length192
IT	AL
BAL	L_mbus_get_preamble_length191
L_mbus_get_preamble_length192:
;mbus_hw.c,1037 :: 		get_register_contents( length );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,1039 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1040 :: 		}
L_end_mbus_get_preamble_length:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_preamble_length
_mbus_get_radio_output_power:
;mbus_hw.c,1042 :: 		status_t mbus_get_radio_output_power( uint8_t *power )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,1044 :: 		uint8_t buffer[8] = REG_READ xstr( RADIO_OUTPUT_PWR_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_radio_output_power_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_radio_output_power_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1047 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1048 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1050 :: 		while ( !response_finished );
L_mbus_get_radio_output_power193:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_radio_output_power194
IT	AL
BAL	L_mbus_get_radio_output_power193
L_mbus_get_radio_output_power194:
;mbus_hw.c,1052 :: 		get_register_contents( power );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,1054 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1055 :: 		}
L_end_mbus_get_radio_output_power:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_radio_output_power
_mbus_get_channel_plan:
;mbus_hw.c,1057 :: 		status_t mbus_get_channel_plan( uint8_t *plan )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,1059 :: 		uint8_t buffer[8] = REG_READ xstr( CHANNEL_PLAN_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_channel_plan_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_channel_plan_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1062 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1063 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1065 :: 		while ( !response_finished );
L_mbus_get_channel_plan195:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_channel_plan196
IT	AL
BAL	L_mbus_get_channel_plan195
L_mbus_get_channel_plan196:
;mbus_hw.c,1067 :: 		get_register_contents( plan );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,1069 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1070 :: 		}
L_end_mbus_get_channel_plan:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_channel_plan
_mbus_get_current_channel:
;mbus_hw.c,1072 :: 		status_t mbus_get_current_channel( uint8_t *channel )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,1074 :: 		uint8_t buffer[8] = REG_READ xstr( CURRENT_CHANNEL_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_current_channel_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_current_channel_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1077 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1078 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1080 :: 		while ( !response_finished );
L_mbus_get_current_channel197:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_current_channel198
IT	AL
BAL	L_mbus_get_current_channel197
L_mbus_get_current_channel198:
;mbus_hw.c,1082 :: 		get_register_contents( channel );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,1084 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1085 :: 		}
L_end_mbus_get_current_channel:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_current_channel
_mbus_get_radio_output_dbm:
;mbus_hw.c,1087 :: 		status_t mbus_get_radio_output_dbm( uint8_t *dbm )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,1089 :: 		uint8_t buffer[8] = REG_READ xstr( RADIO_OUTPUT_PWR_DBM_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_radio_output_dbm_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_radio_output_dbm_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1092 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1093 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1095 :: 		while ( !response_finished );
L_mbus_get_radio_output_dbm199:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_radio_output_dbm200
IT	AL
BAL	L_mbus_get_radio_output_dbm199
L_mbus_get_radio_output_dbm200:
;mbus_hw.c,1097 :: 		get_register_contents( dbm );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,1099 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1100 :: 		}
L_end_mbus_get_radio_output_dbm:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_radio_output_dbm
_mbus_get_freq_offset:
;mbus_hw.c,1102 :: 		status_t mbus_get_freq_offset( int8_t *offset )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,1104 :: 		uint8_t buffer[8] = REG_READ xstr( SET_FREQUENCY_OFFSET_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_freq_offset_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_freq_offset_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1107 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1108 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1110 :: 		while ( !response_finished );
L_mbus_get_freq_offset201:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_freq_offset202
IT	AL
BAL	L_mbus_get_freq_offset201
L_mbus_get_freq_offset202:
;mbus_hw.c,1112 :: 		get_register_contents( offset );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,1114 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1115 :: 		}
L_end_mbus_get_freq_offset:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_freq_offset
_mbus_get_preamble_word:
;mbus_hw.c,1117 :: 		status_t mbus_get_preamble_word( uint8_t *word )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,1119 :: 		uint8_t buffer[8] = REG_READ xstr( PREAMBLE_WORD_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_preamble_word_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_preamble_word_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1122 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1123 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1125 :: 		while ( !response_finished );
L_mbus_get_preamble_word203:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_preamble_word204
IT	AL
BAL	L_mbus_get_preamble_word203
L_mbus_get_preamble_word204:
;mbus_hw.c,1127 :: 		get_register_contents( word );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,1129 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1130 :: 		}
L_end_mbus_get_preamble_word:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_preamble_word
_mbus_get_serial_speed:
;mbus_hw.c,1132 :: 		status_t mbus_get_serial_speed( uint8_t *speed )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,1134 :: 		uint8_t buffer[8] = REG_READ xstr( SERIAL_SPEED_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_serial_speed_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_serial_speed_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1137 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1138 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1140 :: 		while ( !response_finished );
L_mbus_get_serial_speed205:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_serial_speed206
IT	AL
BAL	L_mbus_get_serial_speed205
L_mbus_get_serial_speed206:
;mbus_hw.c,1142 :: 		get_register_contents( speed );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,1144 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1145 :: 		}
L_end_mbus_get_serial_speed:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_serial_speed
_mbus_get_serial_timeout:
;mbus_hw.c,1147 :: 		status_t mbus_get_serial_timeout( uint8_t *timeout )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,1149 :: 		uint8_t buffer[8] = REG_READ xstr( SERIAL_TIME_OUT_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_serial_timeout_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_serial_timeout_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1152 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1153 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1155 :: 		while ( !response_finished );
L_mbus_get_serial_timeout207:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_serial_timeout208
IT	AL
BAL	L_mbus_get_serial_timeout207
L_mbus_get_serial_timeout208:
;mbus_hw.c,1157 :: 		get_register_contents( timeout );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,1159 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1160 :: 		}
L_end_mbus_get_serial_timeout:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_serial_timeout
_mbus_get_cts_management:
;mbus_hw.c,1162 :: 		status_t mbus_get_cts_management( uint8_t *cts )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,1164 :: 		uint8_t buffer[8] = REG_READ xstr( CTS_MANAGEMENT_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_cts_management_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_cts_management_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1167 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1168 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1170 :: 		while ( !response_finished );
L_mbus_get_cts_management209:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_cts_management210
IT	AL
BAL	L_mbus_get_cts_management209
L_mbus_get_cts_management210:
;mbus_hw.c,1172 :: 		get_register_contents( cts );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,1174 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1175 :: 		}
L_end_mbus_get_cts_management:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_cts_management
_mbus_get_cts_timeout:
;mbus_hw.c,1177 :: 		status_t mbus_get_cts_timeout( uint8_t *timeout )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,1179 :: 		uint8_t buffer[8] = REG_READ xstr( CTS_TIME_OUT_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_cts_timeout_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_cts_timeout_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1182 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1183 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1185 :: 		while ( !response_finished );
L_mbus_get_cts_timeout211:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_cts_timeout212
IT	AL
BAL	L_mbus_get_cts_timeout211
L_mbus_get_cts_timeout212:
;mbus_hw.c,1187 :: 		get_register_contents( timeout );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,1189 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1190 :: 		}
L_end_mbus_get_cts_timeout:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_cts_timeout
_mbus_get_wakeup_timeout:
;mbus_hw.c,1198 :: 		status_t mbus_get_wakeup_timeout( uint8_t *timeout )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,1200 :: 		uint8_t buffer[8] = REG_READ xstr( WAKE_UP_TIME_OUT_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_wakeup_timeout_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_wakeup_timeout_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1203 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1204 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1206 :: 		while ( !response_finished );
L_mbus_get_wakeup_timeout213:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_wakeup_timeout214
IT	AL
BAL	L_mbus_get_wakeup_timeout213
L_mbus_get_wakeup_timeout214:
;mbus_hw.c,1208 :: 		get_register_contents( timeout );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,1210 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1211 :: 		}
L_end_mbus_get_wakeup_timeout:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_wakeup_timeout
_mbus_get_sleep_time:
;mbus_hw.c,1213 :: 		status_t mbus_get_sleep_time( uint8_t *time )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,1215 :: 		uint8_t buffer[8] = REG_READ xstr( SLEEP_TIME_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_sleep_time_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_sleep_time_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1218 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1219 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1221 :: 		while ( !response_finished );
L_mbus_get_sleep_time215:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_sleep_time216
IT	AL
BAL	L_mbus_get_sleep_time215
L_mbus_get_sleep_time216:
;mbus_hw.c,1223 :: 		get_register_contents( time );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,1225 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1226 :: 		}
L_end_mbus_get_sleep_time:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_sleep_time
_mbus_get_rx_filter:
;mbus_hw.c,1228 :: 		status_t mbus_get_rx_filter( uint8_t *filter )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,1230 :: 		uint8_t buffer[8] = REG_READ xstr( RX_FILTER_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_rx_filter_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_rx_filter_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1233 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1234 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1236 :: 		while ( !response_finished );
L_mbus_get_rx_filter217:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_rx_filter218
IT	AL
BAL	L_mbus_get_rx_filter217
L_mbus_get_rx_filter218:
;mbus_hw.c,1238 :: 		get_register_contents( filter );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,1240 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1241 :: 		}
L_end_mbus_get_rx_filter:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_rx_filter
_mbus_get_tx_options:
;mbus_hw.c,1243 :: 		status_t mbus_get_tx_options( uint8_t *options )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,1245 :: 		uint8_t buffer[8] = REG_READ xstr( TX_OPTIONS_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_tx_options_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_tx_options_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1248 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1249 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1251 :: 		while ( !response_finished );
L_mbus_get_tx_options219:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_tx_options220
IT	AL
BAL	L_mbus_get_tx_options219
L_mbus_get_tx_options220:
;mbus_hw.c,1253 :: 		get_register_contents( options );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,1255 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1256 :: 		}
L_end_mbus_get_tx_options:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_tx_options
_mbus_get_manufac_address:
;mbus_hw.c,1258 :: 		status_t mbus_get_manufac_address( uint8_t *address )
SUB	SP, SP, #32
STR	LR, [SP, #0]
STR	R0, [SP, #28]
;mbus_hw.c,1260 :: 		uint8_t buffer[2][10] = { 0 };
ADD	R11, SP, #5
ADD	R10, R11, #20
MOVW	R12, #lo_addr(?ICSmbus_get_manufac_address_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_manufac_address_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1261 :: 		uint8_t get_buffer[8] = { 0 };
;mbus_hw.c,1264 :: 		strcat( buffer[0], REG_READ xstr( MANUFAC_ADDRESS_REG_0 ) REG_READ_END );
MOVW	R2, #lo_addr(?lstr12_mbus_hw+0)
MOVT	R2, #hi_addr(?lstr12_mbus_hw+0)
ADD	R1, SP, #5
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,1265 :: 		strcat( buffer[1], REG_READ xstr( MANUFAC_ADDRESS_REG_1 ) REG_READ_END );
MOVW	R2, #lo_addr(?lstr13_mbus_hw+0)
MOVT	R2, #hi_addr(?lstr13_mbus_hw+0)
ADD	R1, SP, #5
ADDS	R1, #10
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,1267 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1268 :: 		status = mbus_read_reg( buffer[0] );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
;mbus_hw.c,1270 :: 		while ( !response_finished );
L_mbus_get_manufac_address221:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_manufac_address222
IT	AL
BAL	L_mbus_get_manufac_address221
L_mbus_get_manufac_address222:
;mbus_hw.c,1272 :: 		get_register_contents( &address[0] );
LDR	R0, [SP, #28]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,1274 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1275 :: 		status = mbus_read_reg( buffer[1] );
ADD	R1, SP, #5
ADDS	R1, #10
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1277 :: 		while ( !response_finished );
L_mbus_get_manufac_address223:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_manufac_address224
IT	AL
BAL	L_mbus_get_manufac_address223
L_mbus_get_manufac_address224:
;mbus_hw.c,1279 :: 		get_register_contents( &address[1] );
LDR	R1, [SP, #28]
ADDS	R1, R1, #1
MOV	R0, R1
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,1281 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1283 :: 		}
L_end_mbus_get_manufac_address:
LDR	LR, [SP, #0]
ADD	SP, SP, #32
BX	LR
; end of _mbus_get_manufac_address
_mbus_get_meter_address:
;mbus_hw.c,1285 :: 		status_t mbus_get_meter_address( uint8_t *address )
SUB	SP, SP, #124
STR	LR, [SP, #0]
STR	R0, [SP, #120]
;mbus_hw.c,1287 :: 		uint8_t buffer[8][14] = { 0 };
ADD	R11, SP, #5
ADD	R10, R11, #112
MOVW	R12, #lo_addr(?ICSmbus_get_meter_address_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_meter_address_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1288 :: 		uint8_t i = 0;
;mbus_hw.c,1291 :: 		strcat( buffer[0], REG_READ xstr( METER_ADDRESS_REG_0 ) REG_READ_END );
MOVW	R2, #lo_addr(?lstr14_mbus_hw+0)
MOVT	R2, #hi_addr(?lstr14_mbus_hw+0)
ADD	R1, SP, #5
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,1292 :: 		strcat( buffer[1], REG_READ xstr( METER_ADDRESS_REG_1 ) REG_READ_END );
MOVW	R2, #lo_addr(?lstr15_mbus_hw+0)
MOVT	R2, #hi_addr(?lstr15_mbus_hw+0)
ADD	R1, SP, #5
ADDS	R1, #14
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,1293 :: 		strcat( buffer[2], REG_READ xstr( METER_ADDRESS_REG_2 ) REG_READ_END );
MOVW	R2, #lo_addr(?lstr16_mbus_hw+0)
MOVT	R2, #hi_addr(?lstr16_mbus_hw+0)
ADD	R1, SP, #5
ADDS	R1, #28
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,1294 :: 		strcat( buffer[3], REG_READ xstr( METER_ADDRESS_REG_3 ) REG_READ_END );
MOVW	R2, #lo_addr(?lstr17_mbus_hw+0)
MOVT	R2, #hi_addr(?lstr17_mbus_hw+0)
ADD	R1, SP, #5
ADDS	R1, #42
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,1295 :: 		strcat( buffer[4], REG_READ xstr( METER_ADDRESS_REG_4 ) REG_READ_END );
MOVW	R2, #lo_addr(?lstr18_mbus_hw+0)
MOVT	R2, #hi_addr(?lstr18_mbus_hw+0)
ADD	R1, SP, #5
ADDS	R1, #56
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,1296 :: 		strcat( buffer[5], REG_READ xstr( METER_ADDRESS_REG_5 ) REG_READ_END );
MOVW	R2, #lo_addr(?lstr19_mbus_hw+0)
MOVT	R2, #hi_addr(?lstr19_mbus_hw+0)
ADD	R1, SP, #5
ADDS	R1, #70
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,1298 :: 		for ( i = 0; i < 6; i++ )
MOVS	R1, #0
STRB	R1, [SP, #117]
L_mbus_get_meter_address225:
LDRB	R1, [SP, #117]
CMP	R1, #6
IT	CS
BCS	L_mbus_get_meter_address226
;mbus_hw.c,1300 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1304 :: 		status = mbus_read_reg( buffer[i] );
ADD	R3, SP, #5
LDRB	R2, [SP, #117]
MOVS	R1, #14
MULS	R1, R2, R1
ADDS	R1, R3, R1
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1306 :: 		while ( !response_finished );
L_mbus_get_meter_address228:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_meter_address229
IT	AL
BAL	L_mbus_get_meter_address228
L_mbus_get_meter_address229:
;mbus_hw.c,1308 :: 		get_register_contents( &address[i] );
LDRB	R2, [SP, #117]
LDR	R1, [SP, #120]
ADDS	R1, R1, R2
MOV	R0, R1
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,1298 :: 		for ( i = 0; i < 6; i++ )
LDRB	R1, [SP, #117]
ADDS	R1, R1, #1
STRB	R1, [SP, #117]
;mbus_hw.c,1309 :: 		}
IT	AL
BAL	L_mbus_get_meter_address225
L_mbus_get_meter_address226:
;mbus_hw.c,1311 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1312 :: 		}
L_end_mbus_get_meter_address:
LDR	LR, [SP, #0]
ADD	SP, SP, #124
BX	LR
; end of _mbus_get_meter_address
_mbus_get_meter_key:
;mbus_hw.c,1314 :: 		status_t mbus_get_meter_key( uint8_t *key, encryption_type_t type )
; type start address is: 4 (R1)
SUB	SP, SP, #236
STR	LR, [SP, #0]
STR	R0, [SP, #232]
UXTB	R6, R1
; type end address is: 4 (R1)
; type start address is: 24 (R6)
;mbus_hw.c,1316 :: 		uint8_t buffer[16][14] = { 0 };
ADD	R11, SP, #5
ADD	R10, R11, #224
MOVW	R12, #lo_addr(?ICSmbus_get_meter_key_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_meter_key_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1317 :: 		uint8_t top = 0;
;mbus_hw.c,1318 :: 		uint8_t i = 0;
;mbus_hw.c,1321 :: 		strcat( buffer[0], REG_READ xstr( METER_KEY_REG_0 ) REG_READ_END );
MOVW	R3, #lo_addr(?lstr20_mbus_hw+0)
MOVT	R3, #hi_addr(?lstr20_mbus_hw+0)
ADD	R2, SP, #5
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;mbus_hw.c,1322 :: 		strcat( buffer[1], REG_READ xstr( METER_KEY_REG_1 ) REG_READ_END );
MOVW	R3, #lo_addr(?lstr21_mbus_hw+0)
MOVT	R3, #hi_addr(?lstr21_mbus_hw+0)
ADD	R2, SP, #5
ADDS	R2, #14
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;mbus_hw.c,1323 :: 		strcat( buffer[2], REG_READ xstr( METER_KEY_REG_2 ) REG_READ_END );
MOVW	R3, #lo_addr(?lstr22_mbus_hw+0)
MOVT	R3, #hi_addr(?lstr22_mbus_hw+0)
ADD	R2, SP, #5
ADDS	R2, #28
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;mbus_hw.c,1324 :: 		strcat( buffer[3], REG_READ xstr( METER_KEY_REG_3 ) REG_READ_END );
MOVW	R3, #lo_addr(?lstr23_mbus_hw+0)
MOVT	R3, #hi_addr(?lstr23_mbus_hw+0)
ADD	R2, SP, #5
ADDS	R2, #42
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;mbus_hw.c,1325 :: 		strcat( buffer[4], REG_READ xstr( METER_KEY_REG_4 ) REG_READ_END );
MOVW	R3, #lo_addr(?lstr24_mbus_hw+0)
MOVT	R3, #hi_addr(?lstr24_mbus_hw+0)
ADD	R2, SP, #5
ADDS	R2, #56
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;mbus_hw.c,1326 :: 		strcat( buffer[5], REG_READ xstr( METER_KEY_REG_5 ) REG_READ_END );
MOVW	R3, #lo_addr(?lstr25_mbus_hw+0)
MOVT	R3, #hi_addr(?lstr25_mbus_hw+0)
ADD	R2, SP, #5
ADDS	R2, #70
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;mbus_hw.c,1327 :: 		strcat( buffer[6], REG_READ xstr( METER_KEY_REG_6 ) REG_READ_END );
MOVW	R3, #lo_addr(?lstr26_mbus_hw+0)
MOVT	R3, #hi_addr(?lstr26_mbus_hw+0)
ADD	R2, SP, #5
ADDS	R2, #84
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;mbus_hw.c,1328 :: 		strcat( buffer[7], REG_READ xstr( METER_KEY_REG_7 ) REG_READ_END );
MOVW	R3, #lo_addr(?lstr27_mbus_hw+0)
MOVT	R3, #hi_addr(?lstr27_mbus_hw+0)
ADD	R2, SP, #5
ADDS	R2, #98
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;mbus_hw.c,1329 :: 		strcat( buffer[8], REG_READ xstr( METER_KEY_REG_8 ) REG_READ_END );
MOVW	R3, #lo_addr(?lstr28_mbus_hw+0)
MOVT	R3, #hi_addr(?lstr28_mbus_hw+0)
ADD	R2, SP, #5
ADDS	R2, #112
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;mbus_hw.c,1330 :: 		strcat( buffer[9], REG_READ xstr( METER_KEY_REG_9 ) REG_READ_END );
MOVW	R3, #lo_addr(?lstr29_mbus_hw+0)
MOVT	R3, #hi_addr(?lstr29_mbus_hw+0)
ADD	R2, SP, #5
ADDS	R2, #126
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;mbus_hw.c,1331 :: 		strcat( buffer[10], REG_READ xstr( METER_KEY_REG_10 ) REG_READ_END );
MOVW	R3, #lo_addr(?lstr30_mbus_hw+0)
MOVT	R3, #hi_addr(?lstr30_mbus_hw+0)
ADD	R2, SP, #5
ADDS	R2, #140
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;mbus_hw.c,1332 :: 		strcat( buffer[11], REG_READ xstr( METER_KEY_REG_11 ) REG_READ_END );
MOVW	R3, #lo_addr(?lstr31_mbus_hw+0)
MOVT	R3, #hi_addr(?lstr31_mbus_hw+0)
ADD	R2, SP, #5
ADDS	R2, #154
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;mbus_hw.c,1333 :: 		strcat( buffer[12], REG_READ xstr( METER_KEY_REG_12 ) REG_READ_END );
MOVW	R3, #lo_addr(?lstr32_mbus_hw+0)
MOVT	R3, #hi_addr(?lstr32_mbus_hw+0)
ADD	R2, SP, #5
ADDS	R2, #168
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;mbus_hw.c,1334 :: 		strcat( buffer[13], REG_READ xstr( METER_KEY_REG_13 ) REG_READ_END );
MOVW	R3, #lo_addr(?lstr33_mbus_hw+0)
MOVT	R3, #hi_addr(?lstr33_mbus_hw+0)
ADD	R2, SP, #5
ADDS	R2, #182
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;mbus_hw.c,1335 :: 		strcat( buffer[14], REG_READ xstr( METER_KEY_REG_14 ) REG_READ_END );
MOVW	R3, #lo_addr(?lstr34_mbus_hw+0)
MOVT	R3, #hi_addr(?lstr34_mbus_hw+0)
ADD	R2, SP, #5
ADDS	R2, #196
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;mbus_hw.c,1336 :: 		strcat( buffer[15], REG_READ xstr( METER_KEY_REG_15 ) REG_READ_END );
MOVW	R3, #lo_addr(?lstr35_mbus_hw+0)
MOVT	R3, #hi_addr(?lstr35_mbus_hw+0)
ADD	R2, SP, #5
ADDS	R2, #210
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;mbus_hw.c,1338 :: 		if ( type == DES_MODE )
CMP	R6, #0
IT	NE
BNE	L_mbus_get_meter_key230
; type end address is: 24 (R6)
;mbus_hw.c,1339 :: 		top = 8;
MOVS	R2, #8
STRB	R2, [SP, #229]
IT	AL
BAL	L_mbus_get_meter_key231
L_mbus_get_meter_key230:
;mbus_hw.c,1340 :: 		else if ( type == AES_MODE )
; type start address is: 24 (R6)
CMP	R6, #1
IT	NE
BNE	L_mbus_get_meter_key232
; type end address is: 24 (R6)
;mbus_hw.c,1341 :: 		top = 16;
MOVS	R2, #16
STRB	R2, [SP, #229]
IT	AL
BAL	L_mbus_get_meter_key233
L_mbus_get_meter_key232:
;mbus_hw.c,1343 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_get_meter_key
L_mbus_get_meter_key233:
L_mbus_get_meter_key231:
;mbus_hw.c,1345 :: 		for ( i = 0; i < top; i++ )
MOVS	R2, #0
STRB	R2, [SP, #230]
L_mbus_get_meter_key234:
LDRB	R3, [SP, #229]
LDRB	R2, [SP, #230]
CMP	R2, R3
IT	CS
BCS	L_mbus_get_meter_key235
;mbus_hw.c,1347 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1348 :: 		status = mbus_read_reg( buffer[i] );
ADD	R4, SP, #5
LDRB	R3, [SP, #230]
MOVS	R2, #14
MULS	R2, R3, R2
ADDS	R2, R4, R2
MOV	R0, R2
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1350 :: 		while ( !response_finished );
L_mbus_get_meter_key237:
MOVW	R2, #lo_addr(mbus_hw_response_finished+0)
MOVT	R2, #hi_addr(mbus_hw_response_finished+0)
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	NE
BNE	L_mbus_get_meter_key238
IT	AL
BAL	L_mbus_get_meter_key237
L_mbus_get_meter_key238:
;mbus_hw.c,1352 :: 		get_register_contents( &key[i] );
LDRB	R3, [SP, #230]
LDR	R2, [SP, #232]
ADDS	R2, R2, R3
MOV	R0, R2
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,1345 :: 		for ( i = 0; i < top; i++ )
LDRB	R2, [SP, #230]
ADDS	R2, R2, #1
STRB	R2, [SP, #230]
;mbus_hw.c,1353 :: 		}
IT	AL
BAL	L_mbus_get_meter_key234
L_mbus_get_meter_key235:
;mbus_hw.c,1355 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1356 :: 		}
L_end_mbus_get_meter_key:
LDR	LR, [SP, #0]
ADD	SP, SP, #236
BX	LR
; end of _mbus_get_meter_key
_mbus_get_indications:
;mbus_hw.c,1358 :: 		status_t mbus_get_indications( uint8_t *indications )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,1360 :: 		uint8_t buffer[8] = REG_READ xstr( INDICATIONS_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_indications_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_indications_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1363 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1364 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1366 :: 		while ( !response_finished );
L_mbus_get_indications239:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_indications240
IT	AL
BAL	L_mbus_get_indications239
L_mbus_get_indications240:
;mbus_hw.c,1368 :: 		get_register_contents( indications );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,1370 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1371 :: 		}
L_end_mbus_get_indications:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_indications
_mbus_get_lbt_threshold:
;mbus_hw.c,1373 :: 		status_t mbus_get_lbt_threshold( uint8_t *threshold )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,1375 :: 		uint8_t buffer[8] = REG_READ xstr( LBT_THRESHOLD_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_lbt_threshold_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_lbt_threshold_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1378 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1379 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1381 :: 		while ( !response_finished );
L_mbus_get_lbt_threshold241:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_lbt_threshold242
IT	AL
BAL	L_mbus_get_lbt_threshold241
L_mbus_get_lbt_threshold242:
;mbus_hw.c,1383 :: 		get_register_contents( threshold );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,1385 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1386 :: 		}
L_end_mbus_get_lbt_threshold:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_lbt_threshold
_mbus_get_lbt_advanced_opt:
;mbus_hw.c,1388 :: 		status_t mbus_get_lbt_advanced_opt( uint8_t *opt )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,1390 :: 		uint8_t buffer[8] = REG_READ xstr( LBT_ADVANCED_OPTIONS_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_lbt_advanced_opt_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_lbt_advanced_opt_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1393 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1394 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1396 :: 		while ( !response_finished );
L_mbus_get_lbt_advanced_opt243:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_lbt_advanced_opt244
IT	AL
BAL	L_mbus_get_lbt_advanced_opt243
L_mbus_get_lbt_advanced_opt244:
;mbus_hw.c,1398 :: 		get_register_contents( opt );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,1400 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1401 :: 		}
L_end_mbus_get_lbt_advanced_opt:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_lbt_advanced_opt
_mbus_get_single_channel_lbt_bo_max:
;mbus_hw.c,1403 :: 		status_t mbus_get_single_channel_lbt_bo_max( uint8_t *max )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,1405 :: 		uint8_t buffer[8] = REG_READ xstr( SINGLE_CHNL_LBT_BO_MAX_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_single_channel_lbt_bo_max_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_single_channel_lbt_bo_max_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1408 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1409 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1411 :: 		while ( !response_finished );
L_mbus_get_single_channel_lbt_bo_max245:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_single_channel_lbt_bo_max246
IT	AL
BAL	L_mbus_get_single_channel_lbt_bo_max245
L_mbus_get_single_channel_lbt_bo_max246:
;mbus_hw.c,1413 :: 		get_register_contents( max );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,1415 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1416 :: 		}
L_end_mbus_get_single_channel_lbt_bo_max:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_single_channel_lbt_bo_max
_mbus_get_single_channel_lbt_bo_flat:
;mbus_hw.c,1418 :: 		status_t mbus_get_single_channel_lbt_bo_flat( uint8_t *flat )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,1420 :: 		uint8_t buffer[8] = REG_READ xstr( SINGLE_CHNL_LBT_BO_FLAT_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_single_channel_lbt_bo_flat_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_single_channel_lbt_bo_flat_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1423 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1424 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1426 :: 		while ( !response_finished );
L_mbus_get_single_channel_lbt_bo_flat247:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_single_channel_lbt_bo_flat248
IT	AL
BAL	L_mbus_get_single_channel_lbt_bo_flat247
L_mbus_get_single_channel_lbt_bo_flat248:
;mbus_hw.c,1428 :: 		get_register_contents( flat );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,1430 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1431 :: 		}
L_end_mbus_get_single_channel_lbt_bo_flat:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_single_channel_lbt_bo_flat
_mbus_get_single_channel_lbt_delay:
;mbus_hw.c,1433 :: 		status_t mbus_get_single_channel_lbt_delay( uint16_t *delay )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,1435 :: 		uint8_t buffer[8] = REG_READ xstr( SINGLE_CHNL_LBT_DELAY_REG ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_single_channel_lbt_delay_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_single_channel_lbt_delay_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1436 :: 		uint8_t i = 0;
;mbus_hw.c,1437 :: 		uint8_t end = 0;
;mbus_hw.c,1438 :: 		char str[6] = { 0 };
;mbus_hw.c,1442 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1443 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1445 :: 		while ( !response_finished );
L_mbus_get_single_channel_lbt_delay249:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_single_channel_lbt_delay250
IT	AL
BAL	L_mbus_get_single_channel_lbt_delay249
L_mbus_get_single_channel_lbt_delay250:
;mbus_hw.c,1447 :: 		get_register_contents_long( delay );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents_long+0
;mbus_hw.c,1449 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1450 :: 		}
L_end_mbus_get_single_channel_lbt_delay:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_single_channel_lbt_delay
_mbus_get_single_channel_lbt_bo_period:
;mbus_hw.c,1452 :: 		status_t mbus_get_single_channel_lbt_bo_period( uint16_t *period )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,1454 :: 		uint8_t buffer[8] = REG_READ xstr( SINGLE_CHNL_LBT_BO_PERIOD ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_single_channel_lbt_bo_period_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_single_channel_lbt_bo_period_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1457 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1458 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1460 :: 		while ( !response_finished );
L_mbus_get_single_channel_lbt_bo_period251:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_single_channel_lbt_bo_period252
IT	AL
BAL	L_mbus_get_single_channel_lbt_bo_period251
L_mbus_get_single_channel_lbt_bo_period252:
;mbus_hw.c,1462 :: 		get_register_contents_long( period );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents_long+0
;mbus_hw.c,1464 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1465 :: 		}
L_end_mbus_get_single_channel_lbt_bo_period:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_single_channel_lbt_bo_period
_mbus_get_multi_channel_lbt_bo_max:
;mbus_hw.c,1467 :: 		status_t mbus_get_multi_channel_lbt_bo_max( uint8_t *max )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,1469 :: 		uint8_t buffer[8] = REG_READ xstr( MULTI_CHNL_LBT_BO_MAX ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_multi_channel_lbt_bo_max_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_multi_channel_lbt_bo_max_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1472 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1473 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1475 :: 		while ( !response_finished );
L_mbus_get_multi_channel_lbt_bo_max253:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_multi_channel_lbt_bo_max254
IT	AL
BAL	L_mbus_get_multi_channel_lbt_bo_max253
L_mbus_get_multi_channel_lbt_bo_max254:
;mbus_hw.c,1477 :: 		get_register_contents( max );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,1479 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1480 :: 		}
L_end_mbus_get_multi_channel_lbt_bo_max:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_multi_channel_lbt_bo_max
_mbus_get_multicast_address:
;mbus_hw.c,1482 :: 		status_t mbus_get_multicast_address( uint8_t *address )
SUB	SP, SP, #92
STR	LR, [SP, #0]
STR	R0, [SP, #88]
;mbus_hw.c,1484 :: 		uint8_t buffer[8][10] = { 0 };
ADD	R11, SP, #5
ADD	R10, R11, #80
MOVW	R12, #lo_addr(?ICSmbus_get_multicast_address_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_multicast_address_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1485 :: 		uint8_t i = 0;
;mbus_hw.c,1488 :: 		strcat( buffer[0], REG_READ xstr( MULTICAST_ADDRESS_REG_0 ) REG_READ_END );
MOVW	R2, #lo_addr(?lstr36_mbus_hw+0)
MOVT	R2, #hi_addr(?lstr36_mbus_hw+0)
ADD	R1, SP, #5
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,1489 :: 		strcat( buffer[1], REG_READ xstr( MULTICAST_ADDRESS_REG_1 ) REG_READ_END );
MOVW	R2, #lo_addr(?lstr37_mbus_hw+0)
MOVT	R2, #hi_addr(?lstr37_mbus_hw+0)
ADD	R1, SP, #5
ADDS	R1, #10
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,1490 :: 		strcat( buffer[2], REG_READ xstr( MULTICAST_ADDRESS_REG_2 ) REG_READ_END );
MOVW	R2, #lo_addr(?lstr38_mbus_hw+0)
MOVT	R2, #hi_addr(?lstr38_mbus_hw+0)
ADD	R1, SP, #5
ADDS	R1, #20
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,1491 :: 		strcat( buffer[3], REG_READ xstr( MULTICAST_ADDRESS_REG_3 ) REG_READ_END );
MOVW	R2, #lo_addr(?lstr39_mbus_hw+0)
MOVT	R2, #hi_addr(?lstr39_mbus_hw+0)
ADD	R1, SP, #5
ADDS	R1, #30
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,1492 :: 		strcat( buffer[4], REG_READ xstr( MULTICAST_ADDRESS_REG_4 ) REG_READ_END );
MOVW	R2, #lo_addr(?lstr40_mbus_hw+0)
MOVT	R2, #hi_addr(?lstr40_mbus_hw+0)
ADD	R1, SP, #5
ADDS	R1, #40
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,1493 :: 		strcat( buffer[5], REG_READ xstr( MULTICAST_ADDRESS_REG_5 ) REG_READ_END );
MOVW	R2, #lo_addr(?lstr41_mbus_hw+0)
MOVT	R2, #hi_addr(?lstr41_mbus_hw+0)
ADD	R1, SP, #5
ADDS	R1, #50
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,1494 :: 		strcat( buffer[6], REG_READ xstr( MULTICAST_ADDRESS_REG_6 ) REG_READ_END );
MOVW	R2, #lo_addr(?lstr42_mbus_hw+0)
MOVT	R2, #hi_addr(?lstr42_mbus_hw+0)
ADD	R1, SP, #5
ADDS	R1, #60
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,1495 :: 		strcat( buffer[7], REG_READ xstr( MULTICAST_ADDRESS_REG_7 ) REG_READ_END );
MOVW	R2, #lo_addr(?lstr43_mbus_hw+0)
MOVT	R2, #hi_addr(?lstr43_mbus_hw+0)
ADD	R1, SP, #5
ADDS	R1, #70
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,1497 :: 		for ( i = 0; i < 8; i++ )
MOVS	R1, #0
STRB	R1, [SP, #85]
L_mbus_get_multicast_address255:
LDRB	R1, [SP, #85]
CMP	R1, #8
IT	CS
BCS	L_mbus_get_multicast_address256
;mbus_hw.c,1499 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1500 :: 		status = mbus_read_reg( buffer[i] );
ADD	R3, SP, #5
LDRB	R2, [SP, #85]
MOVS	R1, #10
MULS	R1, R2, R1
ADDS	R1, R3, R1
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1502 :: 		while ( !response_finished );
L_mbus_get_multicast_address258:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_multicast_address259
IT	AL
BAL	L_mbus_get_multicast_address258
L_mbus_get_multicast_address259:
;mbus_hw.c,1504 :: 		get_register_contents( &address[i] );
LDRB	R2, [SP, #85]
LDR	R1, [SP, #88]
ADDS	R1, R1, R2
MOV	R0, R1
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,1497 :: 		for ( i = 0; i < 8; i++ )
LDRB	R1, [SP, #85]
ADDS	R1, R1, #1
STRB	R1, [SP, #85]
;mbus_hw.c,1505 :: 		}
IT	AL
BAL	L_mbus_get_multicast_address255
L_mbus_get_multicast_address256:
;mbus_hw.c,1507 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1508 :: 		}
L_end_mbus_get_multicast_address:
LDR	LR, [SP, #0]
ADD	SP, SP, #92
BX	LR
; end of _mbus_get_multicast_address
_mbus_get_single_channel_lbt_ra_max:
;mbus_hw.c,1510 :: 		status_t mbus_get_single_channel_lbt_ra_max( uint8_t *max )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,1512 :: 		uint8_t buffer[8] = REG_READ xstr( SINGLE_CHNL_LBT_RA_MAX ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_single_channel_lbt_ra_max_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_single_channel_lbt_ra_max_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1515 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1516 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1518 :: 		while ( !response_finished );
L_mbus_get_single_channel_lbt_ra_max260:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_single_channel_lbt_ra_max261
IT	AL
BAL	L_mbus_get_single_channel_lbt_ra_max260
L_mbus_get_single_channel_lbt_ra_max261:
;mbus_hw.c,1520 :: 		get_register_contents( max );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,1522 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1523 :: 		}
L_end_mbus_get_single_channel_lbt_ra_max:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_single_channel_lbt_ra_max
_mbus_get_single_channel_lbt_ra_flat:
;mbus_hw.c,1525 :: 		status_t mbus_get_single_channel_lbt_ra_flat( uint8_t *flat )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,1527 :: 		uint8_t buffer[8] = REG_READ xstr( SINGLE_CHNL_LBT_RA_FLAT ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_single_channel_lbt_ra_flat_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_single_channel_lbt_ra_flat_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1530 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1531 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1533 :: 		while ( !response_finished );
L_mbus_get_single_channel_lbt_ra_flat262:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_single_channel_lbt_ra_flat263
IT	AL
BAL	L_mbus_get_single_channel_lbt_ra_flat262
L_mbus_get_single_channel_lbt_ra_flat263:
;mbus_hw.c,1535 :: 		get_register_contents( flat );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,1537 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1538 :: 		}
L_end_mbus_get_single_channel_lbt_ra_flat:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_single_channel_lbt_ra_flat
_mbus_get_single_channel_lbt_ra_period:
;mbus_hw.c,1540 :: 		status_t mbus_get_single_channel_lbt_ra_period( uint8_t *period )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,1542 :: 		uint8_t buffer[8] = REG_READ xstr( SINGLE_CHNL_LBT_RA_PERIOD ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_single_channel_lbt_ra_period_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_single_channel_lbt_ra_period_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1545 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1546 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1548 :: 		while ( !response_finished );
L_mbus_get_single_channel_lbt_ra_period264:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_single_channel_lbt_ra_period265
IT	AL
BAL	L_mbus_get_single_channel_lbt_ra_period264
L_mbus_get_single_channel_lbt_ra_period265:
;mbus_hw.c,1550 :: 		get_register_contents( period );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,1552 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1553 :: 		}
L_end_mbus_get_single_channel_lbt_ra_period:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_single_channel_lbt_ra_period
_mbus_get_fac_options:
;mbus_hw.c,1555 :: 		status_t mbus_get_fac_options( uint8_t *options )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,1557 :: 		uint8_t buffer[8] = REG_READ xstr( FAC_OPTIONS ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_fac_options_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_fac_options_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1560 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1561 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1563 :: 		while ( !response_finished );
L_mbus_get_fac_options266:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_fac_options267
IT	AL
BAL	L_mbus_get_fac_options266
L_mbus_get_fac_options267:
;mbus_hw.c,1565 :: 		get_register_contents( options );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,1567 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1568 :: 		}
L_end_mbus_get_fac_options:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_fac_options
_mbus_get_fac_fast_tro_min:
;mbus_hw.c,1570 :: 		status_t mbus_get_fac_fast_tro_min( uint16_t *min )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,1572 :: 		uint8_t buffer[8] = REG_READ xstr( FAC_FAST_TROMIN ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_fac_fast_tro_min_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_fac_fast_tro_min_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1575 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1576 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1578 :: 		while ( !response_finished );
L_mbus_get_fac_fast_tro_min268:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_fac_fast_tro_min269
IT	AL
BAL	L_mbus_get_fac_fast_tro_min268
L_mbus_get_fac_fast_tro_min269:
;mbus_hw.c,1580 :: 		get_register_contents_long( min );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents_long+0
;mbus_hw.c,1582 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1583 :: 		}
L_end_mbus_get_fac_fast_tro_min:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_fac_fast_tro_min
_mbus_get_fac_fast_tro_max:
;mbus_hw.c,1585 :: 		status_t mbus_get_fac_fast_tro_max( uint16_t *max )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,1587 :: 		uint8_t buffer[8] = REG_READ xstr( FAC_FAST_TROMAX ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_fac_fast_tro_max_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_fac_fast_tro_max_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1590 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1591 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1593 :: 		while ( !response_finished );
L_mbus_get_fac_fast_tro_max270:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_fac_fast_tro_max271
IT	AL
BAL	L_mbus_get_fac_fast_tro_max270
L_mbus_get_fac_fast_tro_max271:
;mbus_hw.c,1595 :: 		get_register_contents_long( max );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents_long+0
;mbus_hw.c,1597 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1598 :: 		}
L_end_mbus_get_fac_fast_tro_max:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_fac_fast_tro_max
_mbus_get_fac_slow_tro_min:
;mbus_hw.c,1600 :: 		status_t mbus_get_fac_slow_tro_min( uint16_t *min )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,1602 :: 		uint8_t buffer[8] = REG_READ xstr( FAC_SLOW_TROMIN ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_fac_slow_tro_min_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_fac_slow_tro_min_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1605 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1606 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1608 :: 		while ( !response_finished );
L_mbus_get_fac_slow_tro_min272:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_fac_slow_tro_min273
IT	AL
BAL	L_mbus_get_fac_slow_tro_min272
L_mbus_get_fac_slow_tro_min273:
;mbus_hw.c,1610 :: 		get_register_contents_long( min );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents_long+0
;mbus_hw.c,1612 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1613 :: 		}
L_end_mbus_get_fac_slow_tro_min:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_fac_slow_tro_min
_mbus_get_fac_slow_tro_max:
;mbus_hw.c,1615 :: 		status_t mbus_get_fac_slow_tro_max( uint16_t *max )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,1617 :: 		uint8_t buffer[8] = REG_READ xstr( FAC_SLOW_TROMAX ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_fac_slow_tro_max_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_fac_slow_tro_max_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1620 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1621 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1623 :: 		while ( !response_finished );
L_mbus_get_fac_slow_tro_max274:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_fac_slow_tro_max275
IT	AL
BAL	L_mbus_get_fac_slow_tro_max274
L_mbus_get_fac_slow_tro_max275:
;mbus_hw.c,1625 :: 		get_register_contents_long( max );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents_long+0
;mbus_hw.c,1627 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1628 :: 		}
L_end_mbus_get_fac_slow_tro_max:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_fac_slow_tro_max
_mbus_get_fac_txd:
;mbus_hw.c,1630 :: 		status_t mbus_get_fac_txd( uint8_t *txd )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,1632 :: 		uint8_t buffer[8] = REG_READ xstr( FAC_TXD ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_fac_txd_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_fac_txd_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1635 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1636 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1638 :: 		while ( !response_finished );
L_mbus_get_fac_txd276:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_fac_txd277
IT	AL
BAL	L_mbus_get_fac_txd276
L_mbus_get_fac_txd277:
;mbus_hw.c,1640 :: 		get_register_contents( txd );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,1642 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1643 :: 		}
L_end_mbus_get_fac_txd:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_fac_txd
_mbus_get_fac_timeout:
;mbus_hw.c,1645 :: 		status_t mbus_get_fac_timeout( uint8_t *timeout )
SUB	SP, SP, #20
STR	LR, [SP, #0]
STR	R0, [SP, #16]
;mbus_hw.c,1647 :: 		uint8_t buffer[8] = REG_READ xstr( FAC_TIMEOUT ) REG_READ_END;
ADD	R11, SP, #5
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_get_fac_timeout_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_get_fac_timeout_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1650 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1651 :: 		status = mbus_read_reg( buffer );
ADD	R1, SP, #5
MOV	R0, R1
BL	mbus_hw_mbus_read_reg+0
STRB	R0, [SP, #4]
;mbus_hw.c,1653 :: 		while ( !response_finished );
L_mbus_get_fac_timeout278:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_get_fac_timeout279
IT	AL
BAL	L_mbus_get_fac_timeout278
L_mbus_get_fac_timeout279:
;mbus_hw.c,1655 :: 		get_register_contents( timeout );
LDR	R0, [SP, #16]
BL	mbus_hw_get_register_contents+0
;mbus_hw.c,1657 :: 		return status;
LDRB	R0, [SP, #4]
;mbus_hw.c,1658 :: 		}
L_end_mbus_get_fac_timeout:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_get_fac_timeout
_mbus_set_mbus_mode:
;mbus_hw.c,1663 :: 		status_t mbus_set_mbus_mode( mbus_role_t role )
; role start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; role end address is: 0 (R0)
; role start address is: 12 (R3)
;mbus_hw.c,1666 :: 		uint8_t buffer[8] = REG_WRITE xstr( M_BUS_MODE_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_mbus_mode_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_mbus_mode_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1668 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1669 :: 		IntToStr( role, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; role end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,1670 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,1671 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,1672 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,1674 :: 		while ( !response_finished );
L_mbus_set_mbus_mode280:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_mbus_mode281
IT	AL
BAL	L_mbus_set_mbus_mode280
L_mbus_set_mbus_mode281:
;mbus_hw.c,1676 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_mbus_mode282
;mbus_hw.c,1677 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_mbus_mode
L_mbus_set_mbus_mode282:
;mbus_hw.c,1679 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,1680 :: 		}
L_end_mbus_set_mbus_mode:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_mbus_mode
_mbus_set_serial_rx_format:
;mbus_hw.c,1682 :: 		status_t mbus_set_serial_rx_format( serial_rx_format_t format )
; format start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; format end address is: 0 (R0)
; format start address is: 12 (R3)
;mbus_hw.c,1685 :: 		uint8_t buffer[8] = REG_WRITE xstr( TX_FORMAT_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_serial_rx_format_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_serial_rx_format_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1687 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1688 :: 		mbus_update_rx_format( format );                /**< Updates static format for when sending / receiving frames */
UXTB	R0, R3
BL	mbus_hw_mbus_update_rx_format+0
;mbus_hw.c,1689 :: 		IntToStr( format, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; format end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,1690 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,1691 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,1692 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,1694 :: 		while ( !response_finished );
L_mbus_set_serial_rx_format284:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_serial_rx_format285
IT	AL
BAL	L_mbus_set_serial_rx_format284
L_mbus_set_serial_rx_format285:
;mbus_hw.c,1696 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_serial_rx_format286
;mbus_hw.c,1697 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_serial_rx_format
L_mbus_set_serial_rx_format286:
;mbus_hw.c,1699 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,1700 :: 		}                                                   /**< User can "or" ( | ) multiples of the serial_rx_format_t enum to initiate more than 1 field         */
L_end_mbus_set_serial_rx_format:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_serial_rx_format
_mbus_set_serial_tx_format:
;mbus_hw.c,1702 :: 		status_t mbus_set_serial_tx_format( serial_tx_format_t format )
; format start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; format end address is: 0 (R0)
; format start address is: 12 (R3)
;mbus_hw.c,1705 :: 		uint8_t buffer[8] = REG_WRITE xstr( RX_FORMAT_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_serial_tx_format_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_serial_tx_format_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1707 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1708 :: 		mbus_update_tx_format( format );                /**< Updates static format for when sending / receiving frames */
UXTB	R0, R3
BL	mbus_hw_mbus_update_tx_format+0
;mbus_hw.c,1709 :: 		IntToStr( format, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; format end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,1710 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,1711 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,1712 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,1714 :: 		while ( !response_finished );
L_mbus_set_serial_tx_format288:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_serial_tx_format289
IT	AL
BAL	L_mbus_set_serial_tx_format288
L_mbus_set_serial_tx_format289:
;mbus_hw.c,1716 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_serial_tx_format290
;mbus_hw.c,1717 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_serial_tx_format
L_mbus_set_serial_tx_format290:
;mbus_hw.c,1719 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,1720 :: 		}                                                   /**< User can "or" ( | ) multiples of the serial_tx_format_t enum to initiate more than 1 field         */
L_end_mbus_set_serial_tx_format:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_serial_tx_format
_mbus_set_tx_rx_pins:
;mbus_hw.c,1722 :: 		status_t mbus_set_tx_rx_pins( uint8_t pins )
; pins start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; pins end address is: 0 (R0)
; pins start address is: 12 (R3)
;mbus_hw.c,1725 :: 		uint8_t buffer[8] = REG_WRITE xstr( RX_TX_PIN_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_tx_rx_pins_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_tx_rx_pins_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1727 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1728 :: 		IntToStr( pins, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; pins end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,1729 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,1730 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,1731 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,1733 :: 		while ( !response_finished );
L_mbus_set_tx_rx_pins292:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_tx_rx_pins293
IT	AL
BAL	L_mbus_set_tx_rx_pins292
L_mbus_set_tx_rx_pins293:
;mbus_hw.c,1735 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_tx_rx_pins294
;mbus_hw.c,1736 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_tx_rx_pins
L_mbus_set_tx_rx_pins294:
;mbus_hw.c,1738 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,1739 :: 		}
L_end_mbus_set_tx_rx_pins:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_tx_rx_pins
_mbus_set_estim_freq_offset:
;mbus_hw.c,1741 :: 		status_t mbus_set_estim_freq_offset( uint8_t offset )
; offset start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; offset end address is: 0 (R0)
; offset start address is: 12 (R3)
;mbus_hw.c,1744 :: 		uint8_t buffer[8] = REG_WRITE xstr( EST_FREQ_OFFSET_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_estim_freq_offset_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_estim_freq_offset_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1746 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1747 :: 		IntToStr( offset, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; offset end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,1748 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,1749 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,1750 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,1752 :: 		while ( !response_finished );
L_mbus_set_estim_freq_offset296:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_estim_freq_offset297
IT	AL
BAL	L_mbus_set_estim_freq_offset296
L_mbus_set_estim_freq_offset297:
;mbus_hw.c,1754 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_estim_freq_offset298
;mbus_hw.c,1755 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_estim_freq_offset
L_mbus_set_estim_freq_offset298:
;mbus_hw.c,1757 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,1758 :: 		}
L_end_mbus_set_estim_freq_offset:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_estim_freq_offset
_mbus_set_c_field:
;mbus_hw.c,1760 :: 		status_t mbus_set_c_field( uint8_t c_field_val )
; c_field_val start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; c_field_val end address is: 0 (R0)
; c_field_val start address is: 12 (R3)
;mbus_hw.c,1763 :: 		uint8_t buffer[8] = REG_WRITE xstr( C_FIELD_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_c_field_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_c_field_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1765 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1766 :: 		IntToStr( c_field_val, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; c_field_val end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,1767 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,1768 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,1769 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,1771 :: 		while ( !response_finished );
L_mbus_set_c_field300:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_c_field301
IT	AL
BAL	L_mbus_set_c_field300
L_mbus_set_c_field301:
;mbus_hw.c,1773 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_c_field302
;mbus_hw.c,1774 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_c_field
L_mbus_set_c_field302:
;mbus_hw.c,1776 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,1777 :: 		}
L_end_mbus_set_c_field:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_c_field
_mbus_set_m_field_0:
;mbus_hw.c,1779 :: 		status_t mbus_set_m_field_0( uint8_t m_field_val )
; m_field_val start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; m_field_val end address is: 0 (R0)
; m_field_val start address is: 12 (R3)
;mbus_hw.c,1782 :: 		uint8_t buffer[8] = REG_WRITE xstr( M_FIELD_BYTE_0_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_m_field_0_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_m_field_0_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1784 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1785 :: 		IntToStr( m_field_val, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; m_field_val end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,1786 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,1787 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,1788 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,1790 :: 		while ( !response_finished );
L_mbus_set_m_field_0304:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_m_field_0305
IT	AL
BAL	L_mbus_set_m_field_0304
L_mbus_set_m_field_0305:
;mbus_hw.c,1792 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_m_field_0306
;mbus_hw.c,1793 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_m_field_0
L_mbus_set_m_field_0306:
;mbus_hw.c,1795 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,1796 :: 		}
L_end_mbus_set_m_field_0:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_m_field_0
_mbus_set_m_field_1:
;mbus_hw.c,1798 :: 		status_t mbus_set_m_field_1( uint8_t m_field_val )
; m_field_val start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; m_field_val end address is: 0 (R0)
; m_field_val start address is: 12 (R3)
;mbus_hw.c,1801 :: 		uint8_t buffer[8] = REG_WRITE xstr( M_FIELD_BYTE_1_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_m_field_1_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_m_field_1_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1803 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1804 :: 		IntToStr( m_field_val, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; m_field_val end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,1805 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,1806 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,1807 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,1809 :: 		while ( !response_finished );
L_mbus_set_m_field_1308:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_m_field_1309
IT	AL
BAL	L_mbus_set_m_field_1308
L_mbus_set_m_field_1309:
;mbus_hw.c,1811 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_m_field_1310
;mbus_hw.c,1812 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_m_field_1
L_mbus_set_m_field_1310:
;mbus_hw.c,1814 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,1815 :: 		}
L_end_mbus_set_m_field_1:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_m_field_1
_mbus_set_a_field_0:
;mbus_hw.c,1817 :: 		status_t mbus_set_a_field_0( uint8_t a_field_val )
; a_field_val start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; a_field_val end address is: 0 (R0)
; a_field_val start address is: 12 (R3)
;mbus_hw.c,1820 :: 		uint8_t buffer[8] = REG_WRITE xstr( A_FIELD_BYTE_0_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_a_field_0_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_a_field_0_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1822 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1823 :: 		IntToStr( a_field_val, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; a_field_val end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,1824 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,1825 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,1826 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,1828 :: 		while ( !response_finished );
L_mbus_set_a_field_0312:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_a_field_0313
IT	AL
BAL	L_mbus_set_a_field_0312
L_mbus_set_a_field_0313:
;mbus_hw.c,1830 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_a_field_0314
;mbus_hw.c,1831 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_a_field_0
L_mbus_set_a_field_0314:
;mbus_hw.c,1833 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,1834 :: 		}
L_end_mbus_set_a_field_0:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_a_field_0
_mbus_set_a_field_1:
;mbus_hw.c,1836 :: 		status_t mbus_set_a_field_1( uint8_t a_field_val )
; a_field_val start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; a_field_val end address is: 0 (R0)
; a_field_val start address is: 12 (R3)
;mbus_hw.c,1839 :: 		uint8_t buffer[8] = REG_WRITE xstr( A_FIELD_BYTE_1_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_a_field_1_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_a_field_1_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1841 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1842 :: 		IntToStr( a_field_val, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; a_field_val end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,1843 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,1844 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,1845 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,1847 :: 		while ( !response_finished );
L_mbus_set_a_field_1316:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_a_field_1317
IT	AL
BAL	L_mbus_set_a_field_1316
L_mbus_set_a_field_1317:
;mbus_hw.c,1849 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_a_field_1318
;mbus_hw.c,1850 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_a_field_1
L_mbus_set_a_field_1318:
;mbus_hw.c,1852 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,1853 :: 		}
L_end_mbus_set_a_field_1:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_a_field_1
_mbus_set_a_field_2:
;mbus_hw.c,1855 :: 		status_t mbus_set_a_field_2( uint8_t a_field_val )
; a_field_val start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; a_field_val end address is: 0 (R0)
; a_field_val start address is: 12 (R3)
;mbus_hw.c,1858 :: 		uint8_t buffer[8] = REG_WRITE xstr( A_FIELD_BYTE_2_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_a_field_2_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_a_field_2_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1860 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1861 :: 		IntToStr( a_field_val, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; a_field_val end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,1862 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,1863 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,1864 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,1866 :: 		while ( !response_finished );
L_mbus_set_a_field_2320:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_a_field_2321
IT	AL
BAL	L_mbus_set_a_field_2320
L_mbus_set_a_field_2321:
;mbus_hw.c,1868 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_a_field_2322
;mbus_hw.c,1869 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_a_field_2
L_mbus_set_a_field_2322:
;mbus_hw.c,1871 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,1872 :: 		}
L_end_mbus_set_a_field_2:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_a_field_2
_mbus_set_a_field_3:
;mbus_hw.c,1874 :: 		status_t mbus_set_a_field_3( uint8_t a_field_val )
; a_field_val start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; a_field_val end address is: 0 (R0)
; a_field_val start address is: 12 (R3)
;mbus_hw.c,1877 :: 		uint8_t buffer[8] = REG_WRITE xstr( A_FIELD_BYTE_3_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_a_field_3_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_a_field_3_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1879 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1880 :: 		IntToStr( a_field_val, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; a_field_val end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,1881 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,1882 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,1883 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,1885 :: 		while ( !response_finished );
L_mbus_set_a_field_3324:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_a_field_3325
IT	AL
BAL	L_mbus_set_a_field_3324
L_mbus_set_a_field_3325:
;mbus_hw.c,1887 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_a_field_3326
;mbus_hw.c,1888 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_a_field_3
L_mbus_set_a_field_3326:
;mbus_hw.c,1890 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,1891 :: 		}
L_end_mbus_set_a_field_3:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_a_field_3
_mbus_set_a_field_4:
;mbus_hw.c,1893 :: 		status_t mbus_set_a_field_4( uint8_t a_field_val )
; a_field_val start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; a_field_val end address is: 0 (R0)
; a_field_val start address is: 12 (R3)
;mbus_hw.c,1896 :: 		uint8_t buffer[8] = REG_WRITE xstr( A_FIELD_BYTE_4_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_a_field_4_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_a_field_4_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1898 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1899 :: 		IntToStr( a_field_val, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; a_field_val end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,1900 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,1901 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,1902 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,1904 :: 		while ( !response_finished );
L_mbus_set_a_field_4328:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_a_field_4329
IT	AL
BAL	L_mbus_set_a_field_4328
L_mbus_set_a_field_4329:
;mbus_hw.c,1906 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_a_field_4330
;mbus_hw.c,1907 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_a_field_4
L_mbus_set_a_field_4330:
;mbus_hw.c,1909 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,1910 :: 		}
L_end_mbus_set_a_field_4:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_a_field_4
_mbus_set_a_field_5:
;mbus_hw.c,1912 :: 		status_t mbus_set_a_field_5( uint8_t a_field_val )
; a_field_val start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; a_field_val end address is: 0 (R0)
; a_field_val start address is: 12 (R3)
;mbus_hw.c,1915 :: 		uint8_t buffer[8] = REG_WRITE xstr( A_FIELD_BYTE_5_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_a_field_5_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_a_field_5_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1917 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1918 :: 		IntToStr( a_field_val, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; a_field_val end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,1919 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,1920 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,1921 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,1923 :: 		while ( !response_finished );
L_mbus_set_a_field_5332:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_a_field_5333
IT	AL
BAL	L_mbus_set_a_field_5332
L_mbus_set_a_field_5333:
;mbus_hw.c,1925 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_a_field_5334
;mbus_hw.c,1926 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_a_field_5
L_mbus_set_a_field_5334:
;mbus_hw.c,1928 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,1929 :: 		}
L_end_mbus_set_a_field_5:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_a_field_5
_mbus_set_ci_field:
;mbus_hw.c,1931 :: 		status_t mbus_set_ci_field( uint8_t ci_field_val )
; ci_field_val start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; ci_field_val end address is: 0 (R0)
; ci_field_val start address is: 12 (R3)
;mbus_hw.c,1934 :: 		uint8_t buffer[8] = REG_WRITE xstr( CI_FIELD_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_ci_field_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_ci_field_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1936 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1937 :: 		IntToStr( ci_field_val, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; ci_field_val end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,1938 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,1939 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,1940 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,1942 :: 		while ( !response_finished );
L_mbus_set_ci_field336:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_ci_field337
IT	AL
BAL	L_mbus_set_ci_field336
L_mbus_set_ci_field337:
;mbus_hw.c,1944 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_ci_field338
;mbus_hw.c,1945 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_ci_field
L_mbus_set_ci_field338:
;mbus_hw.c,1947 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,1948 :: 		}
L_end_mbus_set_ci_field:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_ci_field
_mbus_set_radio_channel:
;mbus_hw.c,1950 :: 		status_t mbus_set_radio_channel( channel_t channel )
; channel start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; channel end address is: 0 (R0)
; channel start address is: 12 (R3)
;mbus_hw.c,1953 :: 		uint8_t buffer[8] = REG_WRITE xstr( RADIO_CHANNEL_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_radio_channel_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_radio_channel_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1955 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1956 :: 		IntToStr( channel, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; channel end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,1957 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,1958 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,1959 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,1961 :: 		while ( !response_finished );
L_mbus_set_radio_channel340:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_radio_channel341
IT	AL
BAL	L_mbus_set_radio_channel340
L_mbus_set_radio_channel341:
;mbus_hw.c,1963 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_radio_channel342
;mbus_hw.c,1964 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_radio_channel
L_mbus_set_radio_channel342:
;mbus_hw.c,1966 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,1967 :: 		}
L_end_mbus_set_radio_channel:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_radio_channel
_mbus_set_preamble_length:
;mbus_hw.c,1969 :: 		status_t mbus_set_preamble_length( preamble_length_t length )
; length start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; length end address is: 0 (R0)
; length start address is: 12 (R3)
;mbus_hw.c,1972 :: 		uint8_t buffer[8] = REG_WRITE xstr( PREAMBLE_LEN_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_preamble_length_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_preamble_length_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1974 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1975 :: 		IntToStr( length, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; length end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,1976 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,1977 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,1978 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,1980 :: 		while ( !response_finished );
L_mbus_set_preamble_length344:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_preamble_length345
IT	AL
BAL	L_mbus_set_preamble_length344
L_mbus_set_preamble_length345:
;mbus_hw.c,1982 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_preamble_length346
;mbus_hw.c,1983 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_preamble_length
L_mbus_set_preamble_length346:
;mbus_hw.c,1985 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,1986 :: 		}
L_end_mbus_set_preamble_length:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_preamble_length
_mbus_set_radio_output_power:
;mbus_hw.c,1988 :: 		status_t mbus_set_radio_output_power( radio_output_pwr_t radio_pwr )
; radio_pwr start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; radio_pwr end address is: 0 (R0)
; radio_pwr start address is: 12 (R3)
;mbus_hw.c,1991 :: 		uint8_t buffer[8] = REG_WRITE xstr( RADIO_OUTPUT_PWR_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_radio_output_power_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_radio_output_power_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,1993 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,1994 :: 		IntToStr( radio_pwr, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; radio_pwr end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,1995 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,1996 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,1997 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,1999 :: 		while ( !response_finished );
L_mbus_set_radio_output_power348:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_radio_output_power349
IT	AL
BAL	L_mbus_set_radio_output_power348
L_mbus_set_radio_output_power349:
;mbus_hw.c,2001 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_radio_output_power350
;mbus_hw.c,2002 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_radio_output_power
L_mbus_set_radio_output_power350:
;mbus_hw.c,2004 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2005 :: 		}
L_end_mbus_set_radio_output_power:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_radio_output_power
_mbus_set_channel_plan:
;mbus_hw.c,2007 :: 		status_t mbus_set_channel_plan( channel_t channel )
; channel start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; channel end address is: 0 (R0)
; channel start address is: 12 (R3)
;mbus_hw.c,2010 :: 		uint8_t buffer[8] = REG_WRITE xstr( CHANNEL_PLAN_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_channel_plan_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_channel_plan_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,2012 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2013 :: 		IntToStr( channel, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; channel end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,2014 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,2015 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2016 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2018 :: 		while ( !response_finished );
L_mbus_set_channel_plan352:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_channel_plan353
IT	AL
BAL	L_mbus_set_channel_plan352
L_mbus_set_channel_plan353:
;mbus_hw.c,2020 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_channel_plan354
;mbus_hw.c,2021 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_channel_plan
L_mbus_set_channel_plan354:
;mbus_hw.c,2023 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2024 :: 		}
L_end_mbus_set_channel_plan:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_channel_plan
_mbus_set_radio_output_dbm:
;mbus_hw.c,2026 :: 		status_t mbus_set_radio_output_dbm( radio_output_pwr_t output_pwr )
; output_pwr start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; output_pwr end address is: 0 (R0)
; output_pwr start address is: 12 (R3)
;mbus_hw.c,2029 :: 		uint8_t buffer[8] = REG_WRITE xstr( RADIO_OUTPUT_PWR_DBM_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_radio_output_dbm_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_radio_output_dbm_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,2031 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2032 :: 		IntToStr( output_pwr, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; output_pwr end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,2033 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,2034 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2035 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2037 :: 		while ( !response_finished );
L_mbus_set_radio_output_dbm356:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_radio_output_dbm357
IT	AL
BAL	L_mbus_set_radio_output_dbm356
L_mbus_set_radio_output_dbm357:
;mbus_hw.c,2039 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_radio_output_dbm358
;mbus_hw.c,2040 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_radio_output_dbm
L_mbus_set_radio_output_dbm358:
;mbus_hw.c,2042 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2043 :: 		}
L_end_mbus_set_radio_output_dbm:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_radio_output_dbm
_mbus_set_freq_offset:
;mbus_hw.c,2045 :: 		status_t mbus_set_freq_offset( int8_t offset )
; offset start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
SXTB	R3, R0
; offset end address is: 0 (R0)
; offset start address is: 12 (R3)
;mbus_hw.c,2048 :: 		uint8_t buffer[8] = REG_WRITE xstr( SET_FREQUENCY_OFFSET_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_freq_offset_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_freq_offset_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,2050 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2051 :: 		IntToStr( offset, txt );
ADD	R1, SP, #4
SXTB	R0, R3
; offset end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,2052 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,2053 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2054 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2056 :: 		while ( !response_finished );
L_mbus_set_freq_offset360:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_freq_offset361
IT	AL
BAL	L_mbus_set_freq_offset360
L_mbus_set_freq_offset361:
;mbus_hw.c,2058 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_freq_offset362
;mbus_hw.c,2059 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_freq_offset
L_mbus_set_freq_offset362:
;mbus_hw.c,2061 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2062 :: 		}
L_end_mbus_set_freq_offset:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_freq_offset
_mbus_set_preamble_word:
;mbus_hw.c,2064 :: 		status_t mbus_set_preamble_word( preamble_word_t pre_word )
; pre_word start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; pre_word end address is: 0 (R0)
; pre_word start address is: 12 (R3)
;mbus_hw.c,2067 :: 		uint8_t buffer[8] = REG_WRITE xstr( PREAMBLE_WORD_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_preamble_word_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_preamble_word_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,2069 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2070 :: 		IntToStr( pre_word, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; pre_word end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,2071 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,2072 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2073 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2075 :: 		while ( !response_finished );
L_mbus_set_preamble_word364:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_preamble_word365
IT	AL
BAL	L_mbus_set_preamble_word364
L_mbus_set_preamble_word365:
;mbus_hw.c,2077 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_preamble_word366
;mbus_hw.c,2078 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_preamble_word
L_mbus_set_preamble_word366:
;mbus_hw.c,2080 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2081 :: 		}
L_end_mbus_set_preamble_word:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_preamble_word
_mbus_set_serial_speed:
;mbus_hw.c,2083 :: 		status_t mbus_set_serial_speed( serial_baud_t baud )
; baud start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; baud end address is: 0 (R0)
; baud start address is: 12 (R3)
;mbus_hw.c,2086 :: 		uint8_t buffer[8] = REG_WRITE xstr( SERIAL_SPEED_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_serial_speed_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_serial_speed_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,2088 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2089 :: 		IntToStr( baud, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; baud end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,2090 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,2091 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2092 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2094 :: 		while ( !response_finished );
L_mbus_set_serial_speed368:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_serial_speed369
IT	AL
BAL	L_mbus_set_serial_speed368
L_mbus_set_serial_speed369:
;mbus_hw.c,2096 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_serial_speed370
;mbus_hw.c,2097 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_serial_speed
L_mbus_set_serial_speed370:
;mbus_hw.c,2099 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2100 :: 		}
L_end_mbus_set_serial_speed:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_serial_speed
_mbus_set_serial_timeout:
;mbus_hw.c,2102 :: 		status_t mbus_set_serial_timeout( uint8_t ms )
; ms start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; ms end address is: 0 (R0)
; ms start address is: 12 (R3)
;mbus_hw.c,2105 :: 		uint8_t buffer[8] = REG_WRITE xstr( SERIAL_TIME_OUT_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_serial_timeout_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_serial_timeout_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,2107 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2108 :: 		IntToStr( ms, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; ms end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,2109 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,2110 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2111 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2113 :: 		while ( !response_finished );
L_mbus_set_serial_timeout372:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_serial_timeout373
IT	AL
BAL	L_mbus_set_serial_timeout372
L_mbus_set_serial_timeout373:
;mbus_hw.c,2115 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_serial_timeout374
;mbus_hw.c,2116 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_serial_timeout
L_mbus_set_serial_timeout374:
;mbus_hw.c,2118 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2119 :: 		}
L_end_mbus_set_serial_timeout:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_serial_timeout
_mbus_set_cts_management:
;mbus_hw.c,2121 :: 		status_t mbus_set_cts_management( bool enable )
; enable start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; enable end address is: 0 (R0)
; enable start address is: 12 (R3)
;mbus_hw.c,2124 :: 		uint8_t buffer[8] = REG_WRITE xstr( CTS_MANAGEMENT_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_cts_management_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_cts_management_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,2126 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2127 :: 		IntToStr( enable, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; enable end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,2128 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,2129 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2130 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2132 :: 		while ( !response_finished );
L_mbus_set_cts_management376:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_cts_management377
IT	AL
BAL	L_mbus_set_cts_management376
L_mbus_set_cts_management377:
;mbus_hw.c,2134 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_cts_management378
;mbus_hw.c,2135 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_cts_management
L_mbus_set_cts_management378:
;mbus_hw.c,2137 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2138 :: 		}
L_end_mbus_set_cts_management:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_cts_management
_mbus_set_cts_timeout:
;mbus_hw.c,2140 :: 		status_t mbus_set_cts_timeout( uint8_t seconds )
; seconds start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; seconds end address is: 0 (R0)
; seconds start address is: 12 (R3)
;mbus_hw.c,2143 :: 		uint8_t buffer[8] = REG_WRITE xstr( CTS_TIME_OUT_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_cts_timeout_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_cts_timeout_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,2145 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2146 :: 		IntToStr( seconds, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; seconds end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,2147 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,2148 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2149 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2151 :: 		while ( !response_finished );
L_mbus_set_cts_timeout380:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_cts_timeout381
IT	AL
BAL	L_mbus_set_cts_timeout380
L_mbus_set_cts_timeout381:
;mbus_hw.c,2153 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_cts_timeout382
;mbus_hw.c,2154 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_cts_timeout
L_mbus_set_cts_timeout382:
;mbus_hw.c,2156 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2157 :: 		}
L_end_mbus_set_cts_timeout:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_cts_timeout
_mbus_set_wakeup_timeout:
;mbus_hw.c,2165 :: 		status_t mbus_set_wakeup_timeout( uint8_t ms )
; ms start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; ms end address is: 0 (R0)
; ms start address is: 12 (R3)
;mbus_hw.c,2168 :: 		uint8_t buffer[8] = REG_WRITE xstr( WAKE_UP_TIME_OUT_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_wakeup_timeout_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_wakeup_timeout_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,2170 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2171 :: 		IntToStr( ms, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; ms end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,2172 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,2173 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2174 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2176 :: 		while ( !response_finished );
L_mbus_set_wakeup_timeout384:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_wakeup_timeout385
IT	AL
BAL	L_mbus_set_wakeup_timeout384
L_mbus_set_wakeup_timeout385:
;mbus_hw.c,2178 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_wakeup_timeout386
;mbus_hw.c,2179 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_wakeup_timeout
L_mbus_set_wakeup_timeout386:
;mbus_hw.c,2181 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2182 :: 		}
L_end_mbus_set_wakeup_timeout:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_wakeup_timeout
_mbus_set_sleep_time:
;mbus_hw.c,2184 :: 		status_t mbus_set_sleep_time( uint8_t ms )
; ms start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; ms end address is: 0 (R0)
; ms start address is: 12 (R3)
;mbus_hw.c,2187 :: 		uint8_t buffer[8] = REG_WRITE xstr( SLEEP_TIME_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_sleep_time_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_sleep_time_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,2189 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2190 :: 		IntToStr( ms, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; ms end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,2191 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,2192 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2193 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2195 :: 		while ( !response_finished );
L_mbus_set_sleep_time388:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_sleep_time389
IT	AL
BAL	L_mbus_set_sleep_time388
L_mbus_set_sleep_time389:
;mbus_hw.c,2197 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_sleep_time390
;mbus_hw.c,2198 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_sleep_time
L_mbus_set_sleep_time390:
;mbus_hw.c,2200 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2201 :: 		}
L_end_mbus_set_sleep_time:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_sleep_time
_mbus_set_rx_filter:
;mbus_hw.c,2203 :: 		status_t mbus_set_rx_filter( rx_filter_t filter )
; filter start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; filter end address is: 0 (R0)
; filter start address is: 12 (R3)
;mbus_hw.c,2206 :: 		uint8_t buffer[8] = REG_WRITE xstr( RX_FILTER_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_rx_filter_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_rx_filter_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,2208 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2209 :: 		IntToStr( filter, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; filter end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,2210 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,2211 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2212 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2214 :: 		while ( !response_finished );
L_mbus_set_rx_filter392:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_rx_filter393
IT	AL
BAL	L_mbus_set_rx_filter392
L_mbus_set_rx_filter393:
;mbus_hw.c,2216 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_rx_filter394
;mbus_hw.c,2217 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_rx_filter
L_mbus_set_rx_filter394:
;mbus_hw.c,2219 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2220 :: 		}
L_end_mbus_set_rx_filter:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_rx_filter
_mbus_set_tx_options:
;mbus_hw.c,2222 :: 		status_t mbus_set_tx_options( tx_option_t option )
; option start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; option end address is: 0 (R0)
; option start address is: 12 (R3)
;mbus_hw.c,2225 :: 		uint8_t buffer[8] = REG_WRITE xstr( TX_OPTIONS_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_tx_options_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_tx_options_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,2227 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2228 :: 		IntToStr( option, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; option end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,2229 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,2230 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2231 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2233 :: 		while ( !response_finished );
L_mbus_set_tx_options396:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_tx_options397
IT	AL
BAL	L_mbus_set_tx_options396
L_mbus_set_tx_options397:
;mbus_hw.c,2235 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_tx_options398
;mbus_hw.c,2236 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_tx_options
L_mbus_set_tx_options398:
;mbus_hw.c,2238 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2239 :: 		}
L_end_mbus_set_tx_options:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_tx_options
_mbus_set_registered_meter_options:
;mbus_hw.c,2241 :: 		status_t mbus_set_registered_meter_options( meter_options_t option )
; option start address is: 0 (R0)
SUB	SP, SP, #28
STR	LR, [SP, #0]
UXTB	R3, R0
; option end address is: 0 (R0)
; option start address is: 12 (R3)
;mbus_hw.c,2244 :: 		uint8_t buffer[14] = REG_WRITE xstr( REGISTER_METER_OPTIONS_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #14
MOVW	R12, #lo_addr(?ICSmbus_set_registered_meter_options_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_registered_meter_options_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,2246 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2247 :: 		IntToStr( option, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; option end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,2248 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,2249 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2250 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2252 :: 		while ( !response_finished );
L_mbus_set_registered_meter_options400:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_registered_meter_options401
IT	AL
BAL	L_mbus_set_registered_meter_options400
L_mbus_set_registered_meter_options401:
;mbus_hw.c,2254 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_registered_meter_options402
;mbus_hw.c,2255 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_registered_meter_options
L_mbus_set_registered_meter_options402:
;mbus_hw.c,2257 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2259 :: 		}
L_end_mbus_set_registered_meter_options:
LDR	LR, [SP, #0]
ADD	SP, SP, #28
BX	LR
; end of _mbus_set_registered_meter_options
_mbus_set_manufac_address:
;mbus_hw.c,2261 :: 		status_t mbus_set_manufac_address( uint8_t *address )
SUB	SP, SP, #44
STR	LR, [SP, #0]
STR	R0, [SP, #40]
;mbus_hw.c,2263 :: 		char txt[8] = { 0 };
ADD	R11, SP, #4
ADD	R10, R11, #36
MOVW	R12, #lo_addr(?ICSmbus_set_manufac_address_txt_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_manufac_address_txt_L0+0)
BL	___CC2DW+0
;mbus_hw.c,2264 :: 		uint8_t tmp = 0;
;mbus_hw.c,2265 :: 		uint8_t buffer[2][14] = { 0 };
;mbus_hw.c,2267 :: 		strcat( buffer[0], REG_WRITE xstr( MANUFAC_ADDRESS_REG_0 ) REG_WRITE_MIDDLE );
MOVW	R2, #lo_addr(?lstr44_mbus_hw+0)
MOVT	R2, #hi_addr(?lstr44_mbus_hw+0)
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2268 :: 		strcat( buffer[1], REG_WRITE xstr( MANUFAC_ADDRESS_REG_1 ) REG_WRITE_MIDDLE );
MOVW	R2, #lo_addr(?lstr45_mbus_hw+0)
MOVT	R2, #hi_addr(?lstr45_mbus_hw+0)
ADD	R1, SP, #12
ADDS	R1, #14
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2270 :: 		tmp = address[0];
LDR	R1, [SP, #40]
LDRB	R3, [R1, #0]
; tmp start address is: 12 (R3)
;mbus_hw.c,2271 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2272 :: 		IntToStr( tmp, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; tmp end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,2273 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,2274 :: 		strcat( buffer[0], txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2275 :: 		mbus_write_reg( buffer[0] );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2276 :: 		txt[0] = 0;
ADD	R2, SP, #4
MOVS	R1, #0
STRB	R1, [R2, #0]
;mbus_hw.c,2278 :: 		while ( !response_finished );
L_mbus_set_manufac_address403:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_manufac_address404
IT	AL
BAL	L_mbus_set_manufac_address403
L_mbus_set_manufac_address404:
;mbus_hw.c,2280 :: 		tmp = address[1];
LDR	R1, [SP, #40]
ADDS	R1, R1, #1
LDRB	R1, [R1, #0]
; tmp start address is: 12 (R3)
UXTB	R3, R1
;mbus_hw.c,2281 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2282 :: 		IntToStr( tmp, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; tmp end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,2283 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,2284 :: 		strcat( buffer[1], txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
ADDS	R1, #14
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2285 :: 		mbus_write_reg( buffer[1] );
ADD	R1, SP, #12
ADDS	R1, #14
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2286 :: 		txt[0] = 0;
ADD	R2, SP, #4
MOVS	R1, #0
STRB	R1, [R2, #0]
;mbus_hw.c,2288 :: 		while ( !response_finished );
L_mbus_set_manufac_address405:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_manufac_address406
IT	AL
BAL	L_mbus_set_manufac_address405
L_mbus_set_manufac_address406:
;mbus_hw.c,2290 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2292 :: 		}
L_end_mbus_set_manufac_address:
LDR	LR, [SP, #0]
ADD	SP, SP, #44
BX	LR
; end of _mbus_set_manufac_address
_mbus_set_meter_address:
;mbus_hw.c,2294 :: 		status_t mbus_set_meter_address( uint8_t *address )
SUB	SP, SP, #132
STR	LR, [SP, #0]
STR	R0, [SP, #128]
;mbus_hw.c,2296 :: 		char txt[8] = { 0 };
ADD	R11, SP, #4
ADD	R10, R11, #120
MOVW	R12, #lo_addr(?ICSmbus_set_meter_address_txt_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_meter_address_txt_L0+0)
BL	___CC2DW+0
;mbus_hw.c,2297 :: 		uint8_t tmp = 0;
;mbus_hw.c,2298 :: 		uint8_t i   = 0;
;mbus_hw.c,2299 :: 		uint8_t buffer[8][14] = { 0 };
;mbus_hw.c,2301 :: 		strcat( buffer[0], REG_WRITE xstr( METER_ADDRESS_REG_0 ) REG_WRITE_MIDDLE );
MOVW	R2, #lo_addr(?lstr46_mbus_hw+0)
MOVT	R2, #hi_addr(?lstr46_mbus_hw+0)
ADD	R1, SP, #13
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2302 :: 		strcat( buffer[1], REG_WRITE xstr( METER_ADDRESS_REG_1 ) REG_WRITE_MIDDLE );
MOVW	R2, #lo_addr(?lstr47_mbus_hw+0)
MOVT	R2, #hi_addr(?lstr47_mbus_hw+0)
ADD	R1, SP, #13
ADDS	R1, #14
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2303 :: 		strcat( buffer[2], REG_WRITE xstr( METER_ADDRESS_REG_2 ) REG_WRITE_MIDDLE );
MOVW	R2, #lo_addr(?lstr48_mbus_hw+0)
MOVT	R2, #hi_addr(?lstr48_mbus_hw+0)
ADD	R1, SP, #13
ADDS	R1, #28
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2304 :: 		strcat( buffer[3], REG_WRITE xstr( METER_ADDRESS_REG_3 ) REG_WRITE_MIDDLE );
MOVW	R2, #lo_addr(?lstr49_mbus_hw+0)
MOVT	R2, #hi_addr(?lstr49_mbus_hw+0)
ADD	R1, SP, #13
ADDS	R1, #42
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2305 :: 		strcat( buffer[4], REG_WRITE xstr( METER_ADDRESS_REG_4 ) REG_WRITE_MIDDLE );
MOVW	R2, #lo_addr(?lstr50_mbus_hw+0)
MOVT	R2, #hi_addr(?lstr50_mbus_hw+0)
ADD	R1, SP, #13
ADDS	R1, #56
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2306 :: 		strcat( buffer[5], REG_WRITE xstr( METER_ADDRESS_REG_5 ) REG_WRITE_MIDDLE );
MOVW	R2, #lo_addr(?lstr51_mbus_hw+0)
MOVT	R2, #hi_addr(?lstr51_mbus_hw+0)
ADD	R1, SP, #13
ADDS	R1, #70
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2308 :: 		for ( i = 0; i < 6; i++ )
MOVS	R1, #0
STRB	R1, [SP, #12]
L_mbus_set_meter_address407:
LDRB	R1, [SP, #12]
CMP	R1, #6
IT	CS
BCS	L_mbus_set_meter_address408
;mbus_hw.c,2310 :: 		tmp = address[i];
LDRB	R2, [SP, #12]
LDR	R1, [SP, #128]
ADDS	R1, R1, R2
LDRB	R1, [R1, #0]
; tmp start address is: 12 (R3)
UXTB	R3, R1
;mbus_hw.c,2311 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2312 :: 		IntToStr( tmp, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; tmp end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,2313 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,2314 :: 		strcat( buffer[i], txt );
ADD	R4, SP, #4
ADD	R3, SP, #13
LDRB	R2, [SP, #12]
MOVS	R1, #14
MULS	R1, R2, R1
ADDS	R1, R3, R1
MOV	R0, R1
MOV	R1, R4
BL	_strcat+0
;mbus_hw.c,2315 :: 		mbus_write_reg( buffer[i] );
ADD	R3, SP, #13
LDRB	R2, [SP, #12]
MOVS	R1, #14
MULS	R1, R2, R1
ADDS	R1, R3, R1
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2316 :: 		txt[0] = 0;
ADD	R2, SP, #4
MOVS	R1, #0
STRB	R1, [R2, #0]
;mbus_hw.c,2318 :: 		while ( !response_finished );
L_mbus_set_meter_address410:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_meter_address411
IT	AL
BAL	L_mbus_set_meter_address410
L_mbus_set_meter_address411:
;mbus_hw.c,2308 :: 		for ( i = 0; i < 6; i++ )
LDRB	R1, [SP, #12]
ADDS	R1, R1, #1
STRB	R1, [SP, #12]
;mbus_hw.c,2319 :: 		}
IT	AL
BAL	L_mbus_set_meter_address407
L_mbus_set_meter_address408:
;mbus_hw.c,2321 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2322 :: 		}
L_end_mbus_set_meter_address:
LDR	LR, [SP, #0]
ADD	SP, SP, #132
BX	LR
; end of _mbus_set_meter_address
_mbus_set_meter_key:
;mbus_hw.c,2324 :: 		status_t mbus_set_meter_key( uint8_t *key, encryption_type_t type )
; type start address is: 4 (R1)
SUB	SP, SP, #244
STR	LR, [SP, #0]
STR	R0, [SP, #240]
UXTB	R6, R1
; type end address is: 4 (R1)
; type start address is: 24 (R6)
;mbus_hw.c,2327 :: 		uint8_t top = 0;
;mbus_hw.c,2328 :: 		uint8_t tmp = 0;
;mbus_hw.c,2329 :: 		uint8_t i   = 0;
;mbus_hw.c,2330 :: 		uint8_t buffer[16][14] = { 0 };
ADD	R11, SP, #14
ADD	R10, R11, #224
MOVW	R12, #lo_addr(?ICSmbus_set_meter_key_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_meter_key_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,2332 :: 		strcat( buffer[0], REG_WRITE xstr( METER_KEY_REG_0 ) REG_WRITE_MIDDLE );
MOVW	R3, #lo_addr(?lstr52_mbus_hw+0)
MOVT	R3, #hi_addr(?lstr52_mbus_hw+0)
ADD	R2, SP, #14
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;mbus_hw.c,2333 :: 		strcat( buffer[1], REG_WRITE xstr( METER_KEY_REG_1 ) REG_WRITE_MIDDLE );
MOVW	R3, #lo_addr(?lstr53_mbus_hw+0)
MOVT	R3, #hi_addr(?lstr53_mbus_hw+0)
ADD	R2, SP, #14
ADDS	R2, #14
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;mbus_hw.c,2334 :: 		strcat( buffer[2], REG_WRITE xstr( METER_KEY_REG_2 ) REG_WRITE_MIDDLE );
MOVW	R3, #lo_addr(?lstr54_mbus_hw+0)
MOVT	R3, #hi_addr(?lstr54_mbus_hw+0)
ADD	R2, SP, #14
ADDS	R2, #28
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;mbus_hw.c,2335 :: 		strcat( buffer[3], REG_WRITE xstr( METER_KEY_REG_3 ) REG_WRITE_MIDDLE );
MOVW	R3, #lo_addr(?lstr55_mbus_hw+0)
MOVT	R3, #hi_addr(?lstr55_mbus_hw+0)
ADD	R2, SP, #14
ADDS	R2, #42
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;mbus_hw.c,2336 :: 		strcat( buffer[4], REG_WRITE xstr( METER_KEY_REG_4 ) REG_WRITE_MIDDLE );
MOVW	R3, #lo_addr(?lstr56_mbus_hw+0)
MOVT	R3, #hi_addr(?lstr56_mbus_hw+0)
ADD	R2, SP, #14
ADDS	R2, #56
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;mbus_hw.c,2337 :: 		strcat( buffer[5], REG_WRITE xstr( METER_KEY_REG_5 ) REG_WRITE_MIDDLE );
MOVW	R3, #lo_addr(?lstr57_mbus_hw+0)
MOVT	R3, #hi_addr(?lstr57_mbus_hw+0)
ADD	R2, SP, #14
ADDS	R2, #70
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;mbus_hw.c,2338 :: 		strcat( buffer[6], REG_WRITE xstr( METER_KEY_REG_6 ) REG_WRITE_MIDDLE );
MOVW	R3, #lo_addr(?lstr58_mbus_hw+0)
MOVT	R3, #hi_addr(?lstr58_mbus_hw+0)
ADD	R2, SP, #14
ADDS	R2, #84
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;mbus_hw.c,2339 :: 		strcat( buffer[7], REG_WRITE xstr( METER_KEY_REG_7 ) REG_WRITE_MIDDLE );
MOVW	R3, #lo_addr(?lstr59_mbus_hw+0)
MOVT	R3, #hi_addr(?lstr59_mbus_hw+0)
ADD	R2, SP, #14
ADDS	R2, #98
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;mbus_hw.c,2340 :: 		strcat( buffer[8], REG_WRITE xstr( METER_KEY_REG_8 ) REG_WRITE_MIDDLE );
MOVW	R3, #lo_addr(?lstr60_mbus_hw+0)
MOVT	R3, #hi_addr(?lstr60_mbus_hw+0)
ADD	R2, SP, #14
ADDS	R2, #112
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;mbus_hw.c,2341 :: 		strcat( buffer[9], REG_WRITE xstr( METER_KEY_REG_9 ) REG_WRITE_MIDDLE );
MOVW	R3, #lo_addr(?lstr61_mbus_hw+0)
MOVT	R3, #hi_addr(?lstr61_mbus_hw+0)
ADD	R2, SP, #14
ADDS	R2, #126
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;mbus_hw.c,2342 :: 		strcat( buffer[10], REG_WRITE xstr( METER_KEY_REG_10 ) REG_WRITE_MIDDLE );
MOVW	R3, #lo_addr(?lstr62_mbus_hw+0)
MOVT	R3, #hi_addr(?lstr62_mbus_hw+0)
ADD	R2, SP, #14
ADDS	R2, #140
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;mbus_hw.c,2343 :: 		strcat( buffer[11], REG_WRITE xstr( METER_KEY_REG_11 ) REG_WRITE_MIDDLE );
MOVW	R3, #lo_addr(?lstr63_mbus_hw+0)
MOVT	R3, #hi_addr(?lstr63_mbus_hw+0)
ADD	R2, SP, #14
ADDS	R2, #154
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;mbus_hw.c,2344 :: 		strcat( buffer[12], REG_WRITE xstr( METER_KEY_REG_12 ) REG_WRITE_MIDDLE );
MOVW	R3, #lo_addr(?lstr64_mbus_hw+0)
MOVT	R3, #hi_addr(?lstr64_mbus_hw+0)
ADD	R2, SP, #14
ADDS	R2, #168
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;mbus_hw.c,2345 :: 		strcat( buffer[13], REG_WRITE xstr( METER_KEY_REG_13 ) REG_WRITE_MIDDLE );
MOVW	R3, #lo_addr(?lstr65_mbus_hw+0)
MOVT	R3, #hi_addr(?lstr65_mbus_hw+0)
ADD	R2, SP, #14
ADDS	R2, #182
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;mbus_hw.c,2346 :: 		strcat( buffer[14], REG_WRITE xstr( METER_KEY_REG_14 ) REG_WRITE_MIDDLE );
MOVW	R3, #lo_addr(?lstr66_mbus_hw+0)
MOVT	R3, #hi_addr(?lstr66_mbus_hw+0)
ADD	R2, SP, #14
ADDS	R2, #196
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;mbus_hw.c,2347 :: 		strcat( buffer[15], REG_WRITE xstr( METER_KEY_REG_15 ) REG_WRITE_MIDDLE );
MOVW	R3, #lo_addr(?lstr67_mbus_hw+0)
MOVT	R3, #hi_addr(?lstr67_mbus_hw+0)
ADD	R2, SP, #14
ADDS	R2, #210
MOV	R1, R3
MOV	R0, R2
BL	_strcat+0
;mbus_hw.c,2349 :: 		if ( type == DES_MODE )
CMP	R6, #0
IT	NE
BNE	L_mbus_set_meter_key412
; type end address is: 24 (R6)
;mbus_hw.c,2350 :: 		top = 8;
MOVS	R2, #8
STRB	R2, [SP, #12]
IT	AL
BAL	L_mbus_set_meter_key413
L_mbus_set_meter_key412:
;mbus_hw.c,2351 :: 		else if ( type == AES_MODE )
; type start address is: 24 (R6)
CMP	R6, #1
IT	NE
BNE	L_mbus_set_meter_key414
; type end address is: 24 (R6)
;mbus_hw.c,2352 :: 		top = 16;
MOVS	R2, #16
STRB	R2, [SP, #12]
IT	AL
BAL	L_mbus_set_meter_key415
L_mbus_set_meter_key414:
;mbus_hw.c,2354 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_meter_key
L_mbus_set_meter_key415:
L_mbus_set_meter_key413:
;mbus_hw.c,2356 :: 		for ( i = 0; i < top; i++ )
MOVS	R2, #0
STRB	R2, [SP, #13]
L_mbus_set_meter_key416:
LDRB	R3, [SP, #12]
LDRB	R2, [SP, #13]
CMP	R2, R3
IT	CS
BCS	L_mbus_set_meter_key417
;mbus_hw.c,2358 :: 		tmp = key[i];
LDRB	R3, [SP, #13]
LDR	R2, [SP, #240]
ADDS	R2, R2, R3
LDRB	R2, [R2, #0]
; tmp start address is: 12 (R3)
UXTB	R3, R2
;mbus_hw.c,2359 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2360 :: 		IntToStr( tmp, txt );
ADD	R2, SP, #4
MOV	R1, R2
UXTB	R0, R3
; tmp end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,2361 :: 		Ltrim( txt );
ADD	R2, SP, #4
MOV	R0, R2
BL	_Ltrim+0
;mbus_hw.c,2362 :: 		strcat( buffer[i], txt );
ADD	R5, SP, #4
ADD	R4, SP, #14
LDRB	R3, [SP, #13]
MOVS	R2, #14
MULS	R2, R3, R2
ADDS	R2, R4, R2
MOV	R1, R5
MOV	R0, R2
BL	_strcat+0
;mbus_hw.c,2363 :: 		mbus_write_reg( buffer[i] );
ADD	R4, SP, #14
LDRB	R3, [SP, #13]
MOVS	R2, #14
MULS	R2, R3, R2
ADDS	R2, R4, R2
MOV	R0, R2
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2364 :: 		txt[0] = 0;
ADD	R3, SP, #4
MOVS	R2, #0
STRB	R2, [R3, #0]
;mbus_hw.c,2366 :: 		while ( !response_finished );
L_mbus_set_meter_key419:
MOVW	R2, #lo_addr(mbus_hw_response_finished+0)
MOVT	R2, #hi_addr(mbus_hw_response_finished+0)
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	NE
BNE	L_mbus_set_meter_key420
IT	AL
BAL	L_mbus_set_meter_key419
L_mbus_set_meter_key420:
;mbus_hw.c,2356 :: 		for ( i = 0; i < top; i++ )
LDRB	R2, [SP, #13]
ADDS	R2, R2, #1
STRB	R2, [SP, #13]
;mbus_hw.c,2368 :: 		}
IT	AL
BAL	L_mbus_set_meter_key416
L_mbus_set_meter_key417:
;mbus_hw.c,2370 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2371 :: 		}
L_end_mbus_set_meter_key:
LDR	LR, [SP, #0]
ADD	SP, SP, #244
BX	LR
; end of _mbus_set_meter_key
_mbus_set_indications:
;mbus_hw.c,2373 :: 		status_t mbus_set_indications( bool enable )
; enable start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; enable end address is: 0 (R0)
; enable start address is: 12 (R3)
;mbus_hw.c,2376 :: 		uint8_t buffer[8] = REG_WRITE xstr( INDICATIONS_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_indications_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_indications_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,2378 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2379 :: 		if ( enable )
CMP	R3, #0
IT	EQ
BEQ	L_mbus_set_indications421
; enable end address is: 12 (R3)
;mbus_hw.c,2380 :: 		txt[0] = "1";
ADD	R2, SP, #4
MOVS	R1, #lo_addr(?lstr_68_mbus_hw+0)
STRB	R1, [R2, #0]
IT	AL
BAL	L_mbus_set_indications422
L_mbus_set_indications421:
;mbus_hw.c,2382 :: 		txt[0] = "0";
ADD	R2, SP, #4
MOVS	R1, #lo_addr(?lstr_69_mbus_hw+0)
STRB	R1, [R2, #0]
L_mbus_set_indications422:
;mbus_hw.c,2383 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,2384 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2385 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2387 :: 		while ( !response_finished );
L_mbus_set_indications423:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_indications424
IT	AL
BAL	L_mbus_set_indications423
L_mbus_set_indications424:
;mbus_hw.c,2389 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_indications425
;mbus_hw.c,2390 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_indications
L_mbus_set_indications425:
;mbus_hw.c,2392 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2394 :: 		}
L_end_mbus_set_indications:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_indications
_mbus_set_lbt_threshold:
;mbus_hw.c,2396 :: 		status_t mbus_set_lbt_threshold( uint8_t threshold )
; threshold start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; threshold end address is: 0 (R0)
; threshold start address is: 12 (R3)
;mbus_hw.c,2399 :: 		uint8_t buffer[8] = REG_WRITE xstr( LBT_THRESHOLD_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_lbt_threshold_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_lbt_threshold_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,2401 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2402 :: 		IntToStr( threshold, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; threshold end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,2403 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,2404 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2405 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2407 :: 		while ( !response_finished );
L_mbus_set_lbt_threshold427:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_lbt_threshold428
IT	AL
BAL	L_mbus_set_lbt_threshold427
L_mbus_set_lbt_threshold428:
;mbus_hw.c,2409 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_lbt_threshold429
;mbus_hw.c,2410 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_lbt_threshold
L_mbus_set_lbt_threshold429:
;mbus_hw.c,2412 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2413 :: 		}
L_end_mbus_set_lbt_threshold:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_lbt_threshold
_mbus_set_lbt_advanced_opt:
;mbus_hw.c,2415 :: 		status_t mbus_set_lbt_advanced_opt( lbt_options_t option )
; option start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; option end address is: 0 (R0)
; option start address is: 12 (R3)
;mbus_hw.c,2418 :: 		uint8_t buffer[8] = REG_WRITE xstr( LBT_ADVANCED_OPTIONS_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_lbt_advanced_opt_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_lbt_advanced_opt_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,2420 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2421 :: 		IntToStr( option, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; option end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,2422 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,2423 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2424 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2426 :: 		while ( !response_finished );
L_mbus_set_lbt_advanced_opt431:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_lbt_advanced_opt432
IT	AL
BAL	L_mbus_set_lbt_advanced_opt431
L_mbus_set_lbt_advanced_opt432:
;mbus_hw.c,2428 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_lbt_advanced_opt433
;mbus_hw.c,2429 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_lbt_advanced_opt
L_mbus_set_lbt_advanced_opt433:
;mbus_hw.c,2431 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2432 :: 		}
L_end_mbus_set_lbt_advanced_opt:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_lbt_advanced_opt
_mbus_set_single_channel_lbt_bo_max:
;mbus_hw.c,2434 :: 		status_t mbus_set_single_channel_lbt_bo_max( uint8_t max )
; max start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; max end address is: 0 (R0)
; max start address is: 12 (R3)
;mbus_hw.c,2437 :: 		uint8_t buffer[8] = REG_WRITE xstr( SINGLE_CHNL_LBT_BO_MAX_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_single_channel_lbt_bo_max_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_single_channel_lbt_bo_max_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,2439 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2440 :: 		IntToStr( max, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; max end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,2441 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,2442 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2443 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2445 :: 		while ( !response_finished );
L_mbus_set_single_channel_lbt_bo_max435:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_single_channel_lbt_bo_max436
IT	AL
BAL	L_mbus_set_single_channel_lbt_bo_max435
L_mbus_set_single_channel_lbt_bo_max436:
;mbus_hw.c,2447 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_single_channel_lbt_bo_max437
;mbus_hw.c,2448 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_single_channel_lbt_bo_max
L_mbus_set_single_channel_lbt_bo_max437:
;mbus_hw.c,2450 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2451 :: 		}
L_end_mbus_set_single_channel_lbt_bo_max:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_single_channel_lbt_bo_max
_mbus_set_single_channel_lbt_bo_flat:
;mbus_hw.c,2453 :: 		status_t mbus_set_single_channel_lbt_bo_flat( uint8_t flat )
; flat start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; flat end address is: 0 (R0)
; flat start address is: 12 (R3)
;mbus_hw.c,2456 :: 		uint8_t buffer[8] = REG_WRITE xstr( SINGLE_CHNL_LBT_BO_FLAT_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_single_channel_lbt_bo_flat_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_single_channel_lbt_bo_flat_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,2458 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2459 :: 		IntToStr( flat, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; flat end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,2460 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,2461 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2462 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2464 :: 		while ( !response_finished );
L_mbus_set_single_channel_lbt_bo_flat439:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_single_channel_lbt_bo_flat440
IT	AL
BAL	L_mbus_set_single_channel_lbt_bo_flat439
L_mbus_set_single_channel_lbt_bo_flat440:
;mbus_hw.c,2466 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_single_channel_lbt_bo_flat441
;mbus_hw.c,2467 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_single_channel_lbt_bo_flat
L_mbus_set_single_channel_lbt_bo_flat441:
;mbus_hw.c,2469 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2470 :: 		}
L_end_mbus_set_single_channel_lbt_bo_flat:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_single_channel_lbt_bo_flat
_mbus_set_single_channel_lbt_delay:
;mbus_hw.c,2472 :: 		status_t mbus_set_single_channel_lbt_delay( uint8_t ms )
; ms start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; ms end address is: 0 (R0)
; ms start address is: 12 (R3)
;mbus_hw.c,2475 :: 		uint8_t buffer[8] = REG_WRITE xstr( SINGLE_CHNL_LBT_DELAY_REG ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_single_channel_lbt_delay_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_single_channel_lbt_delay_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,2477 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2478 :: 		IntToStr( ms, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; ms end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,2479 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,2480 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2481 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2483 :: 		while ( !response_finished );
L_mbus_set_single_channel_lbt_delay443:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_single_channel_lbt_delay444
IT	AL
BAL	L_mbus_set_single_channel_lbt_delay443
L_mbus_set_single_channel_lbt_delay444:
;mbus_hw.c,2485 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_single_channel_lbt_delay445
;mbus_hw.c,2486 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_single_channel_lbt_delay
L_mbus_set_single_channel_lbt_delay445:
;mbus_hw.c,2488 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2489 :: 		}
L_end_mbus_set_single_channel_lbt_delay:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_single_channel_lbt_delay
_mbus_set_single_channel_lbt_bo_period:
;mbus_hw.c,2491 :: 		status_t mbus_set_single_channel_lbt_bo_period( uint16_t ms )
; ms start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTH	R3, R0
; ms end address is: 0 (R0)
; ms start address is: 12 (R3)
;mbus_hw.c,2494 :: 		uint8_t buffer[8] = REG_WRITE xstr( SINGLE_CHNL_LBT_BO_PERIOD ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_single_channel_lbt_bo_period_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_single_channel_lbt_bo_period_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,2496 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2497 :: 		LongToStr( ms, txt );
ADD	R1, SP, #4
UXTH	R0, R3
; ms end address is: 12 (R3)
BL	_LongToStr+0
;mbus_hw.c,2498 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,2499 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2500 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2502 :: 		while ( !response_finished );
L_mbus_set_single_channel_lbt_bo_period447:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_single_channel_lbt_bo_period448
IT	AL
BAL	L_mbus_set_single_channel_lbt_bo_period447
L_mbus_set_single_channel_lbt_bo_period448:
;mbus_hw.c,2504 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_single_channel_lbt_bo_period449
;mbus_hw.c,2505 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_single_channel_lbt_bo_period
L_mbus_set_single_channel_lbt_bo_period449:
;mbus_hw.c,2507 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2508 :: 		}
L_end_mbus_set_single_channel_lbt_bo_period:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_single_channel_lbt_bo_period
_mbus_set_multi_channel_lbt_bo_max:
;mbus_hw.c,2510 :: 		status_t mbus_set_multi_channel_lbt_bo_max( uint8_t max )
; max start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; max end address is: 0 (R0)
; max start address is: 12 (R3)
;mbus_hw.c,2513 :: 		uint8_t buffer[8] = REG_WRITE xstr( MULTI_CHNL_LBT_BO_MAX ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_multi_channel_lbt_bo_max_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_multi_channel_lbt_bo_max_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,2515 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2516 :: 		IntToStr( max, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; max end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,2517 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,2518 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2519 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2521 :: 		while ( !response_finished );
L_mbus_set_multi_channel_lbt_bo_max451:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_multi_channel_lbt_bo_max452
IT	AL
BAL	L_mbus_set_multi_channel_lbt_bo_max451
L_mbus_set_multi_channel_lbt_bo_max452:
;mbus_hw.c,2523 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_multi_channel_lbt_bo_max453
;mbus_hw.c,2524 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_multi_channel_lbt_bo_max
L_mbus_set_multi_channel_lbt_bo_max453:
;mbus_hw.c,2526 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2527 :: 		}
L_end_mbus_set_multi_channel_lbt_bo_max:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_multi_channel_lbt_bo_max
_mbus_set_multicast_address:
;mbus_hw.c,2529 :: 		status_t mbus_set_multicast_address( uint8_t *address )
SUB	SP, SP, #132
STR	LR, [SP, #0]
STR	R0, [SP, #128]
;mbus_hw.c,2531 :: 		char txt[8] = { 0 };
ADD	R11, SP, #4
ADD	R10, R11, #120
MOVW	R12, #lo_addr(?ICSmbus_set_multicast_address_txt_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_multicast_address_txt_L0+0)
BL	___CC2DW+0
;mbus_hw.c,2532 :: 		uint8_t tmp = 0;
;mbus_hw.c,2533 :: 		uint8_t i   = 0;
;mbus_hw.c,2534 :: 		uint8_t buffer[8][14] = { 0 };
;mbus_hw.c,2536 :: 		strcat( buffer[0], REG_WRITE xstr( MULTICAST_ADDRESS_REG_0 ) REG_WRITE_MIDDLE );
MOVW	R2, #lo_addr(?lstr70_mbus_hw+0)
MOVT	R2, #hi_addr(?lstr70_mbus_hw+0)
ADD	R1, SP, #13
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2537 :: 		strcat( buffer[1], REG_WRITE xstr( MULTICAST_ADDRESS_REG_1 ) REG_WRITE_MIDDLE );
MOVW	R2, #lo_addr(?lstr71_mbus_hw+0)
MOVT	R2, #hi_addr(?lstr71_mbus_hw+0)
ADD	R1, SP, #13
ADDS	R1, #14
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2538 :: 		strcat( buffer[2], REG_WRITE xstr( MULTICAST_ADDRESS_REG_2 ) REG_WRITE_MIDDLE );
MOVW	R2, #lo_addr(?lstr72_mbus_hw+0)
MOVT	R2, #hi_addr(?lstr72_mbus_hw+0)
ADD	R1, SP, #13
ADDS	R1, #28
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2539 :: 		strcat( buffer[3], REG_WRITE xstr( MULTICAST_ADDRESS_REG_3 ) REG_WRITE_MIDDLE );
MOVW	R2, #lo_addr(?lstr73_mbus_hw+0)
MOVT	R2, #hi_addr(?lstr73_mbus_hw+0)
ADD	R1, SP, #13
ADDS	R1, #42
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2540 :: 		strcat( buffer[4], REG_WRITE xstr( MULTICAST_ADDRESS_REG_4 ) REG_WRITE_MIDDLE );
MOVW	R2, #lo_addr(?lstr74_mbus_hw+0)
MOVT	R2, #hi_addr(?lstr74_mbus_hw+0)
ADD	R1, SP, #13
ADDS	R1, #56
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2541 :: 		strcat( buffer[5], REG_WRITE xstr( MULTICAST_ADDRESS_REG_5 ) REG_WRITE_MIDDLE );
MOVW	R2, #lo_addr(?lstr75_mbus_hw+0)
MOVT	R2, #hi_addr(?lstr75_mbus_hw+0)
ADD	R1, SP, #13
ADDS	R1, #70
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2542 :: 		strcat( buffer[6], REG_WRITE xstr( MULTICAST_ADDRESS_REG_6 ) REG_WRITE_MIDDLE );
MOVW	R2, #lo_addr(?lstr76_mbus_hw+0)
MOVT	R2, #hi_addr(?lstr76_mbus_hw+0)
ADD	R1, SP, #13
ADDS	R1, #84
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2543 :: 		strcat( buffer[7], REG_WRITE xstr( MULTICAST_ADDRESS_REG_7 ) REG_WRITE_MIDDLE );
MOVW	R2, #lo_addr(?lstr77_mbus_hw+0)
MOVT	R2, #hi_addr(?lstr77_mbus_hw+0)
ADD	R1, SP, #13
ADDS	R1, #98
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2545 :: 		for ( i = 0; i < 8; i++ )
MOVS	R1, #0
STRB	R1, [SP, #12]
L_mbus_set_multicast_address455:
LDRB	R1, [SP, #12]
CMP	R1, #8
IT	CS
BCS	L_mbus_set_multicast_address456
;mbus_hw.c,2547 :: 		tmp = address[i];
LDRB	R2, [SP, #12]
LDR	R1, [SP, #128]
ADDS	R1, R1, R2
LDRB	R1, [R1, #0]
; tmp start address is: 12 (R3)
UXTB	R3, R1
;mbus_hw.c,2548 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2549 :: 		IntToStr( tmp, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; tmp end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,2550 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,2551 :: 		strcat( buffer[i], txt );
ADD	R4, SP, #4
ADD	R3, SP, #13
LDRB	R2, [SP, #12]
MOVS	R1, #14
MULS	R1, R2, R1
ADDS	R1, R3, R1
MOV	R0, R1
MOV	R1, R4
BL	_strcat+0
;mbus_hw.c,2552 :: 		mbus_write_reg( buffer[i] );
ADD	R3, SP, #13
LDRB	R2, [SP, #12]
MOVS	R1, #14
MULS	R1, R2, R1
ADDS	R1, R3, R1
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2553 :: 		txt[0] = 0;
ADD	R2, SP, #4
MOVS	R1, #0
STRB	R1, [R2, #0]
;mbus_hw.c,2555 :: 		while ( !response_finished );
L_mbus_set_multicast_address458:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_multicast_address459
IT	AL
BAL	L_mbus_set_multicast_address458
L_mbus_set_multicast_address459:
;mbus_hw.c,2545 :: 		for ( i = 0; i < 8; i++ )
LDRB	R1, [SP, #12]
ADDS	R1, R1, #1
STRB	R1, [SP, #12]
;mbus_hw.c,2556 :: 		}
IT	AL
BAL	L_mbus_set_multicast_address455
L_mbus_set_multicast_address456:
;mbus_hw.c,2558 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2559 :: 		}
L_end_mbus_set_multicast_address:
LDR	LR, [SP, #0]
ADD	SP, SP, #132
BX	LR
; end of _mbus_set_multicast_address
_mbus_set_single_channel_lbt_ra_max:
;mbus_hw.c,2561 :: 		status_t mbus_set_single_channel_lbt_ra_max( uint8_t max )
; max start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; max end address is: 0 (R0)
; max start address is: 12 (R3)
;mbus_hw.c,2564 :: 		uint8_t buffer[8] = REG_WRITE xstr( SINGLE_CHNL_LBT_RA_MAX ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_single_channel_lbt_ra_max_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_single_channel_lbt_ra_max_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,2566 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2567 :: 		IntToStr( max, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; max end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,2568 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,2569 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2570 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2572 :: 		while ( !response_finished );
L_mbus_set_single_channel_lbt_ra_max460:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_single_channel_lbt_ra_max461
IT	AL
BAL	L_mbus_set_single_channel_lbt_ra_max460
L_mbus_set_single_channel_lbt_ra_max461:
;mbus_hw.c,2574 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_single_channel_lbt_ra_max462
;mbus_hw.c,2575 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_single_channel_lbt_ra_max
L_mbus_set_single_channel_lbt_ra_max462:
;mbus_hw.c,2577 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2578 :: 		}
L_end_mbus_set_single_channel_lbt_ra_max:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_single_channel_lbt_ra_max
_mbus_set_single_channel_lbt_ra_flat:
;mbus_hw.c,2580 :: 		status_t mbus_set_single_channel_lbt_ra_flat( uint8_t flat )
; flat start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; flat end address is: 0 (R0)
; flat start address is: 12 (R3)
;mbus_hw.c,2583 :: 		uint8_t buffer[8] = REG_WRITE xstr( SINGLE_CHNL_LBT_RA_FLAT ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_single_channel_lbt_ra_flat_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_single_channel_lbt_ra_flat_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,2585 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2586 :: 		IntToStr( flat, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; flat end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,2587 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,2588 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2589 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2591 :: 		while ( !response_finished );
L_mbus_set_single_channel_lbt_ra_flat464:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_single_channel_lbt_ra_flat465
IT	AL
BAL	L_mbus_set_single_channel_lbt_ra_flat464
L_mbus_set_single_channel_lbt_ra_flat465:
;mbus_hw.c,2593 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_single_channel_lbt_ra_flat466
;mbus_hw.c,2594 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_single_channel_lbt_ra_flat
L_mbus_set_single_channel_lbt_ra_flat466:
;mbus_hw.c,2596 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2597 :: 		}
L_end_mbus_set_single_channel_lbt_ra_flat:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_single_channel_lbt_ra_flat
_mbus_set_single_channel_lbt_ra_period:
;mbus_hw.c,2599 :: 		status_t mbus_set_single_channel_lbt_ra_period( uint8_t seconds )
; seconds start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; seconds end address is: 0 (R0)
; seconds start address is: 12 (R3)
;mbus_hw.c,2602 :: 		uint8_t buffer[8] = REG_WRITE xstr( SINGLE_CHNL_LBT_RA_PERIOD ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_single_channel_lbt_ra_period_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_single_channel_lbt_ra_period_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,2604 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2605 :: 		IntToStr( seconds, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; seconds end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,2606 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,2607 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2608 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2610 :: 		while ( !response_finished );
L_mbus_set_single_channel_lbt_ra_period468:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_single_channel_lbt_ra_period469
IT	AL
BAL	L_mbus_set_single_channel_lbt_ra_period468
L_mbus_set_single_channel_lbt_ra_period469:
;mbus_hw.c,2612 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_single_channel_lbt_ra_period470
;mbus_hw.c,2613 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_single_channel_lbt_ra_period
L_mbus_set_single_channel_lbt_ra_period470:
;mbus_hw.c,2615 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2616 :: 		}
L_end_mbus_set_single_channel_lbt_ra_period:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_single_channel_lbt_ra_period
_mbus_set_fac_options:
;mbus_hw.c,2618 :: 		status_t mbus_set_fac_options( fac_options_t option )
; option start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; option end address is: 0 (R0)
; option start address is: 12 (R3)
;mbus_hw.c,2621 :: 		uint8_t buffer[8] = REG_WRITE xstr( FAC_OPTIONS ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_fac_options_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_fac_options_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,2623 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2624 :: 		IntToStr( option, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; option end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,2625 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,2626 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2627 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2629 :: 		while ( !response_finished );
L_mbus_set_fac_options472:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_fac_options473
IT	AL
BAL	L_mbus_set_fac_options472
L_mbus_set_fac_options473:
;mbus_hw.c,2631 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_fac_options474
;mbus_hw.c,2632 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_fac_options
L_mbus_set_fac_options474:
;mbus_hw.c,2634 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2635 :: 		}
L_end_mbus_set_fac_options:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_fac_options
_mbus_set_fac_fast_tro_min:
;mbus_hw.c,2637 :: 		status_t mbus_set_fac_fast_tro_min( uint16_t min )
; min start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTH	R3, R0
; min end address is: 0 (R0)
; min start address is: 12 (R3)
;mbus_hw.c,2640 :: 		uint8_t buffer[8] = REG_WRITE xstr( FAC_FAST_TROMIN ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_fac_fast_tro_min_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_fac_fast_tro_min_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,2642 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2643 :: 		LongToStr( min, txt );
ADD	R1, SP, #4
UXTH	R0, R3
; min end address is: 12 (R3)
BL	_LongToStr+0
;mbus_hw.c,2644 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,2645 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2646 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2648 :: 		while ( !response_finished );
L_mbus_set_fac_fast_tro_min476:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_fac_fast_tro_min477
IT	AL
BAL	L_mbus_set_fac_fast_tro_min476
L_mbus_set_fac_fast_tro_min477:
;mbus_hw.c,2650 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_fac_fast_tro_min478
;mbus_hw.c,2651 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_fac_fast_tro_min
L_mbus_set_fac_fast_tro_min478:
;mbus_hw.c,2653 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2654 :: 		}
L_end_mbus_set_fac_fast_tro_min:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_fac_fast_tro_min
_mbus_set_fac_fast_tro_max:
;mbus_hw.c,2656 :: 		status_t mbus_set_fac_fast_tro_max( uint16_t max )
; max start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTH	R3, R0
; max end address is: 0 (R0)
; max start address is: 12 (R3)
;mbus_hw.c,2659 :: 		uint8_t buffer[8] = REG_WRITE xstr( FAC_FAST_TROMAX ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_fac_fast_tro_max_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_fac_fast_tro_max_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,2661 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2662 :: 		LongToStr( max, txt );
ADD	R1, SP, #4
UXTH	R0, R3
; max end address is: 12 (R3)
BL	_LongToStr+0
;mbus_hw.c,2663 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,2664 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2665 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2667 :: 		while ( !response_finished );
L_mbus_set_fac_fast_tro_max480:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_fac_fast_tro_max481
IT	AL
BAL	L_mbus_set_fac_fast_tro_max480
L_mbus_set_fac_fast_tro_max481:
;mbus_hw.c,2669 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_fac_fast_tro_max482
;mbus_hw.c,2670 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_fac_fast_tro_max
L_mbus_set_fac_fast_tro_max482:
;mbus_hw.c,2672 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2673 :: 		}
L_end_mbus_set_fac_fast_tro_max:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_fac_fast_tro_max
_mbus_set_fac_slow_tro_min:
;mbus_hw.c,2675 :: 		status_t mbus_set_fac_slow_tro_min( uint16_t min )
; min start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTH	R3, R0
; min end address is: 0 (R0)
; min start address is: 12 (R3)
;mbus_hw.c,2678 :: 		uint8_t buffer[8] = REG_WRITE xstr( FAC_SLOW_TROMIN ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_fac_slow_tro_min_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_fac_slow_tro_min_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,2680 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2681 :: 		LongToStr( min, txt );
ADD	R1, SP, #4
UXTH	R0, R3
; min end address is: 12 (R3)
BL	_LongToStr+0
;mbus_hw.c,2682 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,2683 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2684 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2686 :: 		while ( !response_finished );
L_mbus_set_fac_slow_tro_min484:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_fac_slow_tro_min485
IT	AL
BAL	L_mbus_set_fac_slow_tro_min484
L_mbus_set_fac_slow_tro_min485:
;mbus_hw.c,2688 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_fac_slow_tro_min486
;mbus_hw.c,2689 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_fac_slow_tro_min
L_mbus_set_fac_slow_tro_min486:
;mbus_hw.c,2691 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2692 :: 		}
L_end_mbus_set_fac_slow_tro_min:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_fac_slow_tro_min
_mbus_set_fac_slow_tro_max:
;mbus_hw.c,2694 :: 		status_t mbus_set_fac_slow_tro_max( uint16_t max )
; max start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTH	R3, R0
; max end address is: 0 (R0)
; max start address is: 12 (R3)
;mbus_hw.c,2697 :: 		uint8_t buffer[8] = REG_WRITE xstr( FAC_SLOW_TROMAX ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_fac_slow_tro_max_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_fac_slow_tro_max_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,2699 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2700 :: 		LongToStr( max, txt );
ADD	R1, SP, #4
UXTH	R0, R3
; max end address is: 12 (R3)
BL	_LongToStr+0
;mbus_hw.c,2701 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,2702 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2703 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2705 :: 		while ( !response_finished );
L_mbus_set_fac_slow_tro_max488:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_fac_slow_tro_max489
IT	AL
BAL	L_mbus_set_fac_slow_tro_max488
L_mbus_set_fac_slow_tro_max489:
;mbus_hw.c,2707 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_fac_slow_tro_max490
;mbus_hw.c,2708 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_fac_slow_tro_max
L_mbus_set_fac_slow_tro_max490:
;mbus_hw.c,2710 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2711 :: 		}
L_end_mbus_set_fac_slow_tro_max:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_fac_slow_tro_max
_mbus_set_fac_txd:
;mbus_hw.c,2713 :: 		status_t mbus_set_fac_txd( uint8_t trans_delay )
; trans_delay start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; trans_delay end address is: 0 (R0)
; trans_delay start address is: 12 (R3)
;mbus_hw.c,2716 :: 		uint8_t buffer[8] = REG_WRITE xstr( FAC_TXD ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_fac_txd_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_fac_txd_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,2718 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2719 :: 		IntToStr( trans_delay, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; trans_delay end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,2720 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,2721 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2722 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2724 :: 		while ( !response_finished );
L_mbus_set_fac_txd492:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_fac_txd493
IT	AL
BAL	L_mbus_set_fac_txd492
L_mbus_set_fac_txd493:
;mbus_hw.c,2726 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_fac_txd494
;mbus_hw.c,2727 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_fac_txd
L_mbus_set_fac_txd494:
;mbus_hw.c,2729 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2730 :: 		}
L_end_mbus_set_fac_txd:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_fac_txd
_mbus_set_fac_timeout:
;mbus_hw.c,2732 :: 		status_t mbus_set_fac_timeout( uint8_t timeout )
; timeout start address is: 0 (R0)
SUB	SP, SP, #20
STR	LR, [SP, #0]
UXTB	R3, R0
; timeout end address is: 0 (R0)
; timeout start address is: 12 (R3)
;mbus_hw.c,2735 :: 		uint8_t buffer[8] = REG_WRITE xstr( FAC_TIMEOUT ) REG_WRITE_MIDDLE;
ADD	R11, SP, #12
ADD	R10, R11, #8
MOVW	R12, #lo_addr(?ICSmbus_set_fac_timeout_buffer_L0+0)
MOVT	R12, #hi_addr(?ICSmbus_set_fac_timeout_buffer_L0+0)
BL	___CC2DW+0
;mbus_hw.c,2737 :: 		reset_flags_buffers();
BL	mbus_hw_reset_flags_buffers+0
;mbus_hw.c,2738 :: 		IntToStr( timeout, txt );
ADD	R1, SP, #4
UXTB	R0, R3
; timeout end address is: 12 (R3)
BL	_IntToStr+0
;mbus_hw.c,2739 :: 		Ltrim( txt );
ADD	R1, SP, #4
MOV	R0, R1
BL	_Ltrim+0
;mbus_hw.c,2740 :: 		strcat( buffer, txt );
ADD	R2, SP, #4
ADD	R1, SP, #12
MOV	R0, R1
MOV	R1, R2
BL	_strcat+0
;mbus_hw.c,2741 :: 		mbus_write_reg( buffer );
ADD	R1, SP, #12
MOV	R0, R1
BL	mbus_hw_mbus_write_reg+0
;mbus_hw.c,2743 :: 		while ( !response_finished );
L_mbus_set_fac_timeout496:
MOVW	R1, #lo_addr(mbus_hw_response_finished+0)
MOVT	R1, #hi_addr(mbus_hw_response_finished+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_mbus_set_fac_timeout497
IT	AL
BAL	L_mbus_set_fac_timeout496
L_mbus_set_fac_timeout497:
;mbus_hw.c,2745 :: 		if ( rx_buffer[0] == 'E' )
MOVW	R1, #lo_addr(mbus_hw_rx_buffer+0)
MOVT	R1, #hi_addr(mbus_hw_rx_buffer+0)
LDRB	R1, [R1, #0]
CMP	R1, #69
IT	NE
BNE	L_mbus_set_fac_timeout498
;mbus_hw.c,2746 :: 		return ERROR;
MOVS	R0, #2
IT	AL
BAL	L_end_mbus_set_fac_timeout
L_mbus_set_fac_timeout498:
;mbus_hw.c,2748 :: 		return OK_STATUS;
MOVS	R0, #1
;mbus_hw.c,2749 :: 		}
L_end_mbus_set_fac_timeout:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _mbus_set_fac_timeout
