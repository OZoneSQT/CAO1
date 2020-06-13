;
; Multiply Values.asm
;
; Created: 04-04-2020 17:58:10
; Author : skrue
;


; Replace with your application code

	LDI R17, 0x0E
	LDI R18, 0x0B
	MUL R17, R18
	OUT PORTA, R17
	OUT PORTB, R28
	OUT DDRA, R17
	OUT DDRB, R18