			AREA FPU2, CODE, READONLY
			ENTRY
			EXPORT	__main


__main	
			LDR		R0,= 0xE000ED88
			LDR		R1,[R0]
			ORR		R1,R1,#(0xF<<20)
			STR		R1,[R0]
			
			LDR		R3,=0x3F800000
			VMOV.F	S3,R3
			
			VLDR.F	S4,= 6.0221415e23
			VMOV.F	R4,S4
			
Stop		B		Stop
			ALIGN
			END
			
			
			