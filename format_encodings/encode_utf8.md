# UTF-8 Encoding of Unicode

## Algorithm: Unicode to UTF-8 Encoding

*  Prerequisite: Convert the Unicode character, e.g., U+00FE, into a binary string: 2# 1111 1110.
1. Determine the position of the most significant bit; let `p` be that value.
2. Consult to following table to determine the value of `l` (length) and `b` (bytes)

   | Condition | l = length | b = bytes |
   |-----------|-----------:|----------:|
   | p <= 7    |        7   |      1    |
   | p <= 11   |       11   |      2    |
   | p <= 16   |       16   |      3    |
   | p <= 21   |       21   |      4    |
   

3. Pad/Truncate the binary string to be of length `l`
4. Based upon the value of `b`, chunk the binary string into the following sizes:
   - 1: 7
   - 2: 5, 6
   - 3: 4, 6, 6
   - 4: 3, 6, 6, 6

5. Based upon the value of `b`, pack your chunks into the following bytes:

   | b          | First Byte  | Next Byte | Next Byte | Next Byte |
   |------------|------------:|----------:|----------:|-----------|
   | 1          | 0 xxxxxxx   |           |           |           |
   | 2          | 110 xxxxx   | 10 xxxxxx |           |           |
   | 3          | 1110 xxxx   | 10 xxxxxx | 10 xxxxxx |           |
   | 4          | 11110 xxx   | 10 xxxxxx | 10 xxxxxx | 10 xxxxxx |


* Postrequisite: Decode the binary value into a hexadecimal value.


## Example 1: Encode: U+00FE
### 'LATIN SMALL LETTER THORN'
### https://www.fileformat.info/info/unicode/char/00FE/index.htm

* Prerequisite: Convert the Unicode character into a binary string.
  - 16# 00FE:  Hexadecimal value of U+00FE
  - 2#  0000 0000 1111 1110  

1. Determine the position of the most significant bit; let `p` be that value.
   - 8

2. Consult to following table to determine the value of `l` (length) and `b` (bytes)

   | Condition | l = length | b = bytes |
   |-----------|-----------:|----------:|
   | p <= 11   |       11   |      2    |

3. Pad/Truncate the binary string to be of length `l`
   - 2# 000 1111 1110 

4. Based upon the value of `b`, chunk the binary string into the following sizes:
   - 2: 5, 6
   - 2# 000 1111 1110 
   - 2# 00011 111110

5. Based upon the value of `b`, pack your chunks into the following bytes:

   |  b bytes   | First Byte  | Next Byte |
   |------------|------------:|----------:|
   | 2          | 110 xxxxx   | 10 xxxxxx |
   | -->        | 110 00011   | 10 111110 |


* Postrequisite: Decode the binary value into a hexadecimal value.
  - 2# 11000011 10111110
  - 2# 1100 0011 1011 1110
  - 16# c3be
  - validate: https://www.fileformat.info/info/unicode/char/00FE/index.htm


## Example 2: Encode: U+2663
### 'BLACK CLUB SUIT'
### https://www.fileformat.info/info/unicode/char/2663/index.htm

* Prerequisite: Convert the Unicode character into a binary string.
  - 16# 2663:  Hexadecimal value of U+2663
  - 2#  0010 0110 0110 0011

1. Determine the position of the most significant bit; let `p` be that value.
   - 14

2. Consult to following table to determine the value of `l` (length) and `b` (bytes)

   | Condition | l = length | b = bytes |
   |-----------|-----------:|----------:|
   | p <= 16   |       16   |      3    |


3. Pad/Truncate the binary string to be of length `l`
   - 2# 0010 0110 0110 0011

4. Based upon the value of `b`, chunk the binary string into the following sizes:
   - 3: 4, 6, 6
   - 2# 0010 0110 0110 0110
   - 2# 0010 011001 100011


5. Based upon the value of `b`, pack your chunks into the following bytes:

   |  b bytes   | First Byte  | Next Byte | Next Byte |
   |------------|------------:|----------:|----------:|
   | 3          | 1110 xxxx   | 10 xxxxxx | 10 xxxxxx |
   | -->        | 1110 0010   | 10 011001 | 10 100011 |


* Postrequisite: Decode the binary value into a hexadecimal value.
  - 2# 111000101001100110100110
  - 2# 1110 0010 1001 1001 1010 0011
  - 16# e299a3
  - validate: https://www.fileformat.info/info/unicode/char/2663/index.htm







