# This file was created as a class exercise 
# during the morning session of COMP 122
#
# The slides (Base64_Operations.pdf) presented during
# class were used to guide the construction of this MIPS code

        .data
input:  .byte 0xfa
        .byte 0xca
        .byte 0xde
        .space 1
str:    .asciiz "Hello this is my string"
output: .byte 0xFF
        .byte 0xFF
        .byte 0xFF
        .byte 0xFF
        
        .text 
        .include "syscall_macros.asm"
        .globl main
        
        
        .macro call_map(%r)
           move $a0, %r
           jal map
           move %r, $v0
        .end_macro
        

main:   nop   #Start of main

                      # call encode
                      # load the input arguements into $a0..$a3
        jal encode    # jump and link to encode
                      # move the return value ($v0) to the right location 
    
        
        halt()
        
encode:  nop    # insert my code for base64 encode

        lbu $a1, input
        lbu $a2, input+1
        lbu $a3, input+2
        
        sll $a1, $a1, 16
        sll $a2, $a2, 8
        sll $a3, $a3, 0   # equivalent to a nop
        
        or $a0, $a1, $a2
        or $a0, $a0, $a3
        
        andi $s1, $a0, 0xFC0000
        srl  $s1, $s1, 18
        
        andi $s2, $a0, 0x3F000
        srl  $s2, $s2, 12
        
        andi $s3, $a0, 0xFC0
        srl  $s3, $s3, 6
        
        andi $s4, $a0, 0x3F
        srl  $s4, $s4, 0    # nop
        
        call_map($s1)
        call_map($s2)
        call_map($s3)
        call_map($s4)
        
        # store $s1
        la $t9, output
        sb $a1, 0($t9)  #  output + 0
        sb $a2, 1($t9)  #  output + 1
        sb $a3, 2($t9)  #  output + 2
        
        jr $ra
        
map:    nop # my method to map from base64 --> ascii
        # Note that this subroutine is incomplete
        # It only works for the range of A..Z       

        move $t0, $a0
        addi $t0, $t0, 'A'
        move $v0, $a0 
        jr $ra
      
      
