 	.text
 	.eqv X 0x88
 	
 main:	nop
        
        sw $t0, 0 ($s0)
        srl  $a0, $ra, 6
        andi  $v0, $gp, 0x27
        
        
        
