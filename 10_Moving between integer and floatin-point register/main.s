
	
		AREA	Swap, CODE, READONLY
		EXPORT  __main


__main
		LDR		R0, =0xE000ED88 		;Read value at the address of the Coprocessor Access Control Register
		LDR 	R1,[R0]
		ORR 	R1,R1,#(0xF << 20)		;Enable CP10,CP11
		STR		R1,[R0]
		
		LDR		R3,=0x3F800000			;Single precision
		VMOV.F	S3,R3					;Transfer contents from Main Regiters to FPU
		VLDR.F  S4, = 6.0221415e23      ;Avogadro's constant
		VMOV.F	R4,S4					;Transfer contents from FPU to Main Registers

Stop    B	    	Stop

		END