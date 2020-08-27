
				AREA myCode, CODE, READONLY
				ENTRY
				EXPORT  __main
					

__main	
				LDR		R0,=0xF62562FA
				LDR		R1,=0xF412963B
				
				MOV		R2,#0x35
				MOV		R3,#0x21
				
				ADDS	R5,R2,R3
				ADC		R6,R2,R3    ; R6 = R2 +R3 + Carry
				
Stop			B		Stop
				
				END