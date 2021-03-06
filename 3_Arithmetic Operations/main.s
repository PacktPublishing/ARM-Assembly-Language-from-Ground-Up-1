
;P = Q + R + S where Q = 2, R = 4, S = 5. In this case we are going to use register indirect addressing to access the
;variables. That is, we have to set up a pointer to the variables and access them via this pointer.

	
		AREA	SimpleAdd, CODE, READONLY
		EXPORT  __main

;ADR,ADRL pseudo-instruction loads a program-relative or register-relative address into a register.

__main		
		ADRL		R4,Vals		;R4 points to the vlaues area
		LDR			R1,[R4,#Q]  ;Load Q into r1
		LDR			R2,[R4,#R]
		LDR			R3,[R4,#S]
		ADD     	R0,R1,R2
		ADD     	R0,R0,R3
		STR			R0,[R4,#P]
		
Stop    B	    	Stop


P		EQU		0	;offset for P
Q		EQU		4	;offset for Q
R		EQU     8   ;offset for R
S       EQU     12  ;offset for S

		AREA	SimpleAdd, DATA,READONLY
Vals	SPACE	4	
		DCD		2
		DCD		4
		DCD		5

		ALIGN
		END

