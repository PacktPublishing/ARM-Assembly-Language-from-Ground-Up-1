
			AREA	|.text|,CODE,READONLY
			IMPORT Adder
			IMPORT num
            EXPORT __main
			ENTRY


__main
			LDR		R1,=num
			MOV		R0,#100
			STR		R0,[R1]
			BL		Adder
			
			END