;SW_2	:PF0
;LED_R : PF1
;LED_B : PF2
;LED_G : PF3
;SW_1   :PF4


SYSCTL_BASE			EQU		0x400FE000
RCGCGPIO_OFFSET		EQU		0x608
SYSCTL_RCGCGPIO_R	EQU		SYSCTL_BASE + RCGCGPIO_OFFSET

GPIOF_BASE			EQU		0x40025000

GPIOF_DIR_OFFSET	EQU		0x400
GPIOF_DIR_R			EQU		GPIOF_BASE + GPIOF_DIR_OFFSET

GPIOF_DATA_OFFSET	EQU		0x3FC
GPIOF_DATA_R		EQU		GPIOF_BASE + GPIOF_DATA_OFFSET
	
GPIOF_DEN_OFFSET	EQU     0x51C
GPIOF_DEN_R			EQU		GPIOF_BASE + GPIOF_DEN_OFFSET
	
GPIOF_EN			EQU		1<<5
LED_RED				EQU		1<<1
LED_BLUE			EQU		1<<2
LED_GREEN			EQU		1<<3
	
	
	
				AREA  |.text|,CODE,READONLY,ALIGN=2
				THUMB
				ENTRY
				EXPORT __main
					


__main

			BL		GPIO_Init
			
loop			
			BL		LED_On
			B		loop
			
			
			
GPIO_Init
           ;Enable clock access to PORTF
		   ;SYSCTL->RCGCGPIO |= GPIOF_EN
		   LDR		R1,=SYSCTL_RCGCGPIO_R
		   LDR		R0,[R1]
		   ORR		R0,#GPIOF_EN
		   STR		R0,[R1]
		   NOP
		   NOP
		   
		   ;Set PF1 as output
		   ;GPIOF->DIR	|=  LED_RED  = 0x02 =  1 << 1 =  0B 0000 0010
		   LDR 		R1,=GPIOF_DIR_R
		   LDR 		R0,[R1]
		   ORR 		R0,#LED_RED
		   STR		R0,[R1]
		   
		   ;Digitally enable PF1
		   ;GPIOF->DEN |=LED_RED
		   LDR		R1,=GPIOF_DEN_R
		   LDR		R0,[R1]
		   ORR		R0,#LED_RED
		   STR		R0,[R1]
		   
		   BX		LR
		   
LED_On
           ;GPIOF->DATA =LED_RED
		   
		   LDR		R1,=GPIOF_DATA_R
		   MOV		R0,#LED_RED
		   STR		R0,[R1]
		   BX		LR
		   
		   ALIGN
		   END
		  
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   
	
	
	
	
	
	
	
	
	
	
	
	