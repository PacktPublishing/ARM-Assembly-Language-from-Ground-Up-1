@ P = Q + R + S
@let Q=2, R=4,S=5


				
P		.space		    4	@Reserve 4 bytes of memory
Q		.word			2	@ create variable Q with inirtial value 2, Q = 0x00000002
R		.word			4	@ create variable R with inirtial value 4
S		.word			5	@ create variable S with inirtial value 5
	
				
				.global main

main:	
				LDR		R1,Q
				LDR		R2,R
				LDR		R3,S
				
				ADD		R0,R1,R2
				ADD		R0,R0,R3
				
Stop:			B		Stop
				
				.end
			
	