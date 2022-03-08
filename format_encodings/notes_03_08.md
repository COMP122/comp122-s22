# COMP122 Lecture Notes: March 7 & 8, 2022

## Announcements
   1. Test on Wednesday/Thursday 

## Today's Agenda
   1. Review Session
   1. Got Questions?

## Morning Questions:
   1. Chunking
   1. Mars Encoding
   1. UTF-8
   1. Floating Point  
   1. BCD
   1. Bitwise

## Afternoon Questions and Material:
   1. Mac Address (48 bits)
      - 10111010 10100111 11110111 01011011 10111110 11011101
      - 1011 1010 : 1010 0111 : 1111 0111 : 0101 1011 : 1011 1110 : 1101 1101
      - BA        : A7        : F7        : 5B        : BE        : DD

   1. IP address (32 bits)
      - dotted decimal format
      - 10101101 . 10101011 .  11101010 . 10100100
      - 10101101:
        ```
        128 + 32 + 8 + 4 + 1 = 1 + 4+ 8 + 32 + 128 = ?   - Via Expanded Notation
        v = 0 * 2 + 1;
        v = v * 2 + 0
        v = v * 2 + 1
        ``` 

   1. UTF-8
      - sequence:  0110101  11011011 10110000  11101101 10110010 01001001
        - 011 0101
          - ASCII: 35 -- '5'
        - 11011011 10110000
          - xxx 11011 xx 110000 -->  0110 1111 0000
          - 16# 6F0  -- 'EXTENDED ARABIC-INDIC DIGIT ZERO'
        - 11101101 10110010 01001001
          - (1110) 1101  (10)110010  (10) error 


   1. Floating Point: encoding of a real number
      - half:  Java got not stink'en half: 1 + 5 + 10  = 16
        - how many bits do I need: 11
      - single: Java: float Y;  binary32:  1 + 8 + 23  = 32
        - how many bits do I need: 24
      - double: Java: double X; binary64:  1 + 11 + 52 = 64
        - how many bits do I need: 53

      *  1234.0625
         - 1234 -> 2# 10011010010.0001
         ```
         1234 / 2 -> 617, 0
         617 / 2 -> 308, 1
         308 / 2 -> 154, 0
         154 / 2 -> 77, 0
         77 / 2 -> 38, 1
         38 / 2 -> 19, 0
         19 / 2 -> 9, 1
         9 / 2 -> 4, 1
         4 / 2 -> 2, 0
         2 / 2 -> 1, 0
         1 / 2 -> 0, 1
         0 / 2 -> 0, 0
         ```
         - .0625 -> 2# 0.0001
         ```
         max: 1,0000:
         0625 * 2 =  0, 1250
         1250 * 2 =  0, 2500
         2500 * 2 =  0, 5000
         5000 * 2 =  1, 0000
         0000 * 2 =  0, 0000  # converge on zero
         0000 * 2 
         ```
         - 2# 1.00110100100001 x 2^ 1010 (10)
           - half:    x xxxxx xxxxxxxxxx
             -        0 11001 0011010010
           - single:  x xxxxxxxx xxxxxxxxxxxxxxxxxxxxxxx
             -        0 10001001 00110100100001000000000
           - double:  x xxxxxxxxxxx xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
             -        0 xxxxxxxxxxx 0011010010000100000000000000000000000000000000000000
         - Computation of the bias
           - half:   01111
             ```
               01111
             +  1010
             -------
               11001
             ```
           - single: 01111111
             ```
               01111111
             +     1010
             ----------
               10001001
             ```        
           - double: 01111111111

   1. Encoding of Whole, Counting numbers: unsigned
      - convert to base2 

   1. Encoding of Integers:
      1. bias 
      1. 1s complement
      1. 2s complement

      ```java
      short int x;  // 16-bit quantity encoded 2 complement
      unsigned short int y;  // 16-bit quantity encoded as a base2 number

      x = -5; // valid
      y = -7; // invalid

      ```
      * -5 :
        abs(-5): 5    : 0000 0000 0000 0101   : 2s complement, 1s complement & base2 encoding of 5
        \~(abs(-5))   : 1111 1111 1111 1010   : 1s complement encoding of -5
        \~(abs(-5))+1 : 1111 1111 1111 1011   : 2s complement encoding of -5

   1. Bitwise: Shifts (Signed and Unsigned)
      - x << 1
        *  1111 1111 1111 1011 << 1 : 111 1111 1111 10110
      - x >> 1 (sra arithmetic, signed shift), were x = -5
        *  1 | 111 1111 1111 1011 >> 1 :    1 | 1111 1111 1111 101
      - x >> 1 (sra arithmetic, signed shift), were x = 32,765
        *  0 | 111 1111 1111 1101 >> 1 :    00111 1111 1111 110

      - x >>> 1 (srl, unsigned shift)
        *  1111 1111 1111 1011 >> 1 : 01111 1111 1111 101


---
# Today's Morning Material

