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
	
GPIOF_PUR_OFFSET	EQU		0x510
GPIOF_PUR_R			EQU		GPIOF_BASE + GPIOF_PUR_OFFSET

GPIOF_LCK_OFFSET	EQU		0x520
GPIOF_LCK_R			EQU		GPIOF_BASE + GPIOF_LCK_OFFSET

GPIOF_CR_OFFSET		EQU		0x524
GPIOF_CR_R			EQU		GPIOF_BASE +  GPIOF_CR_OFFSET
	
LOCK_KEY			EQU		0x4C4F434B
	
	
	
GPIOF_EN			EQU		1<<5
LED_RED				EQU		1<<1
LED_BLUE			EQU		1<<2
LED_GREEN			EQU		1<<3

RED_OFF				EQU		0<<1

ONESEC				EQU		5333333
HSEC				EQU		266667
	
SW1					EQU		1<<4
SW2					EQU		1<<0
	
	
;	Output 
;	R0  0x01  = switch1 is pressed
;	R0	0x10  = switch2  is pressed
;	R0	0x00  =  both switches are pressed
;	R0  0x11  =  no swtich is pressed

SW1_PRESSED			EQU  	0x01
SW2_PRESSED			EQU		0x10
BOTH_PRESSED		EQU		0x00
NO_PRESS			EQU		0x11
	
	
	
				AREA  |.text|,CODE,READONLY,ALIGN=2
				THUMB
				ENTRY
				EXPORT __main
					


__main

			BL		GPIO_Init			

loop
			BL		GPIO_Read
			CMP		R0,#SW1_PRESSED
			BEQ		_switch1
			CMP		R0,#SW2_PRESSED
			BEQ		_switch2
			B		loop
			
			

_switch1
		  MOV		R0,#LED_RED
		  BL		_led_on
		  B			loop
		  
_switch2
		  MOV		R0,#LED_GREEN
		  BL		_led_on
		  B			loop
		  


GPIO_Init
           ;Enable clock access to PORTF
		   ;SYSCTL->RCGCGPIO |= GPIOF_EN
		   LDR		R1,=SYSCTL_RCGCGPIO_R
		   LDR		R0,[R1]
		   ORR		R0,#GPIOF_EN
		   STR		R0,[R1]
		   NOP
		   NOP
		   
		   LDR		R1,=GPIOF_LCK_R
		   LDR		R0,=LOCK_KEY
		   STR		R0,[R1]
		   
		   LDR		R1,=GPIOF_CR_R
		   MOV		R0,#0xFF
		   STR		R0,[R1]


		   ;Set PF1 as output
		   ;GPIOF->DIR	|=  LED_RED  |LED_GREEN
		   
		   LDR 		R1,=GPIOF_DIR_R
		   LDR 		R0,[R1]
		   ORR 		R0,#LED_RED
		   ORR		R0,#LED_GREEN
		   STR		R0,[R1]
		   
		   ;Digitally enable PF1
		   ;GPIOF->DEN |=LED_RED|LED_GREEN | SW1 |SW2
		   
		   LDR		R1,=GPIOF_DEN_R
		   LDR		R0,[R1]
		   ORR		R0,#LED_RED
		   ORR		R0,#LED_GREEN
		   ORR		R0,#SW1
		   ORR		R0,#SW2
		   STR		R0,[R1]
		   
		   ;GPIOF->PUR |=SW1|SW2
		   
		   LDR		R1,=GPIOF_PUR_R
		   LDR		R0,[R1]
		   ORR		R0,#SW1
		   ORR		R0,#SW2
		   STR		R0,[R1]
		   BX		LR
		   
_led_on
		   
		   LDR		R1,=GPIOF_DATA_R
		   STR		R0,[R1]
		   BX		LR
		   
		   
GPIO_Read

		  LDR		R1,=GPIOF_DATA_R
		  LDR		R0,[R1]
		  AND		R0,#0x11
		  
		  BX		LR
			
			
			
		   ALIGN
		   END
		  
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   
	
	
	
	
	
	
	
	
	
	
	
	