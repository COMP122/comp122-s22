## Conversion: Binary Real to Floating Point

# Algorithm
The following steps can be used to convert a binary real to IEEE floating point format.  An example is provided:

1. Enter the real binary number: ``- 101011.010101``
   - Notice this number has four components:
     1. a sign: ``-``
     2. a whole part: ``101011``
     3. the radix point: ``.``
     3. a fractional part: ``010101``
3. Represent the number in Scientific notation with the exponent in binary: ``- 1.01011010101 x 2^101`` (5)
   - Note the decimal representation of the exponent is denoted in parenthesis.
4. Identify the following components within the scientific notation:
   1. the sign: ``-``
   2. the whole part: ``1``
   3. the radix: ``.``
   4. the mantissa part: ``01011010101``
   5. the scientific-base: ``x 2^``
   6. the exponent: ``101`` (5)

5. Use the following table, to determine
   - the number of bits used for each encoded component, and 
   - the bias used for the exponent.

| Encoding  | Total | Sign | Exponent | Mantissa |  Bias |
| --------- | ----: | :--: | -------: | -------: | ----: |
| Comp122   |     8 |  1   |  3       |        4 |  ``011`` (3) |
| Binary16  |    16 |  1   |  5       |       10 |  ``01111`` (15) |
| Binary32  |    32 |  1   |  8       |       23 |  ``01111111`` (127) |
| Binary64  |    64 |  1   |  11      |       52 |  ``01111111111`` (1024) |
| Binary128 |   128 |  1   |  15      |      112 | ``011111111111111`` (16383) |


6. Encode the following three components and concatenate them together:
   1. Sign: 
      - Set to ``1`` if "-", reset to ``0`` otherwise
   2. Exponent: 
      - Add the bias to the exponent.
      - Pad the exponent to obtain the desired number of bits.
      - Always pad on the left side of the exponent.
      - If you have to trim the exponent or if it is negative, you can't use the specific encoding format.
   3. Mantissa: 
      - Pad or trim the mantissa to obtain the desired number of bits.
      - Always pad or trim on the right side of the mantissa.

----
# Examples

1. Comp122 (quarter):
   - Sign: ``1``
   - Expon: ``101`` (5) -->  ``1000`` ( 8 = 5 + 3)
   - Mantissa: ``01011010101`` --> ``0101`` 
   - Note: the number is to large for this encoding scheme

| S  | E (3)  | M (4) | 
| -- | ------ | ----- | 
| 1  |  err   |  0101 | 

1. Binary16 (half):
   - Sign: ``1``
   - Expon: ``101`` (5) -->  ``10100`` (20 = 5 + 15)
   - Mantissa: ``01011010101`` --> ``0101101010`` 
   - Note: precision is lost via this encoding scheme

| S  | E (5)  | M (10) | 
| -- | ------ | ----- | 
| 1  |  10010 |  0101 1010 10 | 


2. Binary32 (single):   
   - Sign: ``1``
   - Expon: ``101`` (5) -->  ``1000 0100`` (132 = 5 + 127)
   - Mantissa: ``01011010101`` --> ``010110101010000..0`` 

| S  | E (8)  | M (23) | 
| -- | ------ | ----- | 
| 1  |  1000 0100 |  0101 1010 1010 0000 0000 000 | 

3. Binary64 (double):
   - Sign: ``1``
   - Expon: ``101`` (5) -->  ``100 0000 0101`` (1029 = 5 + 1024)
   - Mantissa: ``01011010101`` --> ``0101 1010 1010 0000 00000000 00000000 00000000 000000 0000`` 

| S  | E (11)  | M (52) | 
| -- | ------ | ----- | 
| 1  |  100 0000 0101 |  0101 1010 1010 0000 00000000 00000000 00000000 000000 0000 | 


4. Binary128 (quad)
   - Sign: ``1``
   - Expon: ``101`` (5) -->  ``100 0000 0000 0100`` (16388 = 5 + 16383)
   - Mantissa: ``01011010101`` -->
     - <sup><sub>``0101 1010 1010 0000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 0`` </sup></sub>

| S  | E (15)  | M (122) | 
| -- | ------ | ----- | 
| <sup><sub> 1 </sub></sup> |  <sup><sub>100 0000 0000 0100</sub></sup> | <sup><sub> 0101 1010 1010 0000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 0</sub></sup> |
