#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int divcount[2000000]={0};

char isprime[2000000] = {1};

int prime[2000000];
int nprime = 0;

int div1(long long t)
{
    long long i;
    int d = 1;

    if (divcount [t] ) return divcount[t];
    
        long long t2 = t;
    for (i = 0; i < nprime; i++)
    {
        int p = prime[i];
        if (p*p>t) break;

        int exp = 0;

        while (t2 % p == 0)
        {
            t2 /= p;
            exp++;
        }

        d *=1+ exp;
    }

    return divcount[t] = d;
}

int main()
{
    long long t = 1;
    int i;
    int j;

    memset(isprime,1 ,sizeof(isprime));
    for (i = 2; i < sizeof(isprime)-1 ; i++)
    {
        if (!isprime[i]) continue;

        prime[nprime++] = i;

        for (j =i*i; j < sizeof(isprime)-1;j+=i)
        {
            isprime[j] =  0;
        }
    }

    memset(divcount, 0, sizeof(divcount));
    for (i = 500; ; i++)
    {
        

        if (
            ((i+1) % 2==0 && div1(i) * div1((i+1)/2) > 500) ||
            (i%2 ==0 && div1(i/2) * div1(i+1) > 500))
        {
            printf("%d\n", i*(i+1)/2);
            return 0;
        }
    }
}

