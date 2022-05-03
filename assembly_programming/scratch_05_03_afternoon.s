.macro save_registers(%one, %two)
   subi $sp, $sp, 8
   sw %one, 4($sp)
   sw %two, 0($sp)
.end_macro


.macro save_registers(%one, %two, %three)
   subi $sp, $sp, 12
   sw %one,   8($sp)
   sw %two,   4($sp)
   sw %three, 0($sp)
.end_macro

.macro restore_registers(%one, %two, %three)
   lw %one,   8($sp)
   lw %two,   4($sp)
   lw %three, 0($sp)
   addi $sp, $sp, 12
.end_macro



# main -> div(a, b) -> dummy 



div:   nop
	# v0: a / b
	# v1: a % b
	# a0: a
	# a1: b
	#--------
	# t0: a
	# t1: b
	# s0: a % b
	# s1: a / b


	# save_s_registers
	save_registers $s0, $s1
	save_registers $gp, $fp, $sp, $ra
	# unmarshall args
	move $t0, $a0
	move $t1, $a1

	# stuff
	###############################
	# marshall args
	# save_registers
	save_register $t0, $t1
  	jal dummy 
  	# restore_registers
  	restore_register $t0, $t1
  	# unmarshall return
  	

  	mult $t0, $t1
  	mfhi $s0
  	mflo $s1

	###############################

	# restore_s_registers
	restore_registers $gp, $fp, $sp, $ra
	restore_registers  $s0, $s1
	# marshall return
	move $v0, $s1
	move $v1, $s0
	jr $ra



dummy: 	nop
 	# Do something
 	# Return
 	jr $ra



main:
            # v0: size
  	# a0: value
  	# a1:
  	#---
  	# t0: value
  	# t1: count
  	# t2: 10
  	# t3: digit
  	# t4: size

  	#save_registers $s0, $s1,...

  	#unmarshall args
  	move $t0 $a0

  	# stuff
    	li $t1, 0	# count = 0;
    top:		# do {
    	
    	#####  Call to DIV
  	#marshall args
  	move $a0, $t0
  	li   $a1, 10
  	save_registers $t0, $t1, $t2, $t3
  	save_registers $gp, $fp, $sp, $ra


  	jal div        #   (digit, value) = div (value, 10);
  	restore_registers $gp, $fp, $sp, $ra
    	restore_registers $t0, $t1, $t2, $t3
  	#unmarshall args
    	move $t3, $v0	
    	move $t0, $v1

    	#####  Call to DIV


    	addi $t3, $t3, '0'	#   digit = digit + '0';
    	subi $sp, $sp, 4	#   push(digit);
    	sw   $t3, 0($sp)

    	addi $t1, $t1, 1	#   count++;
			# 
    	bne $t0, $zero, top	# } while (value != 0);

			# size = count;
			# while (count >0) {
			#   pop(digit) ;
			#   print(digit);
			#   count --;
			# }

return size;


  	#unmarshall args 
  	move $v0, $t4
 	#save_registers $s0, $s1,...


    	jr $ra

