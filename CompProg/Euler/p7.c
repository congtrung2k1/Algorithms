#include <stdio.h>

#include <stdlib.h>
#include <string.h>
#define MAX 2000000

int isprime[MAX];


int main()
{
    int i;

    int found = 0;

    int j;

    memset(isprime, 1, sizeof(isprime));

    for (i = 2; ; i++)
    {

        if (!isprime[i]) continue;

        found ++;

        if (found == 10001){ printf("%d\n",i); return 0;}

        for (j = 2*i; j < MAX ;j+= i)
        {
            isprime[j] = 0;
        }
    }


  return 0;
}


