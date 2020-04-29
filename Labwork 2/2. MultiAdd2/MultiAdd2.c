/**
 * ***** MULTI ADD *****
 * 
 * Using a loop, multiply two positive numbers by using repeated addition
 * 
 * Output:
 * 4 times 5 is: 20
 */ 

#include <stdio.h>

int multiply();

int main()
{
    int operand1 = 4,
        operand2 = 5;

    printf("%d times %d is: %d\n", operand1, operand2, multiply(operand1, operand2));
    return 0;
}

int multiply(int operand1, int operand2)
{
    int sum = 0;

    for(int i = 0; i < operand2; i++)
    {
        sum += operand1;
    }
    return sum;
}