# Decoding UTF-8

## Algorithm: 

*  Prerequisite: Encode your value into a binary string
1. Chunk the string into bytes
2. Based upon the first byte's prefix, determine the total number of bytes ('b') used to encode the current UTF-8 character.

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
   The framing bits includes the prefix identified in Step #2 and #5.

* Postrequisite: Decode the binary value into a hexadecimal value.


## Example 1:  Decode: U+2727
### 'WHITE FOUR POINTED STAR'
### https://www.fileformat.info/info/unicode/char/2727/index.htm

* Prerequisite: Encode your value into a binary string
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




## Example 1:  Invalid Binary String

* Prerequisite: Encode your value into a binary string
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
