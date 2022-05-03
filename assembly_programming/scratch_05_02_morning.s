percent_unsigned_base:
  # v0: count
  # a0: value
  # a1: base
  # t0: value
  # t1: base
  # t2: digit
  # t8: size
  # t9: count

  move $t0, $a0     # demarshall 
  move $t1, $a1
  #save_s_registers  -- Not using any, so don't bother!


  move $t9, $zero       # count = 0;
l1:                     #   do {
    div $t0, $t1        #     digit = value % base;
    mflo $t0            #     value = value / base;
    mfhi $t2

    addi $t2, $t2, '0'  # base is <=10

################################################################################################
    #marshal args       #     push(digit2ascii(digit));   

    move $a0, $t2
    #save registers
    save_register $t0, $t1, $t2, $t8, $t9 # save all the 't's
    save_special # save ra, sp, fp, gp

    jal push
    restore_special
    #restores registers
    restore_register $t0, $t1, $t2, $t8, $t9

    nop                 # demarshall
    move $v0, $v0
                        #     push(digit2ascii(digit));   
################################################################################################                        
    addi $t9, $t9, 1    #     count++;
    
    bnez $t0, l1        #   } while (value != 0);
                        # 
                        #   size = count;
l2:                     #   do {
                        #      pop((*buffer[0]));
                        #      count --;
                        #      buffer++;
   bgt $t9, $zero, l2   #   } while (count > 0 );

  # restore_s_registers -- Not using any, so ....
  move $vo,  $t8    #  return size;
  jr $ra              


push: