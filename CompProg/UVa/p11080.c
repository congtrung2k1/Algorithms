/**
 * Algorithm:
 * Bicoloring of graph based on depth first search
 *
 */

#include<stdio.h>
#include<string.h>


int adj[202][202];
int nei[202];
char color[202];
int n;
#define cls(p) memset(p,0,sizeof(p))

bool find(int cur, int col){
    int i,j;
    int cnt = nei[cur];
    int opp = col  == 1 ? 2 : 1;
    for (i=0; i <cnt;i++){
        int nxt = adj[cur][i];
        if (color [nxt] ){
            if (color[nxt] != opp ) return false;
            continue;
        }
        color[nxt]=opp;
        if (! find (nxt, opp) ) return false;
    }
    return true;
}

int main(){
    int nu;scanf ("%d", &nu);
    while (nu--){ int i,j,m;
        scanf ("%d%d", & n , &m); cls(nei); 
        for (i=0; i < m;i++){
            int a,b;
            scanf ("%d%d", &a , & b );
            adj[a][ nei[a] ++] = b;
            adj [b ] [nei[b]++] = a;
        }
        cls(color);
        int total=0;
        char found[202]={0}; char can=1;
        // color every node since graph can be disconnected
        for (i=0;i <n;i++){
            if (color[i]) continue;
            color [i] = 1;
            if (! find (i,1) ){
                printf("-1\n"); can=0; break;
            }
            int sum[3] = {0};
            for (j=0; j < n;j++){
                if (found [j]||!color[j]) continue;
                found[j]=1;
                sum[ color[j]]++;
            }
            // we always need at least one guard, for the case 
            // where a single node is by itself
            if (sum[1] ==0) sum[1]=1;
            if (sum[2] == 0) sum[2]=1;
            // use the min color
            total += ( sum[1] < sum[2] ? sum[1] : sum[2]);
        }
        if (can)
            printf ("%d\n",total);// sum[1] < sum[2] ? sum[1] : sum[2]);
    }
}


