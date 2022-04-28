# COMP122 Lecture Notes: April 27 & 28, 2022

## Announcements
   1. Note that the notes from all classes integrated into the notes from last time.

   1. Current assignment Overview
      - Version 1:  
        * about 22 lines of code + documentation
      - Version 2: 
        * push char instead of print char  (replace 1 macro for 2 lines of code)
        * add additional output loop, 
          - pop, print char  (\~5 lines of code + 1 macro)
      - Version 3:
          - modify "push code" to "write to memory" (updated 2-3 lines of code)
          - make a new type of syscall, to allocate memory (add 4 lines of code) [see below]
          - move print loop out of your subroutine, and replace with syscall to print_string  (replace 1\~lines of code, add 1 macro)
      - Version 4:
          - change the register that you loaded the value '10' into to $a4  (change 2 or 3 lines of code)
          - update the int -> ascii code to what is provided to bases > 10  (~ 3-4 lines of code)
      - Version 5:
          - create a new subroutine:  (2 lines of code)
          - check sign of input variable, 
              - add '-' to the output:  (2 lines of code)
              - calculate the 2's complement of the input: value = \~value +1  (2 lines of code)
          - make a subroutine call to your existing subroutine (\~4 lines of code)

    1. Current write up of the assignment:
       - https://github.com/COMP122/conversions.mips

    1. Slides:
       - Conversion between bases
       - https://docs.google.com/presentation/d/1O0BFONCrfP1LvQnn97jCBN5_hEbKNbRIpRI9vtKI_io/edit#slide=id.g10efea0b76a_0_127



## Today's Agenda
   1. Survey of Assignment Status
   1. Provide more time at the beginning of the class to work on the assignment.
   1. 

## Questions:
   1. none


## Notes:

* Allocate a buffer of size 16, and place the address into $s0

```
# via a data declaration:

            .data
buff:       .space 16

            .text
            la $s0, buffer
```

```
# via a system call (memory is allocated from the heap segment)

            .text

            li $a0, 16
            li $v0, 9
            syscall
            move $s0, $v0

```
