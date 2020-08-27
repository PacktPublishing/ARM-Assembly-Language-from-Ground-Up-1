RCC_BASE			EQU		0x40023800
AHB1ENR_OFFSET 		EQU		0x30
RCC_AHB1ENR			EQU		RCC_BASE + AHB1ENR_OFFSET

GPIOA_BASE			EQU		0x40020000
	
GPIOA_MODER_OFFSET	EQU		0x00
GPIOA_MODER			EQU		GPIOA_BASE + GPIOA_MODER_OFFSET
	
GPIOA_ODR_OFFSET	EQU		0x14
GPIOA_ODR			EQU		GPIOA_BASE + GPIOA_ODR_OFFSET	

GPIOC_BASE			EQU		0x40020800
GPIOC_MODER_OFFSET	EQU		0x00
GPIOC_MODER			EQU		GPIOC_BASE + GPIOC_MODER_OFFSET

GPIOC_IDR_OFFSET	EQU     0x10
GPIOC_IDR			EQU		GPIOC_BASE + GPIOC_IDR_OFFSET
	

;Using the bit-set-reset-register
GPIOA_BSRR_OFFSET	EQU		0x18
GPIOA_BSRR			EQU		GPIOA_BASE	+ GPIOA_BSRR_OFFSET

BSRR_5_SET			EQU		1 << 5
BSRR_5_RESET		EQU		1 << 21

GPIOA_EN			EQU		1<<	0
GPIOC_EN			EQU		1<<	2

MODER5_OUT			EQU		1 << 10

LED_ON				EQU		1 << 5
LED_OFF				EQU		0 << 5


BTN_ON				EQU		0x0000
BTN_PIN				EQU		0x2000 
BTN_OFF				EQU		0x2000 
	
	
	
	
					AREA		|.text|,CODE,READONLY,ALIGN=2
					THUMB
					ENTRY
					EXPORT	__main

__main
					BL		GPIO_Init
					
loop
					BL		get_input
					CMP		R0,#BTN_ON
					BEQ		turn_led_on
					CMP		R0,#BTN_OFF
					BEQ		turn_led_off
				
					B		loop
					
					
					
turn_led_off
					LDR		R2,=GPIOA_BSRR
					MOV		R1,BSRR_5_RESET
					STR		R1,[R2]
					B		loop
	

turn_led_on
					LDR		R2,=GPIOA_BSRR
					MOV		R1,#BSRR_5_SET
					STR		R1,[R2]
					B		loop

get_input
					LDR		R1,=GPIOC_IDR
					LDR		R0,[R1]
					AND		R0,R0,#BTN_PIN
					BX		LR
	
GPIO_Init					
					;RCC->AHB1ENR  |=GPIOA_EN
					LDR 	R0,=RCC_AHB1ENR
					LDR  	R1,[R0]
					ORR		R1,#GPIOA_EN
					STR		R1,[R0]
					
					;GPIOA->MODER |=MODER5_OUT
					LDR		R0,=GPIOA_MODER
					LDR		R1,[R0]
					ORR		R1,#MODER5_OUT
					STR		R1,[R0]
					
					;Push button clock init
					;RCC->AHB1ENR |=GPIOC_EN
					
					LDR		R0,=RCC_AHB1ENR
					LDR		R1,[R0]
					ORR		R1,#GPIOC_EN
					STR		R1,[R0]
					
					BX		LR


				
					ALIGN
					END
						
					
					
					

