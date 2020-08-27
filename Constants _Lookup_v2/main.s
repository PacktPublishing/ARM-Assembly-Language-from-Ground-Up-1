				AREA myCode, CODE, READONLY
				EXPORT __main
				ENTRY


__main
				LDR		R0,=0xE000ED88
				LDR		R1,[R0]
				ORR		R1,R1,#(0xF<<20)
				STR		R1,[R0]
				
				VLDR.F	S2,C_Ten
				VLDR.F	S3,C_Pi
				VMUL.F	S4,S2,S3

Stop			B		Stop
		
	
C_One				DCD		0x3F800000	;1.0
C_Two				DCD		0x40000000	;2.0
C_NZero				DCD		0x80000000	;-0.0
C_Ten				DCD		0x41200000	;10.0
C_Hun				DCD		0X42C80000	;100.0
C_Pi				DCD		0x40490FDA	;pi
C_e 				DCD		0x402DF854	;e
					
				END