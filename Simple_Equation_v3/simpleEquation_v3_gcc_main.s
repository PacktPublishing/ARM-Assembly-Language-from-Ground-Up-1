@P = Q +S +R
@Q=2, R=4, S=5



			
		
		.global main

main:
		ADRL	R4,Vals 	@R4 points to vals area
		LDR		R1,[R4,#Q]  @load Q=2 into R1
		LDR		R2,[R4,#R]  @load R=4 into R2
		LDR		R3,[R4,#S]  @load  S=5  inot R3
		
		ADD		R0,R1,R2
		ADD		R0,R0,R3
		
		STR		R0,[R4,#P]
		
Stop:
		B		Stop
		
P		.equ		0
Q		.equ		4
R		.equ		8
S		.equ		12
	
		.data

Vals:	.space		4
		.word		2
		.word		4
		.word		5
			
		.align
			
		.end