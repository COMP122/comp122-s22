# COMP122 Lecture Notes: Feburary 21 & 22, 2022

## Announcements
   1. COMP 122/L Virtual Group Discussion Sessions with Sarah

## Today's Agenda
   1. UTF-8 encoding/decoding review
   1. Introduction to Numbering Systems

## Questions
   1. ASCII decoding-- big versus little endian
   1. Quick review of octal/hex -> binary encoding
   1. 


## Review from Last-time

---
# Today's Material

1. UTF-8 Review:

"Hello World!"

C, C++: array of chars
	char == 8 bits

Java:  array of chars
    char == 16 bits

1. Convert Unicode two UTF-8

U+274E: 
   - xxxx xxxx xxxx xxxx
   - 0010 0111 0100 1110
       ^
Locate the MSB: 14th position
   - 10 0111 0100 1110

Pad/Truncate:
   - 0010 0111 0100 1110

Chuck:
   - 0010
   - 0111 01
   - 00 1110

Pack the bits
   - | 1110 xxxx   | 10 xxxxxx | 10 xxxxxx |
   - | 1110 0010   | 1001 1101 | 1000 1110 |

Encode in Hex:
   - 16# e2  9d 8e

1. Decode UTF-8 : 01010111 11110101 10110101 10110100 10110101

  * Gather the bytes
     - 01010111
     - 11110101 10110101 10110100 10110101
     - 00000101
  * Validate continuation bits: check
     - 01010111 
       - 0 xxxxxxx 
     - 11110101 10110101 10110100 10110101
       - 11110 xxx   | 10 xxxxxx | 10 xxxxxx | 10 xxxxxx
     - 00000101
       - 0 xxxxxxx 

  * Remove framing bits
    - 1010111 
       - 0 xxxxxxx 
     - 101 110101 110100 110101
       - 11110 xxx   | 10 xxxxxx | 10 xxxxxx | 10 xxxxxx
     - 0000101
       - 0 xxxxxxx 
   * Convert to Hex
     - 0101 0111 -> 16# 57
     - 1011 0101 1101 0011 0101 -> 16# B5D35
     - 0000 0101 -> 16# 05

MSB: Most Significant Bit.
     0 decades 1 year 2 months and 3 days  
     $00000304.65


Number Calculation:

  - Base10
    - 3005
  - Base2
    - 1001001

BCD:
  - what is:  1010









---
## Resources
## Notes