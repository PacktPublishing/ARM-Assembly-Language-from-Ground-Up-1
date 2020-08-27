;P = Q +S +R
;Q=2, R=4, S=5



			
		AREA	eg3, CODE, READONLY
		ENTRY
		EXPORT	__main

__main
		ADRL	R4,Vals 	;R4 points to vals area
		LDR		R1,[R4,#Q]  ; load Q=2 into R1
		LDR		R2,[R4,#R]  ; load R=4 into R2
		LDR		R3,[R4,#S]  ; load  S=5  inot R3
		
		ADD		R0,R1,R2
		ADD		R0,R0,R3
		
		STR		R0,[R4,#P]
		
Stop
		B		Stop
		
P		EQU		0
Q		EQU		4
R		EQU		8
S		EQU		12
	
		AREA	eg3, DATA, READONLY

Vals	SPACE		4
		DCD			2
		DCD			4
		DCD			5
			
		ALIGN
			
		END