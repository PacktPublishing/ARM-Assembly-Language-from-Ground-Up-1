; (A + 8B + 7C -27) /4
; Let A = 25, B =19, c=99

			AREA CmEqu, CODE, READONLY
			ENTRY
			EXPORT	__main


__main
			MOV		R0,#25
			MOV		R1,#19
			ADD		R0,R0,R1,LSL #3  ; Add 8B to A put result in r0
			MOV		R1,#99
			MOV		R2,#7
			MLA		R0,R1,R2,R0      ; Add 7C to R0 put result in R0
			SUB		R0,R0,#27
			MOV		R0,R0,ASR #2	 ;Divide the total by 4

Stop		B		Stop

			END
			
			