
NUM 		EQU 	14 ; insert # of entries here
ESIZE		EQU 	3 ; log 2 of the entry size (16 bytes)
; NB: This assumes entry size is a power of 2
			AREA BINARY, CODE
			ENTRY
			EXPORT	__main
			
			; Registers used:
			; R0 - first
			; R1 - last
			; R2 - middle
			; R3 - index
			; R4 - size of the entries (log 2)
			; R5 - the key (what you're searching for)
			; R6 - address of the list
			; R7 - temp
__main
			
			LDR  R5, =0x005 ; let’s look for OLIVES
			ADRL R6, table_start ; load address of the table
			MOV  R0, #0 ; first = 0
			MOV  R1, #NUM-1 ; last = number of entries in the list - 1
loop 
		    CMP R0, R1 ; compare first and last
			MOVGT R2, #0 ; first > last, no key found, middle = 0
			BGT done
			ADD R2, R0, R1 ; first + last
			MOV R2, R2, ASR #1 ; first + last /2
			LDR R7, [R6, R2, LSL #ESIZE] ; load the entry
			CMP R5, R7 ; compare key to value loaded
			ADDGT R0, R2, #1 ; first = middle + 1
			SUBLT R1, R2, #1 ; last = middle - 1
			
			BNE loop ; go again
done 		
			MOV R3, R2 ; move middle to 'index'
stop 	
			B 	stop
			
			
table_start
			DCD 0x004
			DCB "PEPPERONI "
			DCD 0x005
			DCB "ANCHOVIES "
			DCD 0x010
			DCB "OLIVES "
			DCD 0x012
			DCB "GREEN PEPPER"
			DCD 0x018
			DCB "BLACK OLIVES"
			DCD 0x022
			DCB "CHEESE "
			DCD 0x024
			DCB "EXTRA SAUCE "
			DCD 0x026
			DCB "CHICKEN "
			DCD 0x030
			DCB "CANADIAN BAC"
			DCD 0x035
			DCB "GREEN OLIVES"
			DCD 0x038
			DCB "MUSHROOMS "
			DCD 0x100
			DCB "TOMATOES "
			DCD 0x200
			DCB "PINEAPPLE "
			DCD 0x300
			DCB "PINE NUTS "
			ALIGN
			
			END