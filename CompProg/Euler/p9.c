#include <stdio.h>
#include <stdlib.h>

int main()
{
    int a , b, c;

    for ( a = 1; a < 1000; a ++)
    {
        for ( b = 1; b < 1000-a;b++)
        {
            int c = 1000-a-b;
            if (c*c == a*a+b*b)
            {
                printf("%d\n",a*b*c);
                return 0;
            }
        }
    }
}

