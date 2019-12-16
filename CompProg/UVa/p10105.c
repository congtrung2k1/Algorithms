/**
 * Algorithm:
 * Simple combinatorics
 *
 */

#include<stdlib.h>
#include<string.h>
#include<stdio.h>

typedef long long ll;
ll f[100];

int main()
{
    int i,j;
    ll fact = 1;
    for (i=0;i< 15;i++){
        f[i] = fact;
        fact *= (i+1);
    }
    if (f[3] != 6) return 0;

    while (1){
        int n,k;
        int p = scanf("%d%d", &n,&k);
        if (p!=2)break;
        ll ans = f[n];
        for (i=0;i < k;i++){
            scanf("%d", &j);
            ans /= f[j];
        }
        printf("%lld\n",ans);
    }
}
