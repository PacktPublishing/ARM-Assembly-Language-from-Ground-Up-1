
	
		AREA	Swap, CODE, READONLY
		EXPORT  __main


__main
		LDR		R0, =0xE000ED88 		;Read value at the address of the Coprocessor Access Control Register
		LDR 	R1,[R0]
		ORR 	R1,R1,#(0xF << 20)		;Enable CP10,CP11
		STR		R1,[R0]
		DSB
		ISB						;Reset the pipeline
		

;
; The calculation of the sin(x) will be done in the
; subroutine SinCalc. The AAPCS dictates the first
; 16 FPU registers (s0-s15) are not preserved, so we will
; use them in the calling routine to pass the operand and
; return the result. Registers s16-s31 must be preserved in
; a subroutine, so they are used in the calling routine.
; FPU registers
; s0 - Passed operand and returned result
; Evaluate the function for operand the test operand
		VLDR.F32 	S0, = 2; 1.04719
		BL		 SinCalc

Stop    B	    	Stop


; Sine code
; The algorithm is a Taylor series with
; 4 terms (x = x - x^3/3! + x^5/5! - x^7/7!)
; Optimized, we have 9 multiplications and 3 adds.
; We can avoid the divisions by computing 1/3!, 1/5!, etc. and
; using the constant in a multiplication.
;
; This formula works for all x in the range [0, pi/2]
; [0, pi/2]
;
; This routine assumes AAPCS -
; regs s0-s15 parameters and/or scratch
; Register usage:
; s0 - input operand and return result
; s1 - 1/3! (invfact3)
; s2 - 1/5! (invfact5)
; s3 - 1/7! (invfact7)
; s4 - x * s1 (xdiv3), then s4 * s7 (x^2 * xdiv3) (x3div3)
; s5 - x * s2 (xdiv5), then s5 * s8 (x^4 * xdiv5) (x5div5)
; s6 - x * s3 (xdiv7), then s6 * s9 (x^6 * xdiv7) (x7div7)
; s7 - x^2
; s8 - x^4
; s9 - x^6
; s10 - scratch

SinCalc
		; set up the three inverse factorial constants
		VLDR.F32 s1, invfact3
		VLDR.F32 s2, invfact5
		VLDR.F32 s3, invfact7
		VMUL.F32 s4, s0, s1 ; compute xdiv3
		VMUL.F32 s7, s0, s0 ; compute x^2
		VMUL.F32 s5, s0, s2 ; compute xdiv5
		VMUL.F32 s4, s4, s7 ; compute x3div3
		VMUL.F32 s8, s7, s7 ; compute x^4
		VMUL.F32 s6, s0, s3 ; compute xdiv7
		VSUB.F32 s10, s0, s4 ; compute terms12, x-x^3/3!
		VMUL.F32 s9, s7, s8 ; compute x^6
		VMUL.F32 s5, s5, s8 ; compute x5div5
		VMUL.F32 s6, s6, s9 ; compute x7div7
		VADD.F32 s10, s10, s5 ; compute terms123, x-x^3/3! + x^5/5!
		VSUB.F32 s0, s10, s6 ; compute result
		
		BX 		LR ; return

invfact3 DCD 0x3E2AAAAB ; 1/3!
invfact5 DCD 0x3C088888 ; 1/5!
invfact7 DCD 0x39500CD1 ; 1/7!
		 END
		
		