// TEST LED D7 -> OC4B
// OUT DDRC, Rxx = Input
// OUT DDRB, Rxx = Output
// OUT PORTC, Rxx = Pullup resistor

LDI R16, 0b10000000;	// Set output high
OUT DDRB, R16;			// Set output pin
OUT PORTB, R16;			// Set output value
LDI R16, 0b00000000;	// Set output low
OUT PORTB, R16;			// Set output value
