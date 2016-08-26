_mbus_hal_reset:
;mbus_hal.c,69 :: 		void mbus_hal_reset( void )
;mbus_hal.c,78 :: 		MBUS_RST = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(MBUS_RST+0)
MOVT	R0, #hi_addr(MBUS_RST+0)
STR	R1, [R0, #0]
;mbus_hal.c,79 :: 		Delay_ms( 100 );
MOVW	R7, #20351
MOVT	R7, #18
NOP
NOP
L_mbus_hal_reset0:
SUBS	R7, R7, #1
BNE	L_mbus_hal_reset0
NOP
NOP
NOP
;mbus_hal.c,80 :: 		MBUS_RST = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(MBUS_RST+0)
MOVT	R0, #hi_addr(MBUS_RST+0)
STR	R1, [R0, #0]
;mbus_hal.c,81 :: 		Delay_ms( 2500 );
MOVW	R7, #50047
MOVT	R7, #457
NOP
NOP
L_mbus_hal_reset2:
SUBS	R7, R7, #1
BNE	L_mbus_hal_reset2
NOP
NOP
NOP
;mbus_hal.c,82 :: 		MBUS_RST = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(MBUS_RST+0)
MOVT	R0, #hi_addr(MBUS_RST+0)
STR	R1, [R0, #0]
;mbus_hal.c,83 :: 		Delay_ms( 500 );
MOVW	R7, #36223
MOVT	R7, #91
NOP
NOP
L_mbus_hal_reset4:
SUBS	R7, R7, #1
BNE	L_mbus_hal_reset4
NOP
NOP
NOP
;mbus_hal.c,85 :: 		}
L_end_mbus_hal_reset:
BX	LR
; end of _mbus_hal_reset
_mbus_tx_ctl:
;mbus_hal.c,87 :: 		bool mbus_tx_ctl()
;mbus_hal.c,96 :: 		if ( MBUS_RTS == 0 )
MOVW	R1, #lo_addr(MBUS_RTS+0)
MOVT	R1, #hi_addr(MBUS_RTS+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_mbus_tx_ctl6
;mbus_hal.c,97 :: 		return true;
MOVS	R0, #1
IT	AL
BAL	L_end_mbus_tx_ctl
L_mbus_tx_ctl6:
;mbus_hal.c,99 :: 		return false;
MOVS	R0, #0
;mbus_hal.c,101 :: 		}
L_end_mbus_tx_ctl:
BX	LR
; end of _mbus_tx_ctl
_mbus_rx_ctl:
;mbus_hal.c,103 :: 		void mbus_rx_ctl( bool state )
; state start address is: 0 (R0)
; state end address is: 0 (R0)
; state start address is: 0 (R0)
;mbus_hal.c,112 :: 		if ( state )
CMP	R0, #0
IT	EQ
BEQ	L_mbus_rx_ctl8
; state end address is: 0 (R0)
;mbus_hal.c,113 :: 		MBUS_CTS = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(MBUS_CTS+0)
MOVT	R1, #hi_addr(MBUS_CTS+0)
STR	R2, [R1, #0]
IT	AL
BAL	L_mbus_rx_ctl9
L_mbus_rx_ctl8:
;mbus_hal.c,115 :: 		MBUS_CTS = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(MBUS_CTS+0)
MOVT	R1, #hi_addr(MBUS_CTS+0)
STR	R2, [R1, #0]
L_mbus_rx_ctl9:
;mbus_hal.c,117 :: 		}
L_end_mbus_rx_ctl:
BX	LR
; end of _mbus_rx_ctl
_mbus_hal_init:
;mbus_hal.c,119 :: 		void mbus_hal_init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;mbus_hal.c,128 :: 		write_uart_p            = UART_Wr_Ptr;
MOVW	R0, #lo_addr(_UART_Wr_Ptr+0)
MOVT	R0, #hi_addr(_UART_Wr_Ptr+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(mbus_hal_write_uart_p+0)
MOVT	R0, #hi_addr(mbus_hal_write_uart_p+0)
STR	R1, [R0, #0]
;mbus_hal.c,129 :: 		write_uart_text_p       = UART_Write_Text;
MOVW	R1, #lo_addr(_UART_Write_Text+0)
MOVT	R1, #hi_addr(_UART_Write_Text+0)
MOVW	R0, #lo_addr(mbus_hal_write_uart_text_p+0)
MOVT	R0, #hi_addr(mbus_hal_write_uart_text_p+0)
STR	R1, [R0, #0]
;mbus_hal.c,131 :: 		MBUS_RST = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(MBUS_RST+0)
MOVT	R0, #hi_addr(MBUS_RST+0)
STR	R1, [R0, #0]
;mbus_hal.c,132 :: 		Delay_ms(10);
MOVW	R7, #54463
MOVT	R7, #1
NOP
NOP
L_mbus_hal_init10:
SUBS	R7, R7, #1
BNE	L_mbus_hal_init10
NOP
NOP
NOP
;mbus_hal.c,133 :: 		MBUS_RST = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(MBUS_RST+0)
MOVT	R0, #hi_addr(MBUS_RST+0)
STR	R1, [R0, #0]
;mbus_hal.c,134 :: 		Delay_ms(100);
MOVW	R7, #20351
MOVT	R7, #18
NOP
NOP
L_mbus_hal_init12:
SUBS	R7, R7, #1
BNE	L_mbus_hal_init12
NOP
NOP
NOP
;mbus_hal.c,137 :: 		mbus_rx_ctl( true );
MOVS	R0, #1
BL	_mbus_rx_ctl+0
;mbus_hal.c,140 :: 		}
L_end_mbus_hal_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _mbus_hal_init
_mbus_hal_write_text:
;mbus_hal.c,142 :: 		void mbus_hal_write_text( uint8_t *buffer )
; buffer start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
MOV	R2, R0
; buffer end address is: 0 (R0)
;mbus_hal.c,151 :: 		while( !mbus_tx_ctl() );                        /**< Wait for clear to send */
L_mbus_hal_write_text14:
; buffer start address is: 8 (R2)
BL	_mbus_tx_ctl+0
CMP	R0, #0
IT	NE
BNE	L_mbus_hal_write_text15
IT	AL
BAL	L_mbus_hal_write_text14
L_mbus_hal_write_text15:
;mbus_hal.c,153 :: 		write_uart_text_p( buffer );
MOV	R0, R2
; buffer end address is: 8 (R2)
MOVW	R4, #lo_addr(mbus_hal_write_uart_text_p+0)
MOVT	R4, #hi_addr(mbus_hal_write_uart_text_p+0)
LDR	R4, [R4, #0]
BLX	R4
;mbus_hal.c,158 :: 		}
L_end_mbus_hal_write_text:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _mbus_hal_write_text
_mbus_hal_write:
;mbus_hal.c,160 :: 		void mbus_hal_write( uint8_t buffer )
; buffer start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; buffer end address is: 0 (R0)
; buffer start address is: 0 (R0)
UXTB	R2, R0
; buffer end address is: 0 (R0)
;mbus_hal.c,169 :: 		while( !mbus_tx_ctl() );                        /**< Wait for clear to send */
L_mbus_hal_write16:
; buffer start address is: 8 (R2)
BL	_mbus_tx_ctl+0
CMP	R0, #0
IT	NE
BNE	L_mbus_hal_write17
IT	AL
BAL	L_mbus_hal_write16
L_mbus_hal_write17:
;mbus_hal.c,171 :: 		write_uart_p( buffer );
UXTB	R0, R2
; buffer end address is: 8 (R2)
MOVW	R4, #lo_addr(mbus_hal_write_uart_p+0)
MOVT	R4, #hi_addr(mbus_hal_write_uart_p+0)
LDR	R4, [R4, #0]
BLX	R4
;mbus_hal.c,173 :: 		}
L_end_mbus_hal_write:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _mbus_hal_write
