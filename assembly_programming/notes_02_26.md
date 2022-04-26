# COMP122 Lecture Notes: April 25 & 26, 2022

## Announcements
   1. Three weeks
   1. New assignment

## Today's Agenda
   1. Strings and conversions
   1. Quick review of decimal -> binary -> decimal
   1. Work on new project: conversions.s

## Questions:
   1. none


## Notes:


```c
fprintf(stdout, "Stored Checksum: %d, Computed Checksum: %d\n", checksum, complement);
  if (checksum != complement ) {
    fprintf(stderr, "Error Detected!\n"); 
    return 1;
  }
  return 0;
```

```mips
            .data
out_str0:   .ascii   "Stored Checksum: "
out_str1:   .ascii   ", Computed Checksum: "
out_str2:   .asciiz  "\n"
err_str:    .asciiz  "Error Detected!\n"
```

# printf family of subroutine

printf -- formated output,  all the conversions..  defaults to stdout
fprintf: the first arg is "FILE \*"  (file object)
dprintf: the first arg is "fd" -- file descriptor, e.g., 1: stdout, 2: stderr
sprintf: the first arg is string -- buffer: a location memory with a certain size


    0000 0000 0001 1011 :  27  -- string of length 2
    0000 0000 0000 0000 :   0  -- string of length 1
    1111 1111 1111 1111 : 65535 -- string of length 5


snprintf: the first arg is string, and the second is a size

# Problems:
1. allocate space for the string
   1. At the beginning of the program
      data:   .space 10
      next:   .word  4

   1. allocate the space on the stack: dangling reference
   1. heap via the "new" command: if you don't do "free" the space when done
      - you get a "memory leak"

1. go beyond the space:  Assume
   - allocate a space for 10 chars
   - copy 11 chars into that space
   - buffer overflow problem -- a major cause in security issue


snprintf(buffer, size, "The value of X is %x\n", X);
    buffer = "This value of X is " + X + "\n"

# Reading Strings
  - special character: %, \
  - percent:  conversions
    * %%
    * %d, %i : decimial, integer
    * %u : unsigned
    * %x, %o, %b : hex, octal, binary
       0000 0000 0001 1011  -->  "0000 0000 0001 1011"
    * %f float:  -3423.34
    * %e expon:  -3.42334e3
    * %a power:  -7FAC34p12:    1.0100111011001  ^2 1100 (12), syntax  [-+]xxxxxxp[+-]ddd
  - slash: backslash, escape
    * \n : put in a newline char
    * \0 : put in the null char
    * \v : vertical tab
    * \42 : ascii code for '\*'
    * \u00FE : unicode number for "Thorn"
  - string representation:
    * C, C++, Fortran, ... : ASCII
    * Java, ... : utf-16

# Subroutines called:  percent_

  1. Declaration:   int percent_base_10(int value)
  1. Purpose:       converts value to a ASCII string for a base 10 number
  1. Returns:       the number of digits in that string

```mips  
percent_base_10:
```

# Floating Point Conversion
  - binary32 (float)
    - (binary32) t0: s eeee eeee mmm mmmm mmmm mmmm mmmm mmmm 
    - (sign)     t1: slt t1, t0, zero  |  t0 >> 31
    - (expon_b)  t2: t0 << 1 >> 24
    - (mantisa)  t3: t0 << 9 >> 9      |  t0 & 008FFFFF

    - (expon)    t1: t1 - 0x7F
    - (signific) t3: t3 | 0x00800000

    *  sign   signific    expon  


# Review:  Base10 -> Base2

```
  t= 342

  342 / 2 = 171, 0
  171 / 2 = 85, 1
  85 / 2  = 42, 1
  42 / 2  = 21, 0
  21 / 2  = 10, 1
  10 / 2  = 5, 0
  5 / 2   = 2, 1
  2 / 2   = 1, 0
  1 / 2   = 0, 1
  
  answer =  0000 0001 0101 0110

```

# Review:  Base2 -> Base10

```
  t= 342 (0000 0001 0101 0110)

     342 / 10 = lo= 34, hi= 2,: convert 2 to "2", print "2"
         hi + '0'
     34  / 10 = 3, 4
     3   / 10 = 0, 3
     0   / 10 = 0, 0

     342

```

