# COMP122 Lecture Notes: March 2 & 3, 2022

## Announcements
   1. Exam
      - March 9th/10th -- based upon you class
      - it's online -- just like the last quiz
      - but during classtime
   1. Review
      - Monday/Tuesday March 7th/8th

## Today's Agenda
   1. Floating Point Encoding
   1. Bitwise Operations
   1. Base64

## Questions


## Today's 
   1. Floating Point Encoding
```
10#    + 432.4563
2#  + 0110110000.011101
8#  + 660.35

```

```
Take the whole and convert to binary,
via successive divisions

432 / 2 -> 216, 0
216 / 2 -> 108, 0
108 / 2 -> 54, 0
54 / 2 -> 27, 0
27 / 2 -> 13, 1
13 / 2 -> 6, 1
6 / 2 -> 3, 0
3 / 2 -> 1, 1
1/ 2 -> 0, 1
0/ 2 -> 0, 0

copy the bits from bottom to top: 0110110000

```

float X = + 432.4563;
double Y = + 432.4563

```
Take the fractional and convert to binary,
via successive multiplations
max: 1,0000  == 10^4

4563 * 2 -> 0,9126
9126 * 2 -> 1,8252
8252 * 2 -> 1,6504
6504 * 2 -> 1,3008
3008 * 2 -> 0,6016
6016 * 2 -> 1,2032

copy the bits from top to bottom: 011101

```

```
Put the number into scientific notation:

2#  + 110110000.011101
2#  + 110110000.011101 x 2^ 0
2#  + 1.10110000011101 x 2^ 1000  (8)
```

```
Identify the parts:
1. sign: +
1. whole: 1  (always)
1. mantissa: 10110000011101
1. exponent: 1000  (8)
```

Package the number into the correct encoding
- binary16
- expon: 8 + 15 (bias) = 23  (1 0111)
  * x xxxxx xxxxxxxxxx
  * 0 10111 1011000001

- binary32
- expon: 8 + 127 (bias) = 135  (1000 0111)
  * x xxxxxxxx xxxxxxxxxxxxxxxxxxxxxxx
  * 0 10000111 10110000011101000000000

   1. Bitwise Operations
      - Boolean Based
      ```
      if (~ A ) {
        x = 4.3
      }
      ```
        * X = 6 & 12  -- X is assigned to 4
        * Y = 6 | 12  -- Y is assigned to 14
      - Shift Based

      ```
      - 6 << 1 ==  6 * 2 == 12
        * 6:   0000 0110
        * 12:  0000 1100
      - 6 >> 1 ==  6 / 2 == 3
        * 6:   0000 0110
        * 3:   00000 011     
      - -6 >> 1 == -6 / 2 == -3
        * 6:   0000 0110
        * -6:  1111 1010
        * -3:  11111 101
        * 3:   00000 011

      - But what if the number is unsigned
        * "1111 1010" >>> 1 ==  "0 1111101"
        * Note same bit pattern as -6 
        * shift right logical

      ```

      - rotate, with 8 bit words
      ```
      1100 1100  : orginal
      0011 0011  : rol $s1, $t1, 2

      00 1100 00 : sll $s1, $t1, 2
      00 0000 11 : srl $at, $t1, 6
      00 1100 11 : or $s1, $s1, $at

      ```

      - mask:     0100 0000 : x040
      - A:        0?00 1110
      - A & 0x40: 0100 0000
      - Z: 0, S:0
        - 1 & 1 = 1

   1. Base64
```
xxxx xxxx xxxx xxxx xxxx xxxx
1010 0100 0000 0000 0000 0000
0000 0000 1001 0110 0000 0000
0000 0000 0000 0000 0011 0111
1010 0100 1001 0110 0011 0111 :  meld
```

```
101001 001001 011000 110111

```
















## Announcements
   1. Exam
      - online
      - during class time
      - on the day you meet:  March 9th/10th
   1. Review:  March 7th/8th

## Today's Agenda
   1. Floating Point Review
```
10#      - 234.234
2#   - 11101010.001110111110
8#   - 352.16769

```

```
Put into Scientic Notation

2#   - 11101010.001110111110
2#   - 11101010.001110111110  x 2^  0
2#   - 1.1101010001110111110  x 2^ 111   (-
	7)

```

```
Identify the parts:
sign: -
whole: 1  (always)
mantissa: 1101010001110111110
expon:  111 (7)
```
```
Package it up!
  -- 32 bits:  single
  -- Java:   float X = - 234.234;
  -- Expon: 7 + 127 (bias)  = 134
     0111 1111
     0000 0111
     ---------
     1000 0110

  x xxxxxxxx xxxxxxxxxxxxxxxxxxxxxxx
  1 10000110 11010100011101111100000

  -- 16 bits: half
  -- Expon: 7 + 15 (bias) = 22 -> 1 0110

  x xxxxx xxxxxxxxxx
  1 10110 1101010001
```

```
2# 011 101 010.
8# 352

2#  0.001 110 111 110 000 000 0000000000
8#  000.16769
```

```
Convert 234 to binary.
  234 / 2 -> 117, 0
  117 / 2 -> 58, 1
  58  / 2 -> 29, 0
  29  / 2 -> 14, 1
  14  / 2 -> 7, 0
  7   / 2 -> 3, 1
  3   / 2 -> 1, 1
  1   / 2 -> 0, 1
  0   / 2 -> 0, 0   # Work up
```

```
Convert .234 to binary
max=1,000

234 * 2 = 0,468
468 * 2 = 0,936
936 * 2 = 1,872
872 * 2 = 1,744
744 * 2 = 1,488
488 * 2 = 0,976
976 * 2 = 1,952
952 * 2 = 1,904
904 * 2 = 1,808
808 * 2 = 1,616
616 * 2 = 1,232
232 * 2 = 0,464
```

   1. Bitwise Operations

      - Boolean Based:
      ```
      if (A !=3 && B == 7) {
      	X = 5;
      }
      ```
      ```
      X = 6 | 12;
      X is assigned the value: 14
      ```
      - Shift Based: 
        ```
        xxxx xxxx xxxx xxxx
        0101 1110 1101 1011
        101 1110 1101 10110   (left shift)
        00101 1110 1101 101   (right shift)
        ```
        -  6 << 1  == 6 * 2
           * 6: 0110
           * 12: 1100
        - 6 >> 1  == 6 / 2
           * 6: 0110
           * 3: 0011    
        - -6 << 1 ==  -6 * 2 == -12
           * 6:  0000 0110
           * -6: 1111 1010
           * -12: 1111 0100  # shift left logical
           * 12: 0000 1100
        - -6 >> 1 == -6 / 2 == -3? 
           * 6:  0000 0110
           * -6: 1111 1010
           * -3: 11111 101    # shift right arithmetic
           * 3 : 0000 0011

        - But what if the number is unsigned
          * Note same bit pattern as -6 for the input
          * "1111 1010" >>> 1 ==  "0 1111101"
          * shift right logical
 

        - rol $s1, $t1, 2
          xxxx xxxx xxxx xxxx xxxx xxxx xxxx xxxx
          1100 1010 1010 1100 1100 1011 0111 0000
          0010 1010 1011 0011 0010 1101 1100 0000  # t1: shift left 2
          0000 0000 0000 0000 0000 0000 0000 0011  # at: shift right 30
          0010 1010 1011 0011 0010 1101 1100 0011  # t1 | at

   1. Base64 example


## Questions
   1. Thursday-Morning:


## Review from Last-time

---
# Today's Material


---
## Resources
## Notes