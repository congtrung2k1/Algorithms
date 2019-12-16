/**
Algorithm:
Totient function + aggressive caching

Used the formulae:
- phi(p^a) = p^a-p^(a-1) where p prime
- phi(n) = phi(p^i) * phi(q^j) ... where p, q .. are prime factors of n

Gotchas:
- phi(1)==1
*/
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int cum[2000001];      // cumulative sums of depths
int cache[2000001];    // phi values
int depthc[2000001];   // depth cache
char notprime[2000001];

void init()
{
    cache[1]=1;
    int i,j;
    for (i=2; i < sizeof(notprime);i++){
        if (notprime[i]) continue;
        cache[i] = i-1;

        // update each phi(j) while we update notprime
        for (j= i*2; j< sizeof(notprime); j+=i){
            notprime[j] = 1;
            int o = j;
            while (j % i ==0){j /= i;}
             int add = o/j;
             j=o;
            if  (cache[j]==0)cache[j] = add-add/i;
            else cache[j] *= add-add/i;
        }
    }
}

int main()
{
    // The initialization is actually quite fast!
    init();
    int k;
    cum[0]=0;
    cum[1]=1;
    cum[2] = 2;
    depthc[1] = depthc[2] = 1;
    for (k = 3; k <= 2000000;k++){
        int phi = cache[k];
        int depth = 1+depthc[phi];
        depthc[k] = depth;
        cum[k] = cum[k-1]+ depth;
    }

    int nu;scanf("%d", &nu);
    while (nu--){
        int a,b;
        scanf("%d%d",&a,&b);

        // swap a & b if necessary
        if (a >b){ int t = a; a = b; b = t;}

        // constant time lookup!
        int d = cum[b]-cum[a-1];
        printf("%d\n",d);
    }
}


