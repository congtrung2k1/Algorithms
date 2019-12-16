#include <stdio.h>
#include <stdlib.h>
#include <string.h>


int digits[10000];

int main()
{

    memset(digits,0,sizeof(digits));

    digits[0] = 1;

    int num = 1;
    int i;
    for (i = 1; i <= 1000; i++)
    {
        int carry=0;
        int j;
        for (j=0;j<num;j++)
        {
            digits[j] =(digits[j] << 1) +carry;
            carry = digits[j] / 10;
            digits[j] %= 10;
        }

        while (carry)
        {
            digits[num++] = carry%10;
            carry/=10;
        }

    }

    int sum = 0;
    for (i = 0; i < num;i++)
    {
        sum+=digits[i];
    }

    printf("%d\n",sum);
}

