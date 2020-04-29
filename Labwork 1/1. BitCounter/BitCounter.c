/**
 * ***** BIT COUNTER *****
 * 
 * 32-bit word (integer), count the number of bits that are zero
 * 
 * Output:
 * There are 24 bits that are zero in the word 3310
 */

#include <stdio.h>

int main()
{
    int input = 3310,   // 32-bit word used for counting
        counter = 0,    // Counter for number of bits that are zero
        bit,            // Compare the bits that match
        position = 1;   // Start from 2^0

    for(int i = 0; i < 32; i++)
    {
        // Bitwise operator AND copies the bits that occur in both operands
        bit = input & position;
        if(bit == 0) counter ++;
        // Bitwise operator << shifts left operand to the left by
        // the amount specified by right operand
        position = position << 1;
    }
    printf("There are %d bits that are zero in the word '%d'\n", counter, input);
    // There are 24 bits that are zero in the word '3310'
    // 3310 in binary is 00000000 00000000 00001100 11101110
    return 0;
}

