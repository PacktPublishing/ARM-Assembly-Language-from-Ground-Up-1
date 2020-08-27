			
			.global main

main:
			LDR		R0,=0xBABEFACE
			LDR		R1,=0xDEADBEEF
			
			EOR		R0,R0,R1
			EOR		R1,R0,R1
			EOR		R0,R0,R1
			
Stop:		B		Stop
			.align
			.end
