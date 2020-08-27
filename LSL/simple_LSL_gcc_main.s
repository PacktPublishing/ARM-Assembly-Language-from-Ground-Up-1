


			.global main
		

main:
		MOV		R0,#0x11			;move 17
		LSL		R1,R0,#1			;shift 1 bit left = 17 x 2^1 =34
		LSL		R2,R1,#1			;shift 1 bit left = 34 x 2^1 = 68

Stop:	B		Stop

		.end