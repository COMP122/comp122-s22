# COMP122 Lecture Notes: April 5, 2022

## Announcements
   1. Planned quiz moved to this weekend.
   1. New homework assignment released

## Today's Agenda
   1. Complete Digital Logic Section
   1. Possible Review based upon questions
   1. MIPS ISA

## Questions
   1. 


---
# Today's Material 
   1. See slides
   1. quiz preparation:
     * https://docs.google.com/document/d/1ppEKShKtDvF__LHrRVeSDmNCjKGKxxc3UFuHawK2qcU/edit


---
## Resources
## Notes

* Quadractic Formula:  

```
         -b +- sqrt(b^2-4ac)
    X = -------------------
                 2a
```

Variables Used:  b, a, c, 
Subexpressing: b^2, 4a, 4ac, 2a, -b


Instructions on Mips:
  - b:  unconditional branch
  - j:  unconditional jump


Instructions Catagories:
  - native or bare instructions
  - psuedo instruction:
      - the assembler replace the insturction with one or more native instructions
  - macros


Addresses:    checksum =  dummy + 3;
   value of checksum:   (lval = 0x12, rvalue = 61)
   value of dummy:      (lval = 0x14, rvalue = ?)

la $s0, checksum:
   assembler -->   li $s0, 0x12
li $s0, checksum:
   assemble -->   li $s0, 61

Memory Instructions:
   - First regular instructions:  add $s1, $s2, $s3    #  $s2  <--- the distination
   - load: put something into a register:  flows <---
       - "l"<stuff>
   - store: put someting into memory (from a register):  flows -->
       - "s"<stuff>
   - sizes:
      - bytes: "b"
      - halfs: "h"
      - words: "w"
   - signed and unsinged
      - "u" -- for unsigned

   - signed extention:
      - read the value, lb $s1, X:   1001 1001
      - $s1:  1111 1111 | 1111 1111 | 1111 1111 | "1"001 1001
      - read the value, lb $s1, X:   0001 1001
      - $s1:  0000 0000 | 0000 0000 | 0000 0000 | "0"001 1001
      - read the value, lbu $s1, X:   1001 1001
      - $s1:  0000 0000 | 0000 0000 | 0000 0000 | "1"001 1001

Array Indexing:
   - Array <-> function <-> mapping
   - X[5]  // C 
   - X(5)  // ADA: looks like a function
   - X + 5 <=> X[5]
   - 5 + X <=> 5[X]  // valid C
   - 5[x] <=>  5(X)  // MIPS