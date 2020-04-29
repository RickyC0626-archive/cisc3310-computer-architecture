/**
 * ***** MULTI ADD *****
 * 
 * Using a loop, multiply two positive numbers by using repeated addition
 * 
 * Output:
 * 4 times 5 is: 20
 */ 

#include <stdio.h>

int main()
{
    int operand1 = 4,
        operand2 = 5,
        sum = 0;

    for(int i = 0; i < operand2; i++)
    {
        sum += operand1;
    }
    printf("%d times %d is: %d\n", operand1, operand2, sum);
    return 0;
}