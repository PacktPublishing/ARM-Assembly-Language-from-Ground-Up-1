
	
		AREA	Swap, CODE, READONLY
		EXPORT  __main


__main
		LDR		R0, =0xE000ED88 		;Read value at the address of the Coprocessor Access Control Register
		LDR 	R1,[R0]
		ORR 	R1,R1,#(0xF << 20)		;Enable CP10,CP11
		STR		R1,[R0]
		VMOV.F	S0,#0x3F800000			;Single precision
		VMOV.F	S1,S0
		VADD.F	S2,S1,S0

Stop    B	    	Stop

