


.macro average($v0, $t2, $t3)
  mult $t2, $t3
  mflo $v0
  srl $v0, 2
.end_macro

.macro strlen(%str)         # int strlen(str) {
  la $a0, str               #   p = str;
  li $v0, 0,                #   count = 0;
test:                       #   while (*p != '\0') {
  lb $at, 0($a0)            #     // (*p)
  beq $at, $zero, done      #     // branch: ! (*p != '\0')
  addi $a0, $a0, 4          #    p++
  addi $v0, $v0, 1          #    count++
  b test                    #   }
done:                       #   return count
                            # }


# Usage: push rt 
# Semantics: pushes a value ontop of the stack
.macro push(%rt)   
  sw %rt, 0($sp)
  addi $sp, $sp, 4
.end_macro


# Usage: pop 
# Semantics: pops a value off the stack, without storing value
.macro pop()
   addi $sp, $sp, 4
.end_macro


# Usage: pop rt
# Semantics: pops a value off the stack, and place the value into rd
.macro pop(%rt)
  lw %rt, 0($sp)
  addi $sp, $sp, 4
.end_macro


# Usage: rsubi rd, rs, imm
# Semantics: rd = imm - rt
# Purpose: Simulates the RSB instruction on the ARM processor
.macro rsubi (%rd, %rt, %imm)
    li $at, %imm
    sub %d, $at, %rt
.end_macro


# Usage: load10_w  label, rs
# Semantics:  
#    loads lable[rs] .. label[rs+9 into the "t" registers
# Side_effects:
#    the value of the rs is incremented by 10
.macro load10_w(%label, %rs)
    la $at, %label(%rs)
    lw $t0, 0($at)
    lw $t1, 4($at)
    lw $t2, 8($at)
    lw $t3, 12($at)
    lw $t4, 16($at)
    lw $t5, 20($at)
    lw $t6, 24($at)
    lw $t7, 28($at)
    lw $t8, 32($at)
    lw $t9, 36($at)
    addu %rs, %rs, 40
.end_macro

