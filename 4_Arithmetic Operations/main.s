;We�re going to repeat the same example once again. This time we will write the program in a more compact fashion,
;still using the ADR (load register with address instruction).
;To simplify the code, we�ve used simple numeric offsets (because there is relatively little data and the user comments
;tell us what�s happening. Note that we have used labels Q, R, and S for the data. These labels are redundant and are not
;needed since they are not referred to anywhere else in the program. There�s nothing wrong with this. These labels just
;serve as a reminder to the programmer.
	
		AREA	SimpleAdd, CODE, READONLY
		EXPORT  __main


__main		
		ADR  		R0,P				;R0 point to data area
		LDR			R1,[R0,#4]          ;load Q into r1
		LDR			R2,[R0,#8]          ;load R into r2
		ADD     	R2,R1,R2            ;add Q and R
		LDR			R1,[R0,#12]         ;load S into R3
		ADD     	R2,R2,R1            ;add S to the total
		STR			R1,[R2]          ;save the result in memory 
		
Stop    B	    	Stop

		AREA	SimpleAdd, DATA,READWRITE
P		SPACE	4	
Q		DCD		2
R		DCD		4
S		DCD		5

		ALIGN
		END


;Note also that we have reused registers to avoid taking up so many. This example uses only r0, r1, and r2. Once a
;register has been used (and its value plays no further part in a program, it can be reused. However, this can make
;debugging harder. In this example at one point r1 contains Q and at another point it contains S. Finally, it contains the
;result S.
