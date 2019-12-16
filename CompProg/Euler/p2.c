#include <stdio.h>


void main()
{
    int a = 1;
    int b = 1;
     int sum=0;

    while (1)
    {
        int c = a+b;
        if (c >= 4000000)break;
        if (c %2==0) sum += c;
        a=b;
        b=c;
    }

    printf("%d\n",sum);
}

