# COMP122 Lecture Notes: Feburary 14, 15, 16, & 17 2022

## Announcements
   1. Monday: Welcome Back to Campus
   1. If you happen to be sick
   1. Grading:
      - Assigments 1-3 have been graded
        ```
        cd comp122/deliverables/NN_assignment
        git pull
        cat grade.report
        ```
      - Merge issues

## Today's Agenda
   1. Start of a new section: Formats and Encodings
   1. Introduction to Encodings:
     * Binary Strings
     * Functions/Mapping
     * Fixed Length Encodings
       - Octal, 
       - Hexadecimal, BCD
       - Base64
       - ASCII
       - MIPS Instructions
     * BCD Addition (foreshadow)
     * ASCII in Detail
     * Variable Length Encodings:  UTF-8

## Questions

## Review from Last-time


---
# Today's Material
  1. See slides


# Leftoff:
   * Slides 1-12

---
## Resources
## Notes

010110100110110110010101010111001111

- 2# 010 110 100 110 110 110 010 101 010 111 001 111
- 8#   2   6   4   6   6   6   2   5   2   7   1   7

- 2# 0101 1010 0110 1101 1001 0101 0101 1100 1111
- 16#   5    A    6    d    9    5    5    c    f

- 2# 010110 100110 110110 010101 010111 001111



1. Numbering Formats
  -  456 : base 10  : 10#456
  - 0456 : base 8   : 8#456
  - 0x456 : base 16 : 16#456


1. MIPS encoding exampl #1:

  - sw $t0, 0($s0)       #  s0[0] = t0
    - Pattern: sw rt, imm(rs)
      - rt == $t0 (01000)
      - imm == 0  (0000000000000000)
      - rs == $s0  (1 0000)
    - I 2b
      - op == 2b  (10 1011)

    | op      | rs      | rt      | imm                |
    |---------|---------|---------|--------------------|
    |10 1011  | 10000   |  01000  | 0000000000000000   |

  - 2#   1010 1110 0000 1000 0000 0000 0000 0000
  - 16#     A    E    0    8    0    0    0    0
  - via Mars: 0xae080000 (check)


1. MIPS encoding example #2:
   - srl  $a0, $ra, 6        #  a0 = ra >>> 6
     - Pattern srl rd, rt, sh
       - rd == $a0 (0 0100)
       - rt == $ra (1 1111)
       - sh == 6   (0 0110 )
     - R 0/2
       - op == 0   (00 0000)
       - func = 2  (00 0010)

    | Op      | rs     | rt      | rd       | sh     | func    |
    |---------|--------|---------|----------|--------|---------|
    | 00 0000 | 0 0000 | 1 1111  | 0 0100   | 0 0110 | 00 0010 |

   - 2#   0000 0000 0001 1111 0010 0001 1000 0010 
   - 16#     0    0    1    f    2    1    8    2
   - via Mars: 0x001f2182 (check)

1. MIPS Decode
   - via Mars: 0x001f2182
   - 2#   0000 0000 0001 1111 0010 0001 1000 0010 
   - package: 000000   00000111110010000110000010
     - op = 000000
   - re-package -- R type
     - 000000 00000 11111 00100 00110 000010
     - func == srl



1. Unary
- 1# 11101101111110
- 10# 326


1. UTF-8 Primer.

   | Condition | l = length | b = bytes |
   |-----------|-----------:|----------:|
   | p <= 7    |        7   |      1    |
   | p <= 11   |       11   |      2    |
   | p <= 16   |       16   |      3    |
   | p <= 21   |       21   |      4    |


-  16# FE
-  2# 1111 1110
-  p == 8
-  pad:  00011111110
-  chunk: 5, 6:  00011 111110
-  package the chunks:   110 00011  | 10 111110
-  flatten it: 1100 0011 1011 1110
-  decode to 16# c3be
