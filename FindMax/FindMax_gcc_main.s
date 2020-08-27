
COUNT 		RN		R0
MAX			RN		R1
POINTER		RN		R2
NEXT		RN		R3


				
MYDATA:			.word		69,87,86,45,75
	
				.global main
			
					
main:
				MOV		COUNT,#5
				MOV		MAX,#0
				LDR		POINTER,=MYDATA
				
AGAIN:			LDR		NEXT,[POINTER]
				CMP		MAX,NEXT
				BHS		CTNU
				MOV		MAX,NEXT

CTNU:			ADD		POINTER,POINTER,#4
				SUBS	COUNT,COUNT,#1
				BNE		AGAIN
				
Stop:			B		Stop
				END

				