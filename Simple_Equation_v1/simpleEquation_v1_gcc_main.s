
@ P = Q + R + S
@ let Q=2, R=4, S=5 


Q		.equ		2
R		.equ		4
S		.equ		5
	
	
	
		.global main
			

main:
		MOV		R1,#Q
		MOV		R2,#R
		MOV		R3,#S
		
		ADD		R0,R1,R2
		ADD		R0,R0,R3

Stop:	B		Stop

		.end