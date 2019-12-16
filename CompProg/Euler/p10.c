#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAX 2000002


char isprime[MAX] ;


int main()
{
    memset(isprime, 1, sizeof(isprime));


    int i ;
    int j;
    int found = 0;
    long long sum = 0;

    for (i = 2; i < MAX-2; i++)
    {
        if (! isprime[i]) continue;

        found ++;
        sum += i;
        

        for (j = 2*i; j < MAX; j+=i)
        {
            isprime[j] = 0;
        }
    }

    printf("%lld\n", sum);
    return 0;
}



