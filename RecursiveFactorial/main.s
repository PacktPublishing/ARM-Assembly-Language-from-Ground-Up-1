			AREA 	fact, CODE, READONLY
			ENTRY
			EXPORT	__main

; Iterative implemetation

;__main
		 ;MOV	R0,#8   ; Compute fact(8)
		 
;Fact	 MOV	R1,#1
;loop	 CMP	R0,#1
		 ;BLS	done
		 ;MUL	R1,R0,R1
		 ;SUB	R0,R0,#1
		 ;B		loop
		 

;done	 MOV	R0,R1
		 ;BX		LR
		 ;ALIGN
		 ;END

; Recursive implemetation

__main
		 MOV	R0,#8
Fact	 CMP	R0,#1
		 BLS    done
		 PUSH	{R0,LR}
		 SUB	R0,R0,#1 ; n=n-1
		 BL		Fact
		 POP	{R1,LR}
		 MUL	R0,R0,R1; R0 = n* Fact(n-1)
		 BX		LR
		 
		 
		 
done	 MOV	R0,#1
		 BX		LR
		 ALIGN
		 END