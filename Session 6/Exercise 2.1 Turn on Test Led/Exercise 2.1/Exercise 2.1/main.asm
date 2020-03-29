// TEST LED D7 -> OC4B
// OUT DDRC, Rxx = Input
// OUT DDRB, Rxx = Output
// OUT PORTC, Rxx = Pullup resistor

LDI R16, 0b10000000;
OUT DDRB, R16;
OUT PORTB, R16;