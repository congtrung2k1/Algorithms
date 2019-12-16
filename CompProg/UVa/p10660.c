#include<stdio.h>
#include<stdlib.h>
#include<string.h>

typedef long long ll;

int cell[30];
int soln[10];
int minsoln[10];
ll mindist=0x7ffffffffffffff;

inline ll abs(ll x){ return x >= 0 ? x : -x; }

ll calc(){
    int i,j;
    ll sum =0;
    for (i=0;i<25;i++){
    
    int r = i/5;
    int c = i%5;
    ll min = 0x7ffffffffffff;
        for (j=0;j<5;j++)
        {
            int r2 = soln[j]/5;
            int c2 = soln[j]%5;
            ll d = (abs(r2-r)+abs(c2-c));
            if (d < min) min = d;
        }
        sum += cell[i]*min;
    }
    return sum;
}

void doit(int kk, int depth)
{
    
    if (depth==5){
        
        ll dist = calc();
        if (dist < mindist )
        {
            memcpy(minsoln, soln, 5*sizeof(int));
            mindist=dist;
        }
        return;
    }

    int i,j;
    for (i=kk;i<25;i++){
        soln[depth]=i;
        doit(i+1, depth+1);
    }
}


int main()
{
    int nu;
    scanf("%d",&nu);
    while(nu--){
    memset(cell,0,sizeof(cell));
        int k;
        scanf("%d", &k);
        int i,j;
        for (i=0;i<k;i++){
            int r,c,n;
            scanf("%d%d%d", &r,&c,&n);
            int idx = r*5+c;
            cell[idx]=n;
        }

         mindist=0x7ffffffffffffff;
        doit(0,0);
         for (i=0;i<4;i++){
            printf("%d ", minsoln[i]);
         }
         printf("%d\n",minsoln[4]);
    }
}