1. Chunking: 
   1. 100010101111100011100011100011100011010101011100010
      - 2#  100010101111100011100011100011100011010101011100010
      - 16# 457C71C71AAE2
        - 2# 0100 0101 0111 1100 0111 0001 1100 0111 0001 1010 1010 1110 0010
      - 8# 42574343434325342
        - 2# 100 010 101 111 100 011 100 011 100 011 100 011 010 101 011 100 010
      - 4# 101111330130130130122223202
        - 2# 01 00 01 01 01 11 11 00 01 11 00 01 11 00 01 11 00 01 10 10 10 10 11 10 00 10
      - unicode (java) 16 bit quanities
        - 0100 0101 0111 1100 |  0111 0001 1100 0111 | 0001 1010 1010 1110 | 0010
      - ASCII (Char) 8 bit quanities
       - 0100 0101 |  0111 1100 |  0111 0001 | 1100 0111 | 0001 1010 | 1010 1110 | 0010 
      - MIPS instruction:
          * R type: opcode(6), rd (5), rt (5), rs (5), sh (5), func (6)
          * I type: opccoe(6), rd (5), rt (5), imm (16)
          * J type: ocode(6), addr (26)
            - 0100 0101 |  0111 1100 |  0111 0001 | 1100 0111  --- | 0001 1010 | 1010 1110 | 0010 
            - 0100 01 | 01011 | 11100 | 01110 | 00111 | 000111
            - srav $t3, $gp, $t6
      - UTF-8
        - 11110101 10100100 10111000 10101101 01101010 11010000 10111010 0100101
          - 11110101 10100100 10111000 10101101
            - xxxxx101 xx100100 xx111000 xx101101
            - 00001 0110 0100 1110 0010 1101
            - 16# 164c2d
          - 01101010
            - 0110 1010
            - 16# 6A  'j'
          - 11010000 10111010
            - xxx10000 xx111010
            - 0100 0011 1010
            - 16# 43a  'CYRILLIC SMALL LETTER KA' 
          - 0100101
      - floating point: binary32
        - 1000 1010 1111 1000 1110 0011 1000 1110 --- 0011 0101 0101 1100 010 
        - 1 + 8 + 23
        - 1 | 000 1010 1 | 111 1000 1110 0011 1000 1110 
        - - 1.111 1000 1110 0011 1000 1110 x 2^ - 0110 1010 ()

      * expon
        ```
           0000 0010
           0001 0101
        +  1000 0001
        ============
           1001 0110 =>  - 0110 1010
        ```

      * BCD:  23456345632
        - 0010 0011 0100 0101 0110 0011 0100 0101 0110 0011 0010
      * BCD: 0111 0100 0101 0011 1010
        - 7456 "error"

      * BCD Math
        - 45 + 55
        ```
             1   1011   1010       
                 0100   0101
               + 0101   0101
               ------  -----
                11100  11100
                 1010   1010
               + 0110 + 0110
               ------ ------
          0001   0000   0000
        ```
        - 100

1. Floating Point: 
   - 10#  234.456 -> 2# 11101010.0111010001110011001110010
     - 2# 1.11010100111010001110011001110010 x 2^ 111  (7)
     - | x | xxxxx | xxxxxxxxxx |  : binary16
     -   0   10110   1101010011
     - Expon:
     ```
          1 1110
          0 1111
      +     0111
      ===========
          1 0110
      ```

   - 234 -> 2# 11101010.
   ```
   234 / 2 -> 117, 0
   117 / 2 ->  58, 1
    58 / 2 ->  29, 0
    29 / 2 ->  14, 1
    14 / 2 ->   7, 0
     7 / 2 ->   3, 1
     3 / 2 ->   1, 1
     1 / 2 ->   0, 1 

   ```
   - .456 -> 2# 0.011101
   ```
   max: 1,000

   456 * 2 ->  0, 912
   912 * 2 ->  1, 824
   824 * 2 ->  1, 648
   648 * 2 ->  1, 296
   296 * 2 ->  0, 592
   592 * 2 ->  1, 184


   ```

1. Bitwise:
   - shifting of signed and unsigned
     - X = 1111 1111 1111 1001
        - 2's complement : -7
        - base 2 encoding: 65,529
   - X << 1 (shift left)
     - 111 1111 1111 10010
   - X >> 1 (shift signed) (sheft right arithmetic)
     - 11111 1111 1111 100
   - X >>> 1   (shift unsigned)
     - 0 1111 1111 1111 100 (shift right logical)

1. Negative numbers, encoding them using
   1. Use a bias...
   1. 1s complement
   1. 2s complement

1. Java 
   -  signed short int x;     x is encode as 2s complement using 16-bits
   - unsigned short int y;    y is encode as base2 encoding using 16-bits

   - x = 5;  (valid)      0 000 0000 0000 0101
   - x = -7; (valid)
   - y = 5;  (valid)      0000 0000 0000 0101
   - y = -7; (not valid)

1. Encode -7 in 2's complement
   - abs(-7) = 7   : 0000 0000 0000 0111
   - ~ abs(-7)     : 1111 1111 1111 1000
   - ~ abs(-7) + 1 : 1111 1111 1111 1001   <--  -7 in 2's complement
---
## Resources
## Notes