# COMP122 Lecture Notes: April 18 & 19, 2022

## Announcements
   1. 

## Today's Agenda
   1. Finish up the conversion of checksum
      - see onthefly_{morning, afternoon}.s
   1. Slides on Instructions, Arrays, Stack, and Frames
   1. Coding Example

## Questions
   1. git tag       

## Checksum.c --> MIPS conversion

### Where we left off:

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

1. Register allocation:
\# t2: checksum
\# t3: complement

1. High Level Pseudo Instructions

print_string(out_str0)
print_int($t2)
print_string(out_str1)
print_int($t3)
print_string(out_str)

1. Issue:
MARS only provide syscalls to print various data types to stdout.
Hence, a MARS programmer must convert its various data types to and from strings

The "C" language has/had the same problem.

1. Solution:
Provide a set of library files to perform such operations.
They become so widely adopted/accept -- not they are part of the _de facto_ standard.

    #include <stdio.h>              // file operations
    #include <stdlib.h>
    #include <string.h>

  * Examples:
    1. print: output format conversion (printf, fprintf, sprintf)
      - snprintf(buffer, sizeof(buffer), format_string, ... );
      - snprintf(&A, 20, "%s %d, %d = %s\n", month, day, year, weekday );
      - returns the length of A
      - strings:
        - %s: strings (%s)
        - %c: unsigned char (%c)
      - integers:
        - %d/%i: signed decimal (%d and %i), 
        - %o: unsigned octal (%o), 
        - %u: unsigned decimal (%u), or 
        - %x: unsigned hexadecimal (%x and %X) notation.
      - floats
        - %f: decimal notation: [-]ddd.ddd,
        - %e: exponent notation: [-]d.ddde±dd 
        - %a: power notation:  [-]0xh.hhhp[±]d

    1. int scanf: input format conversion  (scanf, fscanf, sscanf)
       - sscanf( input_string, format_string, ... )
       - sscanf( "Saturday March 25 1989", "%s %s %d %d", weekday, month, &day, &year );
       - returns the number of items assigned

    1. long strtol(string, endpoint, base): string to long
    1. float strtof(string, endpoint, base): string to float 
    1. int atoi(string): ascii to integer
    1. double atof(string): ascii to float

1. Write the following subroutines

   1. strlen: determines the length of the string
   1. u2a: converts a 32-bit unsigned integer to ascii

