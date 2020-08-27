
	
		AREA	Swap, CODE, READONLY
		EXPORT  __main


__main
		LDR	R0, =0xBABEFACE	 		;load data
		LDR	R1, =0xDEADBEEF			;load some data
		EOR	R0,R0, R1				;R0 XOR R1
		EOR	R1,R0, R1				;R1 XOR R1
		EOR R0,R0,R1				;R0 XOR R1
		

Stop    B	    	Stop

