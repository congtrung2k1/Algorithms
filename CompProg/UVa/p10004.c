/**
Algorithm:
Bicoloring using depth-first traversal

*/
#include<string.h>
#include<stdio.h>

char color[202];
int adj[202][202];
int nei[202];


bool find(int cur, int col){
    int i,j;
    int cnt = nei[cur];
    int opp = col ==1 ? 2 : 1;
    for (i=0;i < cnt;i++){
         int nxt = adj[cur][i];
        if (color[nxt] && color[nxt] != opp) return false;
        if (color[nxt]) continue;
    color[nxt]=opp;
        if (! find(nxt, opp)) return false;
    }
    return true;
}

int main(){

    while (8){
        int n,m;
        scanf ("%d", &n); if (n==0) break;
        int i,j; scanf ("%d", &m);memset(nei,0,sizeof(nei));
        for (i=0;i < m;i++){ int a,b;
            scanf("%d%d", &a, &b);
            adj[a][nei[a]++]=b;
            adj[b][nei[b]++]=a;
        }
        memset ( color, 0,sizeof(color));
        color[0] = 1;
        if (find (0, 1)) printf("BICOLORABLE.\n");
        else printf("NOT BICOLORABLE.\n");
    }
}



