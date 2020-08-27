				AREA myCode, CODE, READONLY
				EXPORT __main
				ENTRY


__main
				LDR		R0,=0xE000ED88
				LDR		R1,[R0]
				ORR		R1,R1,#(0xF<<20)
				STR		R1,[R0]
				
				ADRL	R1,ConstantTable
				VLDR.F	S2,[R1,#20]
				VLDR.F	S3,[R1,#12]
				VMUL.F	S4,S2,S3

Stop			B		Stop
		
ConstantTable	
				DCD		0x3F800000	;1.0
				DCD		0x40000000	;2.0
				DCD		0x80000000	;-0.0
				DCD		0x41200000	;10.0
				DCD		0X42C80000	;100.0
				DCD		0x40490FDA	;pi
				DCD		0x402DF854	;e
					
				END