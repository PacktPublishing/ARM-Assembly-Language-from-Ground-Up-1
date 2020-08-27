
				AREA myCode, CODE,READONLY
				ENTRY
				EXPORT	__main


__main	
				LDR	R0,=SIGN_DATA
				MOV R3,#8
				
				LDRSB	R2,[R0]
				ADD	R0,R0,#1
				
BEGIN			LDRSB	R1,[R0]
				CMP R1, R2
				BGE NEXT
				MOV R2,R1

NEXT			ADD R0,R0,#1
				SUBS	R3,R3,#1
				BNE		BEGIN

Stop			B		Stop

SIGN_DATA		DCB		+13,-10,+19,+14,-18,-9,+12,-20
				ALIGN
				END