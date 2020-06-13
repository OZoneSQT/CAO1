;
; Add Values.asm
;
; Created: 04-04-2020 17:49:14
; Author : skrue
;


; Replace with your application code

	LDI R16, 0h02
	LDI R17, 0h07
	ADD R16, R17
	OUT PORTB, R16
	OUT DDRB, R16