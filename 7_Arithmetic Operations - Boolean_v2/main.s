
	
		AREA	Bool, CODE, READONLY
		EXPORT  __main


__main
		LDR		R1,=2_0010000011110010 ;Set P
		LDR		R2,=2_0011000011110000 ;Set Q
		LDR		R3,=2_1100010011111000 ;Set R
		
		MOV		R4,R1,LSR	#9   ;Right justify P
		MOV		R5,R2,LSR	#1	 ;Right justify  Q
		MOV		R6,R3,LSR	#5	 ;Right justify R
		
		AND	    R7,R4,#0x3F		;Convert P to six significant bits right-justified
		AND		R8,R5,#0x3F		;do Q 
		AND		R9,R6,#0x3F		;do R
		
		EOR		R10,R8,R9		;Calculate Q EOR	R
		ORR		R11,R7,R10		;Logical OR result with P to get (P + Q EOR R)
		AND		R12,R11,#0x3E	;AND with 111110 to get (P + Q EOR R).111110
		

Stop    B	    	Stop

