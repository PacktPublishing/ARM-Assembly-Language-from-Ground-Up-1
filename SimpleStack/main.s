			AREA simpleStack,CODE,READONLY
			ENTRY
			EXPORT	__main


__main
			LDR		R3,=0xDEADBEEF
			LDR		R4,=0xBABEFACE
			PUSH	{R3}
			PUSH	{R4}
			POP		{R5}
			POP		{R6}

Stop		B		Stop
			ALIGN
			END
		
			