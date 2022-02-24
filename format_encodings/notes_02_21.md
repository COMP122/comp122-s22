# COMP122 Lecture Notes: February 21 & 22, 2022

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

"Hello \u2727 World!\n\0"

C, C++:
	String:  array of ASCII

	char: 1 byte or 8-bits

Java:
	String:  array of Unicode  // object

	char: 2 byte or 16-bits


U+7979:
   * Binary: 0111 1001 0111 1001
   1. MSB:    ^ 15th digit
   2. Consult: 
   | Condition | l = length | b = bytes |
   |-----------|-----------:|----------:|
   | p <= 16   |       16   |      3    |	

   3. Pad/Truncate:
   	  - 0111 1001 0111 1001

   4. Chunk: 0111 100101 111001
      - 4: 0111
      - 6: 100101
      - 6: 111001
   5. Pack:
      - | 1110 xxxx   | 10 xxxxxx | 10 xxxxxx |
      - | 1110 0111   | 10 100101 | 10 111001 |
   * Decode: 1110 0111 1010 0101 1011 1001
      - 0x E7A5B9

UTF-8:
   - 11010101 10111010 01010111 11101101 10110001 10110001
   1. chunk: done see above
   2/3. 11010101 10111010 |  01010111  | 11101101 10110001 10110001
   4. Validate
      - '110'10101 '10'111010  -- check
      - '0'1010111
      - '1110'1101 '10'110001 '10'110001 -- check, check
   5. unpack
      - | 110 xxxxx   | 10 xxxxxx |
        - 10101 111010
      - | 0 xxxxxxx   | 
        - 1010111
      - | 1110 xxxx   | 10 xxxxxx | 10 xxxxxx |
        - 1101 110001 110001
   *  convert to hex
      - 0101 0111 1010      : 0x057A  'ARMENIAN SMALL LETTER PEH'
      - 0101 0111           : 0x0057  'W'
      - 1101 1100 0111 0001 : 0xDC71  invalid


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

   - Base10
    - 4005
  - Base2
    - 100110


BCD:
  - what is:  1010
  - 10 -- 0001 0000


What's this number:

   - 2# 101   -> 5
   - 2# 101.1 -> 5 1/2 == 5.5
   - 2# 101.01 -> 5 1/4 == 5.25
   - 2# 101.11 ->  5.75






---
## Resources
## Notes