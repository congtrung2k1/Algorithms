#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int v1[1000];
int v2[1000];

int comp1(const void *a, const void *b){
    return *(int*) a - *(int*) b;
}
int comp2(const void *a, const void *b){
    return -*(int*) a + *(int*) b;
}

int main()
{
        int n ; int casen=1;
        scanf ("%d", &n);
        while (n--){
            
            int t;
            scanf ("%d", & t);
            for (int i =0; i < t; i++){
                scanf ("%d", & v1[i]);
            }
            for (int i =0; i < t; i++){
                scanf ("%d", & v2[i]);
            }
                qsort( v1,  t, sizeof (int), comp1 );
                qsort( v2,  t, sizeof (int), comp2 );

               typedef long long ll;
        ll sum = 0;
        for (int i = 0; i< t;i++){
            sum += (ll)(v1[i]) * v2[i];
        }
        printf("Case #%d: %lld\n", casen++, sum);
        }
}


