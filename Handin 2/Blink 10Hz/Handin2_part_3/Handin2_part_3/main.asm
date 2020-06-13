;
; Handin2_part_3.asm
;
; Created: 04-04-2020 11:11:56
; Author : skrue
;

; init
	LDI R16, 0h80	; ON
	LDI R17, 0h00	; OFF
	OUT PORTB, R16
		
; Run
forever:
	OUT DDRB, R16	;		1
	NOP				;		1
	NOP				;		1
	NOP				;		1
	CALL delay		;		4
					; sum	8

	OUT DDRB, R17	;		1
	CALL delay		;		4
	JMP forever		;		3
					; sum	8

; Timer Delay -> 1 ms
 
delay:	
	LDI R27, 0x00
	STS TCNT1H, R28
	STS TCHT1L, R28
	
	LDI R27, HIGH(16000-2)	; High, number of CLK (Counts from)
	STS OCR1AH, R27			; Load Timer
	LDI R27, LOW(16000-2)	; Low, number of CLK (Counts from)
	STS OCR1AL, R27			; Load normal

	LDI R27, 0x00
	STS TCCR1A, R27			; Flag for event has occurred
	LDI R27, 0x32			; Setpoint (ms)
	LDI TCCR1B, R27			; Flag for event has occurred

repeat:
	SBIS TIFR1, OC1FA		; Skip if flag is set
	RJMP repeat
	STS TCCR1B, R17 
	STS TCCR1A, R17 
	LDI R27, 1<<OC1FA
	OUT TIFR1, R17			; Reset event flag
	RET delay		
		

; Loop Delay -> ( 16.000.000.000 / 2 ) - 8 
delay:
	LDI R18, 255	;		1
	LDI R19, 255	;		1
	LDI R20, 255	;		1
	LDI R21, 204	;		1
	LDI R22, 211	;		1
	LDI R23, 108	;		1
	LDI R24, 121	;		1
	LDI R25, 121	;		1
	LDI R26, 2		;		1

loop4:
loop3:
loop2:
loop1:
	DEC R18			;		    1 * 255
	BRNE loop1		;		    2 * 255 - 1
					; part sum D  =               765
	DEC R19			;		    1 * 255
	BRNE loop2		;		    2 * 255 - 1
					; D,	  499 * 200		
					; part    C   =			   195.839
	DEC R20			;			1 * 255
	BRNE loop3		;			2 * 255 - 1
					; C,	30399 * 255
					; part sum B  =			49.939.709
	DEC R21			;			1 * 204
	BRNE loop4		;			2 * 204 - 1
					; part sum A =       7.990.353.919
					; remainder	 8.000.000.000 - 7.990.353.919 = 9.646.081 - 10 = 9.646.071
loop6:
loop5:
	DEC R22			;			1 * 211
	BRNE loop5:		;			2 * 211 -1
					; part sum E  =			44.520
	DEC R23			;			1 * 108
	BRNE loop6:		;			2 * 108 -1
					; part sum F  =			9.616.319
					; remainder	 9.646.071 - 9.616.319 = 29752
loop7:	
	DEC R24			;			1 * 121
	BRNE loop7		;			2 * 121 - 1
					; remainder	29753 - 29281 = 473
loop8:	
	DEC R25			;			1 * 15
	BRNE loop8		;			2 * 15 - 1
					; remainder	473 - 449 = 24
loop9:	
	DEC R26			;			1 * 20
	BRNE loop9		;			2 * 15 - 1
					; remainder	472 - 449 = 23

loop10:	
	DEC R26			;			2 * 2
	NOP				;			2 * 2
	BRNE loop9		;			2 * 2 - 1
					; remainder	23 - 15 = 8
	NOP				;			1
	NOP				;			1
	NOP				;			1
	NOP				;			1
	RET delay		;			4
					; sum		0

	