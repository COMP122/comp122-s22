.macro save_s_registers(%one, %two)

.end_macro

.macro save_s_registers(%one, %two, %three)
   addi $sp, $sp, 12
   sw  %one,   8($sp)
   sw  %two,   4($sp)
   sw  %three, 0($sp)
.end_macro


.macro restore_s_registers(%one, %two, %three)
   lw  %one,   8($sp)
   lw  %two,   4($sp)
   lw  %three, 0($sp)
   addi $sp, $sp, -12
.end_macro





int average(int a, b, c, d) {
    x = sum(d, c, b, a);
    m = min(a, b, c, d);
    a = (x - m ) / 3;

    return a;
 }


int average		# int average(int a, b, c, d) {
    # a0: a
    # a1: b
    # a2: c
    # a3: d	
    # t1: x
    # t2: m
    # t3:
    # s0: a
    # s1: b
    # s2: c
    # s3: d	

    save_s_registers $s0, $s1, $s2, $s3
    #unmarshall
    move $s0, $a0    
    move $s1, $a1
    move $s2, $a2
    move $s3, $a3


    # --  call sub
    # marshal args
    move $a0, $s3
    move $a1, $s2
    move $a2, $s1
    move $a3, $s0

    # save t registers
    save_t_registers $t1, $t2

    jal  sum	#     x = sum(d, c, b, a);
    restore_t_registers $t1, $t2
    move $t1, $v0       # demarshal return
    


    # -- call sub
    # marshal args
    move $a0, $t1
    move $a0, $s1
    move $a0, $s3   
    move $a0, $s0

    save_t_registers $t1, $t2
    jal min #     m = min(x, b, d, a);
    restore_t_registers $t1, $t2
    move $t2,  $v0   # demarshal return


		#     a = (x - m ) / 3;
		# 


    mv $v0, $s0	#     return a;
    restore_s_registers $s0, $s1, $s2, $s3
    jr $ra
		#  }




sum: nop			# int sum(int a, b, c, d) {
    # a0: a
    # a1: b
    # a2: c
    # a3: d	
    # t1: X1 
    # t2: X2
    # t3: X3
    # s0: a
    # s1: b
    # s2: c
    # s3: d

    save_s_registers $s0, $s1, $s2, $s3

    move $s0, $a0  #     unmarshall are values
    move $s1, $a1
    move $s2, $a2
    move $s3, $a3

    			#     //   x0 = a + b + c + d; 
    add $t1, $s0, $s1		#     x1 = a + b;
    add $t2, $t1, $s2		#     x2 = x1 + c;
    add $t3, $t2, $s3		#     x3 = x2 + d;

    move $v0, $t3	            #marshall return
    restore_s_regsisters $s0, $s1, $s2, $s3
    jr $ra			#     return X3
			# }












int min(int a, b, c, d) {

   if (a < b) {
      x = a;
   } else {
      x = b;	
   }


}

