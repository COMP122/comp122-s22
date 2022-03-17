# COMP122 Lecture Notes: March 16 & 17, 2022

## Announcements
   1. Last day before break
   1. We meet on on March 29th
   1. We don't meet on March 31
   1. Planned quiz weened of April 1

## Today's Agenda
   1. More Combinational Circuits
      - Adders, Subtracts, Decoders, and Mux

## Questions
   1. No questions


## Review from Last-time

---
# Today's Material
  1. Add 0 + 13 + 17 = 30
  1. Home many numbers did you just together?  3


```
     10
   xx13
+  xx17
-------
 x xx30
```
  1. Java Code & MIPS
     -  a0 = s0 & s1;   and $a0, $s0, $s1
     -  a0 = s0 | s1;   or $a0, $s0, $s1
     -  a0 = s0 ^ s1;   nor $a0, $s0, $s1
     -  a0 = ~ s0 ;     nor $a0, $s0, $zero     
  1. Post and pre-inc:  ++x, x++  //   y = x++ + 3
     = X = A + b + 1 
     = X = A + b;
       X = X + 1;

  1. Juxtaposition 
     -  5 * x  ==>  5x
     - Boolean Algebra
        - A  &   B ==>   A * B   ==> AB

```
   0011 1010
+  0100 1101
-------------
```
Add- Righmost 4 digits
Add - Leftmost 4 digits with the Cout of the last addition

    1. Truth Table --> Karnaugh

 S:3210 Invalid
  ----  ---
  0000  0
  0001  0
  0010  0
  0011  0
  0100  0
  0101  0
  0110  0
  0111  0
  1000  0 
  1001  0
  1010  1
  1011  1
  1100  1
  1101  1
  1110  1
  1111  1

= s3 * s2 + s3 * s1
= s3 * (s2 + s1)


3457.9876
---
## Resources
## Notes