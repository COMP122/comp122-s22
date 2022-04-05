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

# Afternoon class

- Instruction types:
  1. Native or Bare Instructions
  1. Psuedo Instructions
     - li  $s1, 4.3  # load immediate
     - la  $s1, X    # load address
  1. Macros
     ```
     li $v0, 10
     syscall
     ```
     ```
     .macro print_int(%r)
       li $v0, 1
       mv $a1, %r
       syscall
     .end_macro
     ```


- Values of a variable
  - x = a + b;
   - lval
   - rval
  - value of a: (0x01, 4.3)
  - value of b: (0x0C, 2.2 )
  - value of x: (0x17, 15.1)  -> 6.5


- memory addressing
  - sb $s0,  X  -->
  - sb $s0,  0($s2)

- Array <=> Function <=> Mapping
  - mapping: from a set of inputs, I get a set of outputs
  - function: func(A, B), f(A), A(x)
  - array:  A[x]    //  &A + x
  - array:  A(x)    // Ada
  - array:  &A + x  // C
  - array:  x + &A  // C
  - array:  x[A]    // legal C
  - array:  x($s1)  // MIPS

- Loads and Stores
  - load:  "l"<stuff>  : put something into a register
  - store: "s"<stuff>  : put something into memory (from a register)
  - data types:
     * "b"yte : transfer 1 byte
     * "h"alf : transfer 2 bytes
     * "w"ord : transfer 4 bytes

  - unsigned / signed values
    * lb $t0, -4($s0)   # 1001 1001
    * t0:  1111 1111 | 1111 1111 | 1111 1111 | "1"001 1001 
    * lbu $t0, -4($s0)   # 1001 1001
    * t0:  0000 0000 | 0000 0000 | 0000 0000 | "1"001 1001 




* Stack based machine
  - x = a + b
  ```
   push a
   push b
   add       # pop, pop, add the two, and push result
   pop x

  ```

* Communication with the OS on MIPS
  - $v0  <-- a number associated with the service request
  - $a0
  - $a1
  - $a2
  - $a3










---
# Morning class
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

Stack Based Machine
   - x = a + b
   ```
       push a
       push b
       add    # pops two values, add them, and pushes the result
       pop x

   ```

- Talking to the OS
  - use register for sending a message to the OS
     - $v0
     - $a0
     - $a1
     - $a2
     - $a3
  - use registers for receiving a message from the OS
     - $v0
     - $v1
     - $a0
     - $a1
     - $a2
     - $a3

- halt my program, i.e., perform the "exit" in the PSD
  ```
    li $v0, 10     # halt the program
    syscall
  ```

- equivalent macro

  .macro halt()
    li $v0, 10     # halt the program
    syscall
  .end_macro
