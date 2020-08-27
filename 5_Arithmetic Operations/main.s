;We are going to perform a more complex arithmetic evaluation. Assume that we wish to evaluate (A + 8B + 7C - 27)/4,
;where A = 25, B = 19, and C = 99.
	
		AREA	SimpleAdd, CODE, READONLY
		EXPORT  __main


__main		
		MOV			R0,#25				;Load register R0 with 25
		MOV			R1,#19
		ADD			R0,R0,R1,LSL #3     ;Add 8 X B to A in r0 
		MOV			R1,#99
		MOV			R2,#7               
		MLA			R0,R1,R2,R0			;Add 7 x Cto ttotal in r0
		SUB			R0,R0,#27
		MOV			R0,R0,ASR #27		; Divide the total by 4,ASR: Arithmetic shift right
		
Stop    B	    	Stop


;First, was can multiply or divide by a power-of-2 by shifting left, or right, respectively.
;Moreover, instructions allow us to perform a shift on the second operand, so that ADD r0,r0,r1,LSL #3 means
;shift the contents of register r1 left three times (multiply it by 8) and then add it to register r0 and put the total in r0.
;Second, we can use the add and multiply instruction, MLA, to perform P = P + Q?R. In this case we are able to perform
;the multiplication 7 x C and add that to the running total in r0. Note the format of this instruction.
;Finally, we perform the division by 4 moving the result from r0 to r0 while applying two shifts right. Figure Example
;6.1 demonstrates the state of the system after the code has been executed.