;
; Blink 10Hz.asm
;
; Created: 29-03-2020 23:39:58
; Author : skrue
;


; Replace with your application code

LDI R16, 0x80
LDI R17, 0x00
OUT PORTB, R16
loop:
OUT DDRB, R16
Call count
OUT DDRB, R17
Call count
JMP loop

; CLK pr mS = 160000 -> 16000 * 10*10^9 = CLK pr 10Hz
count:
LDI R22, 100
LDI R23, 160
loop1:
loop2:
loop3:
DEC R23
CALL sub_loop
BRNE loop3
DEC R22
CALL sub_loop
BRNE loop2
RET

; Loop = 10Hz = 10*10^9 = 10000000000ns
sub_loop:
LDI R18, 125
LDI R19, 200
LDI R20, 200
LDI R21, 200
loop4:
loop5:
loop6:
loop7:
DEC R21
BRNE loop7
DEC R20
BRNE loop6
DEC R19
BRNE loop5
DEC R18
BRNE loop4
RET
