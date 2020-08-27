
			
			.global main

main:
			MOV		R2,#4
			MOV		R3,#2
			MOV		R4,#4
			
			SUBS	R5,R2,R3    @R5 =  R2 - R3 (R5= 4-2= 2)
			SUBS	R5,R2,R4	@R5 =  R2 -R4   (R5 = 4-4=0)
			
Stop:		B		Stop

			.end