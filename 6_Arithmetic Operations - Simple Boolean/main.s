;Let’s perform a simple Boolean operation to calculate the bitwise calculation of F = A.B + bar(C.D)
;Assume that A, B, C, D are in r1, r2, r3, r4, respectively.
	
		AREA	SimpleBool, CODE, READONLY
		EXPORT  __main


__main
		AND		R0,R1,R2
		AND 	R3,R3,R4
		MVN		R3,R3
		ORR		R0,R0,R3

Stop    B	    	Stop

