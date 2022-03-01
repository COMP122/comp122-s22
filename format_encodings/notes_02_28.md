# COMP122 Lecture Notes: Feburary 28 & March 1, 2022

## Announcements
   1. Test on March 9th & 10th
   1. Review on March 7th & 8th

## Today's Agenda
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

      ``



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
