;
; Fibonacci.asm
;
; Created: 20-04-2020 11:53:15
; Author : skrue
;
; Session 9 - Exercise 3

	LDI R16, 0x01
	LDI R17, 0x01
	CALL output
forever:
	ADD R16, R17
	; PUSH R16
	LDI R17, R16
	; POP R16
	ADD R16, R17
	CALL output
	JMP forever

output:
	
	; some output stuff

	RET