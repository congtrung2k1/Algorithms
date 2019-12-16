/**
 * Algorithm:
 * Basically implement Euler's totient function
 *
 * This uses another property of the totient function so that
 * we don't need to build a sieve.
 *
 * Similar problem:
 * 10179
 *
 * Gotchas:
 * - if input is 1, then output must be 0. The problem asks for 
 *   # of positive integers less than n coprime to n. So answer is 0
 * */
#include<stdio.h>
#include <string.h>
#include<stdlib.h>
#include <math.h>

typedef long long ll;

// find smallest factor of n if non-prime
// else return 0 
ll f(ll n){
    ll i=0;
    if (n==2) return 0;
    ll k = (ll)sqrt(n)+1;
    for (i= 2; i <= k; i++){
        if (n % i==0) return i;
    }
    return 0;
}

ll gcd(ll m, ll n){
    while (1){
    if (m==0) return n;
    if (n==0) return m;
     ll t = (m);
     m = n;
     n = t % n;
    }
}

ll doit(ll n){
    if (n==1) return 1; 
        ll ff =f(n);
        if (ff ==0) {  return n-1; }
        ll d =gcd(n/ff,ff);
    return doit(ff) * doit(n/ff) * d / doit(d);
}

int main()
{

    while (1){
        ll n;
        scanf("%lld", &n); if (n==0) break;
        if (n==1) printf("0\n");
        else         printf("%lld\n",doit(n));
    }
}
