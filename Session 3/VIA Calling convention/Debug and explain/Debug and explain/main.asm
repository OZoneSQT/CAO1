;
; Debug and explain.asm
;
; Created: 20-04-2020 12:16:06
; Author : skrue
;
; The following piece of code implements a function called delay_and_invert. The function takes 1
; input parameter, and return return 1 parameter. The input parameter is the number of 10ms delays
; (for instance will a input of 100 lead to a 1000ms delay). The output is the bitwise inverted value of
; portb. In the following code this function is used to toggle the test led (portb7) every second. This
; code can be run on the ATMega2560 and it will toggle output on PORTB.
;
; Exervise 1
;				0. The stack initialization
;				1. The call setup(s)
;				a. Allocation of the return value
;				b. The saving of the input parameters on the stack
;				2. The call site(s)
;				3. The saving of the working registers
;				4. The retrieving of the input values
;				5. The function body
;				6. The saving of the return values (SKIP this as there aren’t any)
;				7. The restoring of the working registers
;				8. The return from the function
;				9. The retrieving of the output value.
;				
; Exercise 2
;				Debug through the code to make sure you understand every step. When doing so, keep looking at
;				the Stack pointer, the stack, the X?pointer and the program counter (when debugging in the
;				simulator consider commenting out line 42, since the delay takes very long to execute in simulation
;				mode).
;				

    .INCLUDE "M2560DEF.INC"
    .ORG 00
    LDI R16, 0xFF
    OUT SPL, R16
    LDI R16, 0x21
    OUT SPH, R16
    
    LDI R16, 0xFF
    OUT DDRB, R16
    
    main_loop:
    PUSH R16
    LDI R16, 100
    PUSH R16
    CALL delay_and_invert
    POP R16
    POP R16
    OUT PORTB, R16
    JMP main_loop
    
    delay_and_invert:
    PUSH R16
    PUSH R17
    PUSH R26
    PUSH R27
    PUSH R18
    
    IN R26, SPL
    IN R27, SPH
    ADIW R26, 10
    LD R18, ?X

    _10msdelay:
    LDI R17, 160
    
	loop2:
    LDI R16, 199
    
	loop1:
    NOP
    NOP
    DEC R16
    BRNE loop1
    NOP
     NOP
    DEC r17
    BRNE loop2
    
    DEC r18
    BRNE _10msdelay
    
    IN r18, PORTB
    COM R18
    ADIW r26, 2
    ST ?X,R18
    
    POP R18
    POP R27
    POP R26
    POP R17
    POP R16
    RET