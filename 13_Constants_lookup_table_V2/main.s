
	
		AREA	Swap, CODE, READONLY
		EXPORT  __main


__main
				LDR		R0, =0xE000ED88 		;Read value at the address of the Coprocessor Access Control Register
				LDR 	R1,[R0]
				ORR 	R1,R1,#(0xF << 20)		;Enable CP10,CP11
				STR		R1,[R0]
				;load s2 with pi, s3 with 10.0
				; and multiply them to s4
				VLDR.F		S5,C_Pi
				VLDR.F		S6,C_Ten
				VMUL.F		S7,S5,S6

Stop    B	    	Stop

C_One 			DCD 	0x3F800000 ; 1.0
C_Two			DCD 	0x40000000 ; 2.0
C_NZero 		DCD 	0x80000000 ; -0.0
C_Ten 			DCD 	0x41200000 ; 10.0
C_Hun 			DCD 	0x42C80000 ; 100.0
C_Pi 			DCD 	0x40490FDB ; pi
C_e 			DCD 	0x402DF854 ; e
				ALIGN
				END