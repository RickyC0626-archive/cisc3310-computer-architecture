/**
 * ***** BIT COUNTER 2 *****
 * 
 * 32-bit word (integer), count the number of bits that are zero
 * 
 * Output:
 * There are 24 bits that are zero in the word 3310
 */

#include <stdio.h>

int count_bits();

int main()
{
    int input = 3310;   // 32-bit word used for counting

    printf("There are %d bits that are zero in the word '%d'\n", count_bits(input, 1), input);
    // There are 24 bits that are zero in the word '3310'
    // 3310 in binary is 00000000 00000000 00001100 11101110
    return 0;
}

int count_bits(int input, int position)
{
    int counter = 0;

    for(int i = 0; i < 32; i++)
    {
        // Bitwise operator AND copies the bits that occur in both operands
        int bit = input & position;
        if(bit == 0) counter ++;
        // Bitwise operator << shifts left operand to the left by
        // the amount specified by right operand
        position = position << 1;
    }
    return counter;
}