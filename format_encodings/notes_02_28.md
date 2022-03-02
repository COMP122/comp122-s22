# COMP122 Lecture Notes: Feburary 28 & March 1, 2022

## Announcements
   1. Test on March 9th & 10th
   1. Review on March 7th & 8th

## Today's Agenda
   1. Review of 1's and 2's Complement
      * 1's:
        -   X  : 1001 1011 1000 0011
        -  ~ X : 0110 0100 0111 1100 
      * 2's    :
        -   Y  : 0101 1001 1001 1000
        -  - Y : 1010 0110 0110 1000 

   1. Review of Binary Addition and Subtraction
      * -25 - 4 = -29  => (-25) +  (-4)
      * -25: xx xxxx
        *  : -  01 1001  : 1 * 2^4 (16) + 1* 2^3 (8) + 1 * 2^1 (1) = 25
        *  : 10 0111     : encoded -25
      * -4 : xx xxxx
        *  : - 00 0100   : 4 = 4
        *  : 11 1100
      *  ? : 100 011
         *  : - 011 101  = 1 + 4 + 8 + 16
         *  : - 29
   1. Base Conversions
      * Powers of 2: examples
        * 2#  010011101010 111011010111 011110101011
        * 8#  235273473653 
        * 16# 4eaed77ab
        *  4# 103222323113132223
      * mult-add
        * 10# 702
        * 2#  1011
      * Integer division
        -  int x = 5.0 / 2;   x is assigned the value of: 2.5
        -  int x = 5 / 2 ;    x is assigned the value of: 2
        -  int r = 5 % 2 ;    r is assigned the value of: 1
        ```
               46 r 4
             ------
          5 | 234
              20
              --
               34
               30
               --
                4

        ```
   1. Floating Point Numbers
      - - 39.2340
      - - 100111.00111011111001110110110010001011
      - - 1.0011100111011111001110110110010001011 x 2^ 101 (5)
      - Identify the parts:
        - sign: negative
        - mantissa: 0011100111011111001110110110010001011
        - exponent: 101 (5)
      - Pack it in the structure
        - c122f8:
          - exponent: 5 + 3 = 8 (1000)
          - 1 | error | 0011
        - half:
          - exponent: 5 + 15 = 20 ( 1 0100)
          - 1 | 1 0100 | 0011100111 |
        - single:
          - exponent: 5 + 127 = 132  (1000 0100)
          - 1 | 1000 0100 | 00111001110111110011101 |
        - doule
          - exponent: 5 + 1023 = 1028 (0100 0000 0100)
          - 1 | 100 0000 0100 | 0011100111011111001110110110010001011 0...0000 |
## Questions
   1. How does the V-bit work


## Review from Last-time

---
# Today's Material


---
## Resources
## Notes
```
   16 - 15

Step 1. 16 + (-15)
Step 2. 16: 01 0000; 15:  00 1111
Step 3. 16: 01 0000; -15: 11 0001
Step 4.
Step 5. 1
```

1010110:   2+4+16+64 = 86

       2 r 3
   -----
5 |  13
     10
     --
      3

13 / 5 = 2, 3
13 % 5 = 3
---
  1. Review of 1's and 2's complement
      * 1's Complement
        -   X = 10110 1011 1010 0011
        - ~ X = 01001 0100 0101 1100
      * 2's Complement
        -   X = 10110 1011 1010 0011
        - - X = ( ~ X ) + 1
          *  ~ X = 01001 0100 0101 1100
            -    +                    1
            -      01001 0100 0101 1101
   1. Review of Binary Addition and Subtraction
      ```
         1  0000
            1000  # unsigned: 8, signed: -8
         +  1000
         -------
            0000   # Note: Carry but no overflow

         0  1000
            0100 # unsiged 4, signed:  4 
         +  0100
         -------
            1000  # Note: Carry but no overflow

      ```


   1. Base Conversions
      - 16#  afac12  ->  8# 53726022
        * 2# 1010 1111 1010 1100 0001 0010 
        * 2# 101 011 111 010 110 000 010 010

   1. Floating Point numbers
      ``` 
      number:  - 0.0567
      Step 1: convert to binary
          whole: 0 -> 0
          fractional: 000011101000001111100100001001
              max = 1,0000
              567 * 2 = 1134, -> 0
              1134 * 2 = 2268 -> 0
              2268 * 2 = 4536 -> 0
              4536 * 2 = 9072 -> 0
              9072 * 2 = 1,8144 -> 1
              8144 * 2 = 1,6288 -> 1
      Step 2: Scientific Notation
          1.1101000001111100100001001  x 2^ -101 (-5)
      Step 3: Pick the format
          Single
      Step 4: Identify parts
          - sign:  negative ->  1
          - mantissa: 11010000011111001000010 01
          - exponent: -5 + 127 = 122 -> 0111 1010
      Step 5: Pack it.
           1 0111 1010 11010000011111001000010

      ```

