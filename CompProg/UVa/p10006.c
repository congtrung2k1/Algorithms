/**
* Algorithm:
* Use the sieve method for primality testing
* Then use the square method to calculate a^n mod n in O(log n)
* 
*/
#include<stdio.h>
#include<string.h>
#include<stdlib.h>

typedef long long ll;

ll n;

// computes a^p mod n using the sqr method
ll comp(ll a,ll p)
{
    if (p == 0) return 1;
    

    if (p % 2) // odd
    {
        ll i = comp(a,(p-1)/2) % n;
        return (((i*i)%n)*a)%n;
    }
    ll i = comp(a, p/2) %n;
    return (((i*i) % n )) ;
}

char notprime[70000];

void init()
{
    int i,j;
    for (i=2; i < sizeof(notprime);i++){
        if (notprime[i]) continue;
        for (j= i*2; j < sizeof(notprime);j+=i){
            notprime[j] = 1;
        }
    }
}
int main()
{
    init();
    while(1){
        scanf("%lld", &n);
        if (n==0)break;

        ll a; bool f=true;
        if (notprime[n])
        {
        for (a = 2; a <= n-1;a++){
            ll k = comp(a, n);
            if (k != a){f=false; break;}
        }
        }
        else f = false;
        if (f) printf("The number %lld is a Carmichael number.\n",n);
        else printf("%lld is normal.\n", n);

    }
}


