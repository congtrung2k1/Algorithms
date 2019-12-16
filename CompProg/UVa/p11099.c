/**
 * Algorithm:
 * - Build sieve and then brute force to find next integer
 *   having same prime factors
 *
 * Gotchas:
 * - 1 has output Not Exist!
 * */ 
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

typedef long long ll;

char notprime[1000010];
int primes[1000000];
int nprimes = 0;

// build sieve
void init()
{
    int i,j;
    for (i = 2; i < sizeof(notprime);i++){
        if (notprime[i])continue;
        primes[nprimes++] = i;
        for (j=i*2; j < sizeof(notprime);j+=i){
            
            notprime[j]=1;
        }
    }
}

int f[99999];
int cnt[99999];
ll candid;

void  find(int depth, int limit, ll p, ll n)
{
    if (depth == limit ){
        if ( p < candid && p > n )
            candid = p;
        return;
    }

    int i,j; 
    ll aa =f[depth];
    for (i=1; ; i++){
        if (p*aa >= candid  ) break;
        find(depth+1, limit, p*aa , n);
        aa *= f[depth];
    }
}

void doit(int norig)
{
    ll p; int n=norig;
        if (notprime[n])
        {
            int i;int kk=0;
            // prime factorize
            for (i=0; i < nprimes;i++){
                int pr = primes[i];
                if (n <pr) break;
                if (n% pr ==0) {
                    f[kk] = pr;
                    cnt[kk]=0;
                    while (n % pr==0){ cnt[kk] ++; n/=pr;}
                    kk++;
                }
            }

            // search
            candid=2000000;
            find(0, kk, 1, norig);
            p=candid;
        }else p = ((ll)n)*n;

        if (p >= 2000000) printf("Not Exist!\n");
        else printf("%lld\n",p);

}

int main()
{
    init();
    while (1){
        int n;

        int k = scanf("%d", &n);
        if (k!=1)break;
        if (n==1) printf("Not Exist!\n");
        else doit(n);
    }
}

