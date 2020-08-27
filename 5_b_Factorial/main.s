	
		;AREA	simpleShift, CODE, READONLY
		;EXPORT  __main

;;Computing n factorial, let n=10
;__main		
		;MOV		R6,#10		; load n into r6
		;MOV		R7,#1		;if n=0, at least n!=1
		
;loop	CMP		R6,#0
		;MULGT	R7,R6,R7
		;SUBGT	R6,R6,#1	;decrement
		;BGT		loop		; do another mul if counter !=0
		
;Stop    B	    Stop
		;END



;Thumb2 execution for cortex-m boards

		AREA	simpleShift, CODE, READONLY
		THUMB
		EXPORT  __main

;Computing n factorial, let n=10
__main		
		MOV		R6,#10		; load n into r6
		MOV		R7,#1		;if n=0, at least n!=1
		
loop	CMP		R6,#0
		ITTT	GT
		MULGT	R7,R6,R7
		SUBGT	R6,R6,#1	;decrement
		BGT		loop		; do another mul if counter !=0
		
Stop    B	    Stop
		END
