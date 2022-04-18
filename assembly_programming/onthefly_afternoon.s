# t0: count 		# s0:  255 
# t1: sum 		# s1:  10
# t2: checksum 	# s2:  1
# t3: comp 	            # s3:  6
# t4: quot 		# s4:  max_int + 1
# t5: remain 		# s5:
# t6: c      		# s6:
# t7: header    		# s7:
# t8: &header
# t9: 

	.text
#	.include "include/syscall_macros.s"
#	.include "include/my_macros.s"
	.globl main

	.macro inc(%reg)
	   addi  %reg, %reg, 1
	.end_macro

	.macro exit(%imm)
	   li $v0, 17
	   li $a0, %imm
	   syscall
	.end_macro

	.eqv max_int 255

	.data

count: 	  .word	 10		 # int count = 10;
sum: 	  .word	  0		 # int sum = 0;   
checksum: .byte			 # byte checksum; 
comp: 	  .byte			 # byte complement;
quote: 	  .word			 # int quotient;
remain:   .word			 # int remainder;
header:	  .space 10      	 # byte header[10];
c:	  .word

out_str0: .ascii   "Stored Checksum: "
out_str1: .ascii   ", Computed Checksum: "
out_str2: .asciiz  "\n"
err_str:  .asciiz  "Error Detecterd!\n"

	.text


main:		nop
  init:		nop
  		lw $t0, count
  		lw $t1, sum
  		li $s0, 255
  		li $s1, 1
  		li $s3, 6
  		lw $t7, header
  		la $t8, header

  read_sec: 	nop 		# read(STDIN_FILENO, &header, 10);
  		li $v0, 14	# read-syscall
  		li $a0, 0
  		move $a1, $t8
  		li $a2, 10
  		syscall

  for_sec:			# for ( .... ) {}
     for_init:	nop
     		li $t6, 1 	# int c = 1;
     		b for_test

     for_test:	nop
     		ble $t6, $t0, for_body 	#  c <= count
     		b comp_sec

     for_next:	nop
     		inc($t6)	# c ++
     		b for_test

     for_body:	nop
       if_: nop 		# if () { .... }

       if_test:			# c == 6
       		beq $t6, $s3, if_cons
       		b if_alt

       if_cons: nop
       		nop		#  checksum = header[c];
		add $t9, $t6, $t8
       		lbu $t3,  0($t9)

              	nop		#  header[c] = 0;
                sb  $zero, 0($t9) 
                b if_done

       if_alt:	nop		#  ; 
        	b if_done

       if_done: nop
       sum_inc:	nop			# sum += header[c];
		add $t9, $t6, $t8
       		lbu $t3,  0($t9)
       		add $t1, $t1, $t3
     		b for_next

  comp_sec:
  		add $s4, $s0, 1 	# max_int + 1
      		div $t1, $s4
      		mflo $t4		# quotient   = sum / (max_int + 1);
      		mflo $t5		# remainder  = sum % (max_int + 1);
      		add $t1, $t4, $t5	# sum = quotient + remainder;
      		sub $t3, $s0, $t1	# complement = max_int - sum;


  output_sec:			# fprintf, if () {}

  	print_str(0, out_str0, 17)
  	print_int()
  	print_str(0, out_str1, 21)
  	print_int()
  	print_str(0, out_str2, 1)

  	out_if:		nop
  	out_if_test: beq $t2, $t3, out_if_after			# checksum != complement
  	out_if_cons:
  		print_str(err_str)
  		exit(1)

  	out_if_after:	nop 
			exit(0)

