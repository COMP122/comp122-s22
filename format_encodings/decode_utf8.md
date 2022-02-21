# UTF-8 Decoding of Unicode

## Algorithm: UTF-8 Encoding to Unicode

*  Prerequisite: Convert your UTF-8 string into a binary string.
1. Chunk the string into bytes
2. Based upon the first-byte's prefix, determine the total number of bytes ('b') used to encode the current UTF-8 character.

   | First Byte  | b   |
   |------------:|-----|
   | 0 xxxxxxx   | 1   |
   | 110 xxxxx   | 2   |
   | 1110 xxxx   | 3   |
   | 11110 xxx   | 4   |


3. Gather the number of bytes, 'b'.
4. Validate that the following bytes are prefixed with '10'. <br>
   If they are not, the binary string is invalid.

5. Unpack the payload by removing the framing bits<br>
   The framing bits includes the prefix identified in Step #2 and #4.

* Postrequisite: Decode the binary value into a hexadecimal value.<br>
  The resulting value represents the UTF-8 index, e.g., U+00FE.


## Example 1: Decode: U+2727
### 'WHITE FOUR POINTED STAR'
### https://www.fileformat.info/info/unicode/char/2727/index.htm

* Prerequisite: Convert your UTF-8 string into a binary string.
  - 16# e29ca7
  - 2#  1110 0010 1001 1100 1010 0111

1. Chunk the string into bytes
   - 2# 11100010 10011100 10100111


2. Based upon the first byte's prefix, determine the total number of bytes ('b') used to encode the current UTF-8 character.

   | First Byte  | b   |
   |------------:|-----|
   | 0 xxxxxxx   | 1   |
   | 110 xxxxx   | 2   |
   | 1110 xxxx   | 3   |
   | 11110 xxx   | 4   |

   - 2# 1110 - 0010 10011100 10100111
   - 3 bytes

3. Gather the number of bytes, 'b'.

4. Validate that the following bytes are prefixed with '10'. <br>
   If they are not, the binary string is invalid.
   - 2# 1110 - 0010
   - 2# 10 - 011100
   - 2# 10 - 100111
  

5. Unpack the payload by removing the framing bits<br>
   The framing bits includes the prefix identified in Step #2 and #5.

   - 2# 0010 011100 100111
   
* Postrequisite: Decode the binary value into a hexadecimal value.
  - 2# 0010 0111 0010 0111
  - 16# 2727




## Example 2: Invalid Binary String

* Prerequisite: Convert your UTF-8 string into a binary string.
  - 16# e2dca7
  - 2#  1110 0010 1101 1100 1010 0111

1. Chunk the string into bytes
   - 2# 11100010 11011100 10100111

2. Based upon the first byte's prefix, determine the total number of bytes ('b') used to encode the current UTF-8 character.

   | First Byte  | b   |
   |------------:|-----|
   | 0 xxxxxxx   | 1   |
   | 110 xxxxx   | 2   |
   | 1110 xxxx   | 3   |
   | 11110 xxx   | 4   |

   - 2# 1110 - 0010 11011100 10100111
   - 3 bytes

3. Gather the number of bytes, 'b'.

4. Validate that the following bytes are prefixed with '10'. <br>
   If they are not, the binary string is invalid.
   - 2# 1110 - 0010
   - 2# 11 - 011100  ;  invalid!
   - 2# 10 - 100111
  
* Example ended with identify the binary string as being malformed!


----
## Example 3: Long Binary String

* Prerequisite: Given a binary string that contains a string of UTF-8 characters.
  - 2# 111000101001110010100111011010101101010110111101

1. Chunk the string into bytes
   - 2# 11100010 10011100 10100111 01101010 11010101 10111101

2. Based upon the first byte's prefix, determine the total number of bytes ('b') used to encode the current UTF-8 character.

   1. First Character:
      - Current String: 2# 11100010 10011100 10100111 01101010 11010101 10111101
      - First Byte: 2# 1110 - 0010
      - 3 bytes

   2. Second Character: 
      - Current String: 2# 01101010 11010101 10111101
      - First Byte: 2# 0 -- 1101010
      - 1 byte

   3. Third Character:
      - Current String: 2# 11010101 10111101
      - First Byte: 2# 1101 -- 0101 
      - 2 byte

3. Gather the number of bytes, 'b'.
   1. 2# 1110 -- 0010 10011100 10100111
   2. 2# 0 -- 1101010
   3. 2# 110 -- 10101 10111101

4. Validate that the following bytes are prefixed with '10'.
   1. 2# 1110 -- 0010 10011100 10100111
      - 2# 10 -- 011100
      - 2# 10 -- 100111
   2. 2# 0 -- 1101010

   3. 2# 110 -- 10101 10111101
      - 2# 10 - 111101

5. Unpack the payload by removing the framing bits<br>
   1. 2# 0010 011100 100111
   2. 2# 1101010
   3. 2# 10101 111101

* Postrequisite: Decode the binary value into a hexadecimal value.
   1. 2# 0010 0111 0010 0111 -> 16# 2727 == U+2727
   2. 2# 0110 1010           -> 16# 6A   == U+006A
   3. 2# 0101 0111 1101      -> 16# 57D  == U+057D


