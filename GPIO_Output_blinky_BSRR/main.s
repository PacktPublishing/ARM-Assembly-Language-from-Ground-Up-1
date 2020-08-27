RCC_BASE				EQU		0x40023800
AHB1ENR_OFFSET			EQU		0x30	
RCC_AHB1ENR				EQU		RCC_BASE + AHB1ENR_OFFSET

GPIOA_BASE				EQU		0x40020000
GPIOA_MODER_OFFSET		EQU		0x00
GPIOA_MODER				EQU		GPIOA_BASE + GPIOA_MODER_OFFSET

GPIOA_ODR_OFFSET		EQU		0x14
GPIOA_ODR				EQU		GPIOA_BASE +  GPIOA_ODR_OFFSET


GPIOA_BSRR_OFFSET		EQU		0x18
GPIOA_BSRR				EQU		GPIOA_BASE + GPIOA_BSRR_OFFSET	

GPIOA_EN				EQU		1<<0
MODER5_OUT				EQU		1<<10
	
LED_ON					EQU		1<<5
LED_OFF					EQU		0<<5

BSRR_5_SET			    EQU     1<<5
BSRR_5_RESET			EQU		1<<21
	
	
					AREA	|.text|,CODE,READONLY,ALIGN=2
					THUMB
					ENTRY
					EXPORT 	__main


__main
					BL		GPIOA_Init




ONESEC			EQU		5333333
HSEC			EQU		266667


GPIOA_Init

			       ;RCC->AHBIENR |= GPIOA_EN
				   
				   ;Load address of RCC_AHB1ENR to r0
				   LDR		R0,=RCC_AHB1ENR
				   ;Load value at adress found in r0 into r1
				   LDR		R1,[R0]
				   ORR		R1,#GPIOA_EN
				   ;Store the content in R1 at address found in R0
				   STR		R1,[R0]
				   
				   ;GPIOA->MODER | = MODER5_OUT
				   LDR 		R0,=GPIOA_MODER
				   LDR		R1,[R0]
				   ORR		R1,#MODER5_OUT
				   STR		R1,[R0]
				
				   
				   LDR	  R2,=GPIOA_BSRR
				   
Blink
				   MOV 	  R1,#BSRR_5_SET
				   STR	  R1,[R2]
				   LDR	  R3,=ONESEC
				   BL	  Delay
				   
				   MOV	  R1,#BSRR_5_RESET
				   STR	  R1,[R2]
				   LDR    R3,=ONESEC
				   BL	  Delay
				   
				   B      Blink
				   
				   
				   
				   
				   


Delay
				   SUBS	  R3,R3,#1   
				   BNE	   Delay
				   BX	  LR
				   
				   
				   
				   
				   
				   ALIGN
				   END
				   
				   
				   
				   