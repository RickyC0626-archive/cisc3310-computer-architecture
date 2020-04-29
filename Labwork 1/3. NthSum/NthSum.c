/**
 * ***** NTH SUM *****
 * 
 * Sum the numbers 1+2+3+4...+N, where the user inputs N, and print the result
 * 
 * Output:
 * The summation of 5 is 15
 */

#include <stdio.h>

int main()
{
    int n,
        sum = 0;

    do
    {
        puts("Enter a positive number:");
        scanf("%d", &n);
    } while(n <= 0);

    for(int i = 1; i <= n; i++)
    {
        sum += i;
    }
    printf("The summation of %d is %d\n", n, sum);
    return 0;
}