/**
 * Algorithm:
 * Dynamic programming (see below)
 *
 * */

#include<string.h>
#include<stdio.h>


typedef long long ll;

int v[202];
int n,m,d,q;

// f[i][j][k] is the # of groups that gives remainder k
// when mod d and has only j items (including i^th item)
// f[i][j][k] = sum[j-1<=p<i]
//               ( f[p][j-1][(d+k-x)%d] ) where x is v[i] % d
ll f[202][11][20]; 
ll ans;
ll big; // big multiple of d

void doit()
{
    int i,j,k;
    for (i=1; i <= n;i++){

        // handle negative numbers
    int x = (int)((big + v[i]) % d);
        f[i][1][x] = 1;

        int mm = i < m ? i : m;
        for (j = 2; j <= mm; j++){
            for (int p = j-1; p < i; p++){

                for (k = 0; k < d;k++){
                    f[i][j][k] += f[p][j-1][ (d+k-x)%d ];
                }
            }
        }
    }
    ans = 0;
    for (i=1; i<=n;i++){ 
        ans+=(f[i][m][0]); 
    }
}

int main()
{int cc=1;
    while(9){
        scanf("%d%d", &n, &q);
        if ( (n|q) == 0) break;
        int i,j;
        for (i=0;i<n;i++){
            scanf("%d", &v[i+1]);
        }
        printf("SET %d:\n",cc);cc++;
        for (i =1; i <=q;i++){
            scanf("%d%d",&d,&m);
            for (big = ((ll)1)<<32; big % d; big++){}
            doit();
            printf("QUERY %d: %lld\n", i,ans);
            memset(f,0,11*20*sizeof(ll)*(1+n));
        }
    }
}


