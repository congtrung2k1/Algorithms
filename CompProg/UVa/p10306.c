/**
 Algorithm:
 DP

*/

#include<string.h>
#include<stdio.h>

int coins[2][50];
int f[310][310];
int ans;
int m;
int S2; // S squared

void doit(){
    int i,j;
    for (i=1;i <= m;i++){
        int curx = coins[0][i-1];
        int cury = coins[1][i-1];
        f[curx][cury] =  1;
        for ( int x = 0; x <= 300-curx; x++){
            for (int y = 0; y <= 300-cury; y++){
                if (! f[x][y]) continue;
                int nx = curx+x;
                int ny = cury+y;
                if (!f[nx][ny]|| f[nx][ny] > f[x][y]+1){
                    f[nx][ny] = f[x][y]+1;
                }

                int ns = nx*nx+ny*ny;
                if (ns == S2 && ans > f[nx][ny]){
                    ans  = f[nx][ny];
                }
            }
        }
    }
}
int main(){
    int nu;
    scanf("%d", &nu);

        while (nu--){
            int S;        
            scanf ("%d%d", &m, &S);
            S2 = S*S;
            int i,j;
            for (i=0;i < m;i++){
                scanf("%d%d", & coins[0][i], &coins[1][i]);

                // get  rid of coins that are too large or zero valued
                if (coins[0][i]*coins[0][i] +
                    coins[1][i] * coins[1][i] > S2 ||
                    coins[0][i] + coins[1][i] == 0){i--;m--;}

            }

            memset(f,0,sizeof(f));
ans =0x7fffffff;            doit();
            if (0x7fffffff== ans) printf("not possible\n");
else            printf("%d\n", ans);
        }
}


