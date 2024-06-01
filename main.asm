;
; LEDControl.asm
;
; Created: 01/06/2024 14:11:35
; Author : ASUS
;


.include"m328pdef.inc"

		.Cseg
		.Org 0x00

main: LDI R16,0xff ; Set R16 to 1111 1111
	  OUT DDRB,R16 ; Set Data direction register of pin B to out

	  LDI R16, 0x00 ; Set R16 to 0000 0000
	  OUT DDRD, R16 ; Set Data direction register of pin D to IN

Here: In R16,PIND   ; Store  input data of PIND in R16
	

Again:SBRC R16,4    ; if bit4 of R16=0 (clear) --> skip next instruction   
	  RJMP Over

	  LDI R17, 0x00 ;  Set R16 to 0000 0000
	  OUT PORTB,R17 ;  Set PORTB to low (LED SHUTDOWN)
	  RJMP Here     ;  Go to "Here" section to test again 

 Over:SBI PORTB,0	;  Set P0 to 1 (LED LIGHTSUP)
	  RJMP Here
