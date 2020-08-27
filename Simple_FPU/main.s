		AREA   simpleFPU, CODE, READONLY
		ENTRY
		EXPORT	__main
			

__main
		LDR		R0,=0xE000ED88
		LDR		R1,[R0]
		ORR		R1,R1,#(0xF<<20)
		STR		R1,[R0]
		
		VMOV.F	S0,#0x3F800000
		VMOV.F	S1,S0
		VADD.F	S2,S1,S0
		
Stop	B	Stop
		ALIGN
		END
		
		