
	.globl main
	.data
my_string: .asciiz "used to test the strlen subroutine"





# This file contains a number of routines that are provide via the C standard library.
# This routines that are to be included are:
#
# Integers
#----------------
## u2a: unsigned integer to decimal ascii conversion
## i2a: signed integer to decimal ascii conversion
## a2u: (%u) ascii to unsigned integer conversion
## a2i: (%d) ascii to signed integer conversion
## a2o: (%o) ascii to signed integer conversion
## a2x: (%x) ascii to signed integer conversion

# Floating Point
#----------------
## a2f: decimal ascii to binary32 conversion
## a2d: decimal ascii to binary64 conversion
## f2f: (%f) binary32 float to decimal notation
## f2e: (%e) binary32 float to exponent notation 
## f2p: (%p) binary64 double to power conversion

# Strings
#----------
## strlen
## memcpy
## strlcopy



              .data
              .eqv base10 10
#u2a_str:      .space 10     # a buffer to hold 2^32-1 (4294967295) in ascii
u2a_str:      .ascii "4294967295"
u2a_estr:     .byte  '0'    # add one more char
              .byte  '\0'   # Null Char used to end i2a_str

              .text

# Usage: char * u2a(int)
# Description: Converts a 32-bit unsigned value to decimal ascii
u2a: nop                           # char * u2a(value) {
  # v0: p                   
  # a0: value
  # t0: base10             
  # t1: digit

	la $v0, u2a_estr                 #  char * p = &if2_estr
  addu $v0, $v0, 1       
  li $t0, base10       
        
  u2a_top: nop                     #  do {
       divu $a0, $t0               #     
       mfhi $t1                    #    digit = value % 10;
       mflo $a0                    #    value = value / 10;
       addi $t1, $t1, '0'          #    * p = digit + '0';
       sb $t1, 0($v0)       
       subi $v0, $v0, 1            #    p--;
  bne $a0, $zero u2a_top           #  } while (value != 0 )
  addi $v0, $v0, 1                 #  p ++;
  jr $ra                           #  return p;
                                   #}



strlen: nop                        # int strlen(&str) {
  # v0: count                   
  # a0: str
  # t0: base10             
  # t1: digit
  li $v0, 0,                       #   count = 0;
strlen_test: nop                   #   while (*p != '\0') {
    lb $at, 0($a0)                 #     // (*p)
    beq $at, $zero, strlen_done    #     // branch: ! (*p != '\0')
    addi $a0, $a0, 1               #    p++
    addi $v0, $v0, 1               #    count++
  b strlen_test                    #   }
strlen_done:                       #   return count
  jr $ra                                 # }



	.text
main:   nop
	la $a0, my_string
	jal strlen
	
	li $a0, 4294967295
	jal u2a
  move $a0, $v0
  li $v0, 4
  syscall
	
