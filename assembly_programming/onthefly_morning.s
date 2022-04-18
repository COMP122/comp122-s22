		.text

    	.macro exit(%v)
    	    li $v0, 17 
    	    li $a0, %v
    	    syscall
    	.end_macro


#		.include "include/syscalls_macros.s"
		.eqv max_int 255


		.data
count:  	.word 10
sum:		.word 0   
checksum: 	.byte 
complement: .byte
quotient: 	.word
remainder: 	.word
header:		.space 10

output_str: .ascii   "Stored Checksum: "
o_s_1:		.ascii   ", Computed Checksum: "
o_s_2:		.asciiz  "\n"
error_str:  .asciiz  "Error Detected!\n"


	.text
	
main: 	nop

# t0: count 		  # s0:  255 
# t1: sum 		    # s1:  10
# t2: checksum 		# s2:  1
# t3: complement 	# s3:  6
# t4: quot 		    # s4:  max_int + 1
# t5: rem 		    # s5:
# t6: header  		# s6:
# t7: &header    	# s7:
# t8: c
# t9: addressing of array


init_sec:
	li $s0, max_int
	li $s1, 10
	li $s2, 1
	li $s3, 6

	li  $t0, 10 		# count = 10
	li  $t1, 0 			# sum = 0
	la  $t7, header

read_sec:
	li $v0, 14
	li $a0, 0
	li $a1, $t7
	li $a2, 10
	syscall

loop_sec:
	 loop_init:
	 			li $t8, 1  				# int c = 1
	 			b loop_test

   loop_test:
   			ble  $8, $t0, loop_body  #  c <= count 
        b comp_sec

   loop_body:
   			#stuff

   			# if: test, cons, alt, after

  fi_test:
  			# c == 6
  			beq $t8, $s3, fi_cons
  		  b fi_alt

  fi_cons:
     # checksum = header[c];
     add $t9, $t7, $8
     lb $t2, 0($t9)

     # header[c] = 0;
     sb $zero, 0($t9)
        b fi_after


  fi_alt:
  			nop
        b fi_after

	fi_after: 
		  	#  sum += header[c];
     add $t9, $t7, $8
     lb $t2, 0($t9)
     add $t, $t1, $t2
   			b next
   

   loop_next:
   			addi $t8, $t8, 1   # c ++
   			b loop_test



comp_sec:
	addi 	$s4, 255, 1			# max_int + 1;
	div $t1, $s4	        # rem, quot  = sum / (max_int + 1);
	mfhi $t5     					# rem
	mflo $t4						  # quot

	add $t1, $t4, $t5     # sum = quotient + remainder;
	sub $t3, $s0, $t1     # complement = max_int - sum;




output_sec:
		#print_string(output_str), print_int(checksum)
		#print_string(o_s_1), pring_int(complement)
		#print_string(o_s_2)

  if_test:
  		# checksum != complement
  		bne $t2, $t3, if_cons
  		b if_alt

  if_cons:
        #print_err_str(err_str)		# printf
        b if_after

  if_alt:
        nop 				# nothing
        b if_after

  if_after:
    	nop # return 0
    	exit(0)
