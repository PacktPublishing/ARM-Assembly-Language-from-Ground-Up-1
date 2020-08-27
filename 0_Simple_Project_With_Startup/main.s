;Explain  with ARM_PPT2.pdf		

		PRESERVE8
			THUMB
			
			AREA	|.text|,CODE, READONLY, ALIGN=2
			ENTRY
			EXPORT __main
			
__main
			MOV		R5, #0x1234
			MOV		R3, #0x1234
			ADD     R6, R5, R3

STOP
			B		STOP
			END
			