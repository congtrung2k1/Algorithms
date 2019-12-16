#include <stdio.h>
#include <stdlib.h>



int main()
{
    int n2 = 0;
    int n5 = 0;
    int i;
    int k;

    for (k = 1; k <= 100;k++)
    {
       i=k;
        while(i%2==0){n2++; i/=2;}
        while(i%5==0){n5++;i/=5;}
    }

    printf("%d %d\n",n2,n5);
}
