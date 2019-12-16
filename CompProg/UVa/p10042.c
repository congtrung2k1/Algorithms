/*
 * Algorithm:
 * Build prime sieve and cache the sum of digits in each prime
 * Then brute force from n
 *
 * */

#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<assert.h>

#define FIND 70000

char notprime[FIND]; // notprime[i] == 1 iff i not prime
int primes[FIND];    // primes
int nprimes;         // # of primes
int cp[FIND];        // cp[i] = sum of digits in i

typedef long long ll;

int calc(ll n) // calc sum of digits
{
    int sum = 0;
    while (n > 0)
    {
        sum += n % 10;
        n /= 10;
    }
    return sum;
}

// init cp , primes and notprime arrays
void init(){
    int i,j;
    for (i=2; i <sizeof(notprime);i++){
        if (notprime[i])continue;
        cp[i] = calc(i);
        primes[nprimes++]=i;
        
        for (j=i*2; j < sizeof(notprime);j+=i){
            notprime[j]=1;
            int j2=j;
            while (j2 % i==0){ j2/=i; cp[j] += cp[i];}
        }
    }
}

// calc sum of digits in prime factors
int calcprime(ll n)
{
    int i;
   ll n2= n;
   int sum=0;

   for (i=0;i<nprimes;i++){ int pp =primes[i];
       if (n2 < FIND) {sum += cp[n2];n2=1; break;}
        if (n2 %  pp) continue;
        int cnt = 0;
        while (n2%pp==0){ cnt++; n2/=pp; }
        sum += cp[pp] *cnt; 
   }

   // if n2==n then n2 is a prime since we couldn't factorize it
   // so we reject n as a smith #
    if (n2 == n ) return  0;

    // if we couldn't fully factorize n, then n2 is a leftover 
    // large prime factor which is not in our cache.
    if (n2 != 1) return sum+calc(n2);

    return sum;
}

// returns true iff n is a smith number
int is(ll n){
    
    if (n < sizeof(notprime)&&!notprime[n])return 0;
   
    return calcprime(n)  == calc(n);
}

int main()
{
    init();
    assert(calc(0)==0);
   assert(calc(1)==1);
   assert(calc(123)==6);
    int nu;scanf("%d", &nu);
    while (nu--){
        ll n;
        scanf("%lld", &n);
        ll i;
        for (i=n+1; ;i++){
           if (is(i)) {printf("%lld\n",i);break;}
        }
    }

}
