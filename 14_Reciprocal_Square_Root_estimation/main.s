
	
		AREA	Swap, CODE, READONLY
		EXPORT  __main


__main
		LDR		R0, =0xE000ED88 		;Read value at the address of the Coprocessor Access Control Register
		LDR 	R1,[R0]
		ORR 	R1,R1,#(0xF << 20)		;Enable CP10,CP11
		STR		R1,[R0]
		
		; Reciprocal Square Root Estimate code
		; r1 holds the address to the odd table
		ADR 	R0, RecipSQRTTableOdd
		; r2 holds the address to the even table
		ADR 	R1, RecipSQRTTableEven
		
		; Compute the reciprocal square root estimate for a
		; single precision value X x 2^n as
		; 1/(X)^-1/2. The estimate table is stored in two
		; halves, the first for odd exponents
		; RecipSqrtTableOdd) and the second for
		; even exponents (RecipSqrtTableEven).
		VLDR.F	 S0, InputValue
		VMOV.F	 R2, S0
		; Process the exponent first – we assume positive input
		MOV R3, R2 ; exp in r2, frac in r3
		LSR R2, #23 ; shift the exponent for subtraction
		SUB R2, #127 ; subtract out the bias
		AND R4, R2, #1 ; capture the lsb to r4
		TEQ R4, #1 ; check for odd exponent
		
		; Odd Exponent - add 1 before the negate and shift
		; right operations
		ADDEQ r2,#1
		; All exponents
		LSR r2, r2, #1 ; shift right by 1 to divide by 2
		NEG r2, r2 ; negate
		ADD r2, #127 ; add in the bias
		LSL r2, #23 ; return the new exponent - the
		; Extract the upper 4 fraction bits for the table lookup
		AND r3, #0x00780000
		LSR r3, #18 ; shift so they are *2
		; Select the table and the table entry based on
		; the upper fraction bits
		LDRHEQ r4, [r3, r0]
		LDRHNE r4, [r3, r1] ; index into the even table
		VMOV.F s3, r4 ; copy the selected half-precision
		VCVTB.F32.F16 s4, s3 ; convert the estimate to sp
		VMOV.F s5, r2 ; move the exp multiplier to s5
		VMUL.F s6, s5, s4 ; compute the recip estimate

loop	B	loop
		ALIGN
		
InputValue
		; Test values. Uncomment the value to convert
		; DCD 0x42333333 ; 44.8, recip sqrt is 0.1494, odd exp
		; DCD 0x41CA3D71 ; 25.28, recip sqrt is 0.19889, even exp

RecipSQRTTableEven
		DCW 0x3C00 ; 1.0000 -> 1.0000
		DCW 0x3BC3 ; 1.0625 -> 0.9701
		DCW 0x3B8B ; 1.1250 -> 0.9428
		DCW 0x3A57 ; 1.1875 -> 0.9177
		DCW 0x3B28 ; 1.2500 -> 0.8944
		DCW 0x3AFC ; 1.3125 -> 0.8729
		DCW 0x3AD3 ; 1.3750 -> 0.8528
		DCW 0x3AAC ; 1.4375 -> 0.8340
		DCW 0x3A88 ; 1.5000 -> 0.8165
		DCW 0x3A66 ; 1.5625 -> 0.8000
		DCW 0x3A47 ; 1.6250 -> 0.7845
		DCW 0x3A29 ; 1.6875 -> 0.7698
		DCW 0x3A0C ; 1.7500 -> 0.7559
		DCW 0x39F1 ; 1.8125 -> 0.7428
		DCW 0x39D8 ; 1.8750 -> 0.7303
		DCW 0x39BF ; 1.9375 -> 0.7184
		
		ALIGN

RecipSQRTTableOdd

		DCW 0x3DA8 ; 0.5000 -> 1.4142
		DCW 0x3D7C ; 0.5322 -> 1.3707
		DCW 0x3D55 ; 0.5625 -> 1.3333
		DCW 0x3D31 ; 0.5938 -> 1.2978
		DCW 0x3D0F ; 0.6250 -> 1.2649
		DCW 0x3CF0 ; 0.6563 -> 1.2344
		DCW 0x3CD3 ; 0.6875 -> 1.2060
		DCW 0x3CB8 ; 0.7186 -> 1.1795
		DCW 0x3C9E ; 0.7500 -> 1.1547
		DCW 0x3C87 ; 0.7813 -> 1.1313
		DCW 0x3C70 ; 0.8125 -> 1.1094
		DCW 0x3C5B ; 0.8438 -> 1.0886
		DCW 0x3C47 ; 0.8750 -> 1.0690
		DCW 0x3C34 ; 0.9063 -> 1.0504
		DCW 0x3C22 ; 0.9375 -> 1.0328
		DCW 0x3C10 ; 0.9688 -> 1.0160
		
		ALIGN
		END
