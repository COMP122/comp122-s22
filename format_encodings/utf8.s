#######################
## utf8.s
##
## MIPS assemble code to encode/decode UTF8.
## 
## Name:  encode_utf8
## Usage:
##     remaining = encode_utf8(&buf_in, &buf_out, number)
##         const byte buf_in[ number << 1 ];
##               byte buf_out[ (number << 1)*4+1];
##         const int  size;
##               int  remaining; # bytes not processed
## Semantics:
##   1. buf_in is an array of unicode characters
##      - each unicode characters require two bytes
##   2. each character is encode into its equivalent UTF-8 value
##      - each unicode character can 
##   3. the null character is converted to 0xC080 
##      - this allows for normal null-terminated string processing
##      - this is also known oa Modified UTF-8 (MUTF-8) encoding
##   4. the maximum size of the UTF-8 string is size*4+1 bytes
##   5. buf_out contains the UTF-8 string which is null terminated
##   6. the return value indicates the number of bytes that remain to be processed.
##      - 0: success
##      - 1: error
##
## Name:  decode_utf8
## Usage:
##     remaining = decode_utf8(&buf_in, &buf_out, size)
##         const byte buf_in[size];
##               byte buf_out[size*4+1];
##         const int  size;
##               int  remaining; # bytes not processed
## Semantics:
##   1. buf_in contains "size" utf-8 encoded characters
##   2. each character is encode into its equivalent UTF-8 value
##   3. the null character is converted to 0xC080 
##      - this allows for normal null-terminated string processing
##      - this is also known oa Modified UTF-8 (MUTF-8) encoding
##   4. the maximum size of the UTF-8 string is size*4+1 bytes
##   5. buf_out contains the UTF-8 string which is null terminated
##   6. the return value indicates the number of bytes that remain to be processed.
##      - 0: success
##      - 1: error
##



## Requirements:
##   1. callee must allocate sufficient space prior to invocation
##   2. callee must address unprocessed bytes 

##Semantics:

##    

decode_utf8:


encode_utf8:

	# Following are the masks used to determine the location of the MSB.
	.eqv     seven    0x00007F      #  2#                     0111 1111
	.eqv    eleven    0x0007FF      #  2#                0111 1111 1111
	.eqv   sixteen    0x00FFFF      #  2#           1111 1111 1111 1111
	.eqv twentyone    0x1FFFFF      #  2# 0001 1111 1111 1111 1111 1111 

	# Following are the prefixes used within the UTF-8 encoding
	.eqv prefix_cont  0x80          # 2# 10 000000 == 1000 0000
	.eqv prefix_two   0xC0          # 2# 110 00000 == 1100 0000
	.eqv prefix_three 0XE0          # 2# 1110 0000 == 1110 0000
	.eqv prefix_four  0XF0          # 2# 11110 000 == 1111 0000

	# Following are the masks associated with the UTF-8 framing bits
	.equ mask_cont    0XC0          # 2# 11 000000
    .equ mask_two     0xE0          # 2# 111 00000
    .eqv mask_three   0xF0          # 2# 1111 0000
    .eqv mask_four    0xF8          # 2# 11111 000


    # Following are the values of the UTF-8 framing bits
    .eqv frame_four   0xF8C0C0C0      # 2# 11110 000 10 000000 10 000000 10 000000
    .eqv frame_three  0x00F0C0C0      # 2# 1110 0000 10 000000 10 000000
    .equ frame_two    0x0000E0C0      # 2#                     110 00000 10 000000



.macro_implode()
# This is a thunk decodes a UTF-8 encoding
# Usage: $v0 = implode(const $a0)
#		$a0 : a single UTF-8 Character
#       $v0 : a single Unicode Character
#       $v1 : number of bytes used by the Unicode Character
#             1: standard ascii   (one-byte sequence)
#             2: unicode fixpoint  (two-byte sequence)
#             3: whatever it may be (three-byte sequence)
#
# Assumptions:
#       $a0 contains the UTF-8 character, left justified
#           : this allows the $a0 register to contain a number of UTF-8 characters
#       $v0 contains the Unicode character, right justified
# 
#

