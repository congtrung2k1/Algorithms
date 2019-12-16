/**
 * Algorithm:
 * Sorting
 *
 * */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef long long ll ;

int a[100002];
int k,c;
int n;

int comp(const void *a, const void * b)
{
    return  *(int*) a - *(int*) b;
}

int main()
{
    int nu;
    int casen = 1;
        scanf("%d",&nu);
        while (nu--)
        {
            scanf("%d%d%d%d", &k, &c, &n, &a[0]);
            k %= 1000007;
            c %= 1000007;
            
            int i;
            ll ts =a[0]; // total sum
            for (i=1; i < n;i++){
                a[i] =  (((ll)k * a[i-1] )% 1000007+ c) % 1000007;
                ts += a[i];
            }

            qsort(a,n,sizeof(int),comp);

            ll ans =0; // abs diff between all pairs
            ll bb = 0;
            for (i=0;i<n;i++){
                
                ll v = a[i];
                ans += v*i-bb + (ts - (n-i)*v);
                ts-=v;
                bb+=v;
            }
            printf("Case %d: %lld\n", casen, ans/2);
            casen++;
        }

    return 0;
}


