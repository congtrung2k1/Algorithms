/**
 Algorithm:
 - Sieve and prime factorization

Gotchas:
- 1 divides everything
- 0 does not divide anything
- 0! == 1
*/

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
typedef unsigned long long ll;
ll m,n; // n!
int pr[99];
int cnt[99];

char notprime[70000];
int primes[70000];
int nprime = 0;

void init()
{
    int i,j;
    for (i=2;i < sizeof(notprime);i++){
        if (notprime[i]) continue;
        primes[nprime++]=i;
        for (j=i*2; j < sizeof(notprime);j+=i){
            notprime[j] = 1;
        }
    }
}

int main()
{
init();
    while (1){
        int k=scanf("%d%d", &n,&m);
        // m divides n !
        if (k != 2) break;

        bool div = true;

        if (m == 1|| (m <= n && m)) div = true;
        else if (n==0||m==0) div = false;
        else {

            ll morig = m;
            int prc = 0;
            int i;
            // prime factorize m
            for (i=0;i<nprime;i++){
                int p = primes[i];
                if (m<p) break;
                if (m%p) continue;
                cnt[prc]=0;
                pr[prc]=p;
                while (m%p ==0){ cnt[prc]++;m/=p; }
                prc++;
            }

            // if m != 1 then m is prime
            if (m > n) div = false;
            else{
                // check whether n! contains all
                // prime factors of m
                for (i=0;i<prc;i++){
                    int p = pr[i]; // prime factor
                    int c=cnt[i];  // power of prime factor
                    ll j;
                    for (j=p; j <= n;j+=p){
                        ll j2 = j;
                        while (j2 % p ==0){
                            j2/=p;c--;
                            if (c==0){ j=n+1;break; }
                        }
                    }
                    if (c!=0){ div = false; break;}
                    
                }
            }
            m=morig;
        }
        if( div)printf("%lld divides %lld!\n", m, n);
        else printf("%lld does not divide %lld!\n",m,n);
    }
}