Algorithm:
  1. determine the number of bytes used

  $t0 = $a0 & ( mask_four << 24 )
  $t1 = frame_four << 24
  beq $t0, $t1, Label

2. validate prefixes


 
.end_macro

.macro explode()
# This is a thunk encodes a single Unicode Character into UTF-8
# Usage: $v0 = explode(const $a0)
#		$a0 : a single Unicode Character
#       $v0 : number of UTF-8 bytes in the encoding
#             0 : error
#             1..4 : number of UTF-8 bytes
#
# Side-effects: 
#     t1: first utf-8 byte
#     t2: second utf-8 byte
#     t3: third utf-8 byte
#     t4: fourth utf-8 byte
# ? should we pack the four bytes into $v1?
#
# Register usage:
#     t0: temp register 



	# Special Case: Check of the NULL
	beqz $a0, bytes_2    # l=11, b=2   # encoding is 110 00000 10 000000

	# Compute the length
	andi $t0, $a0, seven
	beq  $t0, bytes_1    # l=7,  b=1

	andi $t0, $a0, eleven
	beq  $t0, bytes_2    # l=11, b=2

	andi $t0, $a0, sixteen
	beq  $t0, bytes_3    # l=16, b=3

	andi $t1, $a0, twentyone
	beq  $t1, bytes_4    # l=21, b=4

    li   $v0, 0          # error, > 2^21, and hence not a unicode number
    jr   $ra

 bytes_1:
 	li   $v0, 1 		   		 # v0 = 1
                        		 # t1 = x
                        		 # t2 = x
                        		 # t3 = x
	andi $s4, $a0, seven         # t4 = $a0 & seven

	jr   $ra


bytes_2:
	li   $v0, 2 		         # v0 = 2
	          					 # t1 = x
	          					 # t2 = x
	srl  $t3, $a0, 6			 # t3 = prefix_two   | $a0 >> 6
	ori  $t3, $t3, prefix_two

	andi $t4, $a0, six    	     # t4 = prefix_cont  | $a0 & six
	ori  $t4, $t4, prefix_cont
	jr   $ra


bytes_3:
	li   $v0, 3 	             # v0 = 3
	                             # t1 = x
	srl  $t2, $a0, 12			 # t2 = prefix_three | $a0 >> 12
	ori  $t2, $t2, prefix_three

	srl  $t3, $a0, 6			 # t3 = prefix_cont  | ($a0 >> 6) & six
	andi $t3, $t3, six
	ori  $t3, $t3, prefix_cont
               
	andi $t3, $a0, six           # t4 = prefix_cont  | $a0 & six
	ori  $t3, $t3, prefix_cont
	jr   $ra

bytes_4:
	li   $v0, 4 				 # v0 = 4
								
	srl  $t1, $a0, 18			 # t1 = prefix_four  | ($a0 >> 18)
	ori  $t1, $t1, prefix_four

	srl  $t2, $a0, 12			 # t2 = prefix_cont  | ($a0 >> 12) & six
	andi $t2, $t2, six
	ori  $t2, $t2, prefix_cont

	srl  $t3, $a0, 6		     # t3 = prefix_cont  | ($a0 >> 6) & six
	andi $t3, $t3, six
	ori  $t3, $t3, prefix_cont

               
	andi $t3, $a0, six           # t4 = prefix_cont  | $a0 & six
	ori  $t3, $t3, prefix_cont

	jr   $ra

.end_macro




.macro explode_setup() 
	li $t1, seven
	li $t2, eleven
	li $t3, sixteen
	li $t4, twentyone
.end_macro

# a0: a Unicode Value
# s1: first utf-8 byte
# s2: second utf-8 byte
# s3: third utf-8 byte
# s3: forth utf-8 byte

