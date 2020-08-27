@P = Q +S +R
@Q=2, R=4, S=5



			
		
		.global main

main:
	  
		ADRL	R0,P
		LDR		R1,[R0,#4]
		LDR		R2,[R0,#8]
		
		ADD 	R2,R1,R2
		LDR		R1,[R0,#12]
		ADD 	R2,R2,R1
		
		
		
	
		
Stop:
		B		Stop
		

	
		.data
		
P:    	.space		4
Q:		.word		2
R:		.word		4
S:		.word		5
			
		.align
			
		.end