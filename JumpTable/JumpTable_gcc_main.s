				.global main

num			.equ		2
	
main:		
			MOV		R0,#0
			MOV		R1,#3
			MOV		R2,#2
			
			BL		arithfunc
Stop:		B		Stop


arithfunc:
		    CMP		R0,#num
			MOVHS   PC,LR
			ADRL	R3,JumpTable
			LDR		PC,[R3,#4]
			
JumpTable:
			DCD		DoAdd
			DCD		DoSub

DoAdd:	
			ADD		R0,R1,R2
			BX		LR

DoSub:
			SUB		R0,R1,R2
			BX		LR
			
			END
			