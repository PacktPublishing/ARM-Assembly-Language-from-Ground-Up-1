				.global	main
				


main:
				LDR		R0,=0xE000ED88
				LDR		R1,[R0]
				ORR		R1,R1,#(0xF<<20)
				STR		R1,[R0]
				
				VLDR.F	S2,C_Ten
				VLDR.F	S3,C_Pi
				VMUL.F	S4,S2,S3

Stop:			B		Stop
		
	
C_One:				.word		0x3F800000	;1.0
C_Two:				.word		0x40000000	;2.0
C_NZero:			.word		0x80000000	;-0.0
C_Ten:				.word		0x41200000	;10.0
C_Hun:				.word		0X42C80000	;100.0
C_Pi:				.word		0x40490FDA	;pi
C_e: 				.word		0x402DF854	;e
					.align
					.end