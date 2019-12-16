/**
Algorithm:
Brute force + backtracking

Travelling salesman is NP-complete so exhaustive search is required
and pruning is the key

Gotchas:
- A beeper can be in the initial position of the robot and as good as
  non-existent.

*/

#include<stdio.h>
#include<string.h>

int dist[14][14]; // dist between i and j
int x[14]; // 0 is starting, 1 onwards beeper
int y[14]; 
int nbeeper; 

char used[14]; 
int mindist ;

void  find( int cur, int sum,  int k){

    // pruning
    if (sum >= mindist) return ;

    if (k == nbeeper ){
        int d = sum + dist[cur][0];
        if (d < mindist) mindist = d;
        return ;
    }


    int  i,j;
    for (i=1; i <= nbeeper;i++){
        if (used[i]) continue;
        used[i] = 1;
         find(i, sum+dist[cur][i], k+1);
        used[i]=0;
    }
}
inline int abs (int y){ return y <0 ? -y : y; }
int main(){
    int nu; scanf ("%d", &nu);
    while (nu--){ int i,j;
        scanf("%d%d", & i,&i);
        scanf("%d%d", & x[0], &y[0]); int k;
        scanf("%d", & k);
        for (i= 0; i < k;i++){
            scanf("%d%d", & x[i+1],& y[i+1]);
        }

        // generate all pairs distances
        for (i=0; i <=k;i++){
            for (j=0; j <=k;j++){
                if (j==k) continue;
                dist[i][j] = abs(x[i] - x[j])+abs(y[i]-y[j]);
                dist[j][i] = dist[i][j];
            }
        }
        nbeeper=k; mindist = 0x7fffffff;
        find( 0, 0, 0);
        printf("The shortest path has length %d\n",mindist);
    }
}



