# This file was created as a class exercise 
# during the afternoon session of COMP 122
#
# The slides (Base64_Operations.pdf) presented during
# class were used to guide the construction of this MIPS code
	   
		   
	 	.data
base64_table:	.ascii "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	      	.ascii "abcdefghijklmnopqrstuvwxyz"
	      	.ascii "0123456789"
	       	.ascii "+/"
	       	.byte '\0'	   
	   
in_buffer: 	.byte 0xFA 
		.byte 0xCA  # 1100 1010
		.byte 0xDE  
	   	.align 3
	   	.asciiz "Hello this is my string"
	   
out_buffer:	.byte
		.byte
		.byte
		.byte
	   
	.text
	.include "syscall_macros.asm"
	.globl main
	   
main:	nop   # my main routine

	# To make a subroutine
	# marshall my input arguments

	jal encode   # call on the subroutine
	# move my return value to the appropriate
	
	halt()
	
	
encode:
	# Register Assignment
	# a1, a2, a3  : are my three input bytes to obtain 24 bits
	# a0 : is my 24 input bits marshalled together
	# s1, s2, s3, s4 : are my four 6-bit base64 index
	# t1, t2, t3, t4 : are my four base64 after encoded to ASCII
	# t8 and t9: were used for my "offset" and my "base" address of the base_table
	

load:   lbu $a1, in_buffer
	lbu $a2, in_buffer+1
	lbu $a3, in_buffer+2 
	
shift:	sll $a1, $a1, 16
	sll $a2, $a2, 8
	sll $a3, $a3, 0   # Nop 

meld:	or $a0, $a1, $a2
	or $a0, $a0, $a3

chop:   andi $s1, $a0, 0xFC0000
	andi $s2, $a0, 0x03F000
	andi $s3, $a0, 0xFC0
	andi $s4, $a0, 0x03F
	
slide:  srl $s1, $s1, 18
	srl $s2, $s2, 12
	srl $s3, $s3, 6
	srl $s4, $s4, 0   # nop
	
map:    # ascii = base64_table[$s1] 
	la $t0, base64_table
	
	# first 
	add $t8, $t0, $s1
	lbu $t1, 0($t8)
	
	# second
	add $t8, $t0, $s2
	lbu $t2, 0($t8)
		
	# third
	add $t8, $t0, $s3
	lbu $t3, 0($t8)
	
	# fourth
	add $t8, $t0, $s4
	lbu $t4, 0($t8)

	jr $ra
