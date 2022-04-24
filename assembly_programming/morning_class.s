
# print_float(num)

# IEEE Binary32
# Format:  s eeeeeeee mmm mmmm mmmm mmmm mmmm mmmm
# Bais:      01111111

# f2a: converts a Binary32 value to ascii string

	.data
	.align 1
buff:	.space 1024


main:	nop
	la $a0, buff
	move $a1, $f0


f2a:	nop		#  f2a(&buff, float)
	# v0 : size of buff
	# a0 : address of my buffer
	# a1 : float
	# a2 : sign
	# a3 : whole
	# a4 : fract
	# t0 : expon
	# t1 : combined number
	# t2 : whole
	# t3 : fract

	li $v0, 0



split:	nop

            nop # sign ############################################
s_sign:	blt $a1, $zero, neg             # (a1 < 0)? '-' : '+';
	li $a2, '+'
	b s_expon
neg:	li $a2, '-'
	b s_expon
	nop ##################################################

s_expon:	# expon
            # Format:  s eeeeeeee mmm mmmm mmmm mmmm mmmm mmmm
            # Mask:    0111 1111 1000 0000 0000 0000 0000 0000
            # miss 1:  0000 0000 1.000 0000 0000 0000 0000 0000
            # Mask:   0x7F800000
unbias:	nop	# Un bias the expon
            andi $t0, $a1, 0x7F800000
            srl  $t0, $t0, 23
            subi $t0, $t0, 0x7F   #The bias is 0b 0111 1111

shift:	nop	# Add the 1. back to the mantissa and shift the value
	# mantissa 
	addi $t1, $a1, 0x7FFFFF
	ori  $t1, $t1, 0x800000


0000000000000000000000  1.mmm mmmm mmmm mmmm mmmm mmmm 000000000000000000000000000000000
                         | 
                         expon - 23,  exp + 9
            sllv $t1, $t0

convert_whole: nop	# Convert the whole part from binary to decimal
convert_fract: nop 	# Convert the fractional part from binary to decimal

piece_together: nop	# string copy sign, whole, '.', and the fract


	jr $ra
