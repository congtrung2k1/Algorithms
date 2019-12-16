/**
* Algortihm: 
* Basic sorting
* 
* it can be proven that the largest evening should be
* paired with the smallest morning route and so on...
*
* Suppose the largest evening route is paired with
* the smallest morning. If none of the pairs (including the rest)
* exceeds the limit, then all is well and we're done
* if there exists a pair that exceeds, it can be shown that
* we will not be in a better situation if we perform a swap (any swap)
* Thus, the initial pairing must be optimal.
*/

#include<stdio.h>
#include<stdlib.h>
#include<string.h>


typedef long long ll;


ll a1[1000];
ll a2[1000];
int d;
int r;
int n;

int smallfirst(const void * a, const void *b){
    ll aa = *(ll*) a;
    ll bb = *(ll*) b;
    if (aa<bb) return -1;
    if (aa>bb) return 1;
    return 0;
}

int bigfirst(const void * a, const void *b){
    ll aa = *(ll*) a;
    ll bb = *(ll*) b;
    if (aa>bb) return -1;
    if (aa<bb) return 1;
    return 0;
}
int main()
{
    while (1){
      scanf("%d%d%d", &n, &d, &r);
      if ((n|d|r) == 0) break;

      int i,j;
      for (i=0;i<n;i++){
        scanf("%lld", &a1[i]);
      }
      for (i=0;i<n;i++){
        scanf("%lld", &a2[i]);
        }
        qsort( a1, n, sizeof(ll), smallfirst);
        qsort( a2, n, sizeof(ll), bigfirst);
        ll total=0;
        for (i=0;i<n;i++){
            ll sum = a1[i]+a2[i];
            if (sum > d) total += sum-d; 
        }
        printf("%lld\n", total * r);
    }
}


