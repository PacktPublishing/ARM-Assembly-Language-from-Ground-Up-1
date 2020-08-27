
			.global main

main:		
		    LDR		R0,=2010
			MOV		R1,#10
			MOV		R2,#0
			
			
AGAIN:		CMP		R0,R1
			BLO		Stop
			SUBS	R0,R0,R1
			ADD		R2,R2,#1
			B		AGAIN
			

Stop:		B		Stop
			.end