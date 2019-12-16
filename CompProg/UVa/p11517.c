/**
 Algorithm:
 DP
*/
#include<string.h>
#include<stdio.h>

int v[102];
int nv;
int price;
int f[102][20005]; // f[i][j] is min # of coins in 1..i to make exactly $j

inline int min(int a, int b){ return a<b?a:b; }

int main(){

    int nu;
    scanf("%d", &nu);

    while (nu--){
        scanf("%d", &price);
        scanf("%d", &nv);
        int i,j;
        int found=0;
        for (i=0;i<nv;i++){
                scanf("%d", & v[i]);
            if (v[i] == price){found=1;}
        }
        if (found){ printf("%d %d\n", price,1); continue; }
       
        memset(f,0,sizeof(f));
        for (i=1;i<=nv;i++){
            int cur = v[i-1];
            memcpy( &f[i][0], &f[i-1][0], sizeof(f[0]) );
            f[i][cur] = 1;
            for (j = 1; j < price;j++){
                if (!f[i-1][j]) continue;
                int a = j+cur;

                if (f[i-1][a] && f[i][a]){
                     f[i][a] = min(f[i][a], min(f[i-1][a], f[i-1][j]+1));
                }
                else if (!f[i-1][a] && f[i][a]){
                     f[i][a] = min(f[i][a],  f[i-1][j]+1);
                }
                else if (f[i-1][a] && !f[i][a]){
                     f[i][a] =  min(f[i-1][a], f[i-1][j]+1);
                }
                else 
                {
                    f[i][a] = f[i-1][j]+1;
                }
            }
        }

        for (j = price; ;j++){
            if (f[nv][j] ){  break;}
        }
        
        
        printf("%d %d\n", j, f[nv][j]);
    }
}

