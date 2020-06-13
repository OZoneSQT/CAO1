;
; IO Button to LED.asm
;
; Created: 06-04-2020 14:28:47
; Author : skrue
;
; D13 = PB7 = LED, R220 to GND
; D12 = PB6 = Button, R10K pull down to GND
;


; init
	LDI R16, 0x00
	OUT DDRB, R16	; Port 0-7 is cleared

seq:
	SBIC DDRB, 6	; Skip if pin D12 is Low
	CALL on
	SBIS DDRB, 6	; Skip if pin D12 is High
	Call off
	JMP seq

on:
	SBI DDRB, 7		; Set Pin D13 HIGH
	RET

off:
	CBI DDRB, 7		; Set Pin D13 LOW
	RET


