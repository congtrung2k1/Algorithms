/**
Algorithm:
Bicoloring using DFS

Very straightforward
*/
#include<stdio.h>
#include<string.h>


char color[402];
int n;
int adj[302][302];
int nei[302];

bool find(int cur,int c){
    int cnt = nei[cur];
    int i,j;
    int opp = c == 1 ? 2 : 1;
    color[cur]=c;
    for (i=0;i < cnt; i++){
        int nxt = adj[cur][i];
        if (color[nxt] != -1 &&  color[nxt] != opp) return false;
        if (color[nxt] != -1) continue;
        if (! find( nxt, opp))  return false;
    }return true;
}


int main(){
    while (8){
        scanf ("%d", &n); if(n==0)break;
        memset(nei,0,sizeof(nei));
        while (9){
            int a,b;
            scanf("%d%d",&a,&b);
            if (a+b==0)break;
            adj[a][nei[a]++]=b;
            adj[b][nei[b]++]=a;
        }memset(color, -1, sizeof(color));
        bool b = true;
        for (int i = 1; b && i <= n ;i++){
            if (color[i] != -1)continue;
            b =b && (find(i, 1));
        }
        if (b)printf("YES\n");
        else printf("NO\n");
    }
}
