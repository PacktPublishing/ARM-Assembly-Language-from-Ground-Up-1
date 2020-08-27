			
			.global main


main:
			LDR		R4,=0xBABEFACE
			LDR		R5,=0xDEADBEEF
			LDR		R6,=0xC0DEF0DE
			LDR		R7,=0xFADEFEED
			
			
			STMDB	SP!,{R4-R7,LR}
			LDMIA	SP!,{R4-R7,PC}

Stop:		B		Stop
			.align
			.end
			
			