#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int check(int n)
{
    char c[90];


    sprintf(c,"%d",n);

    int i;

    for (i = 0; i < 3; i++)
    {
        if (c[i] != c[5-i] )
        {
            return 0;
        }
    }

    return 1;
}

int main()
{
    int a = 0;
    int b = 0;
int m = 0;

    for ( a = 999; a >= 100;a--)
    {
        for ( b = 999;b>=100;b--)
        {
            if (a*b>m&&check (a*b))
            {m=a*b;continue;
                printf("%d\n", a*b);
                return 0;
            }
        }
    }

printf("%d\n",m);
}
