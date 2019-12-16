/**
 * Algorithm:
 * Topological sort
 *
 *
 */

#include<stdio.h>
#include<string.h>

int stk[999];
int n;
int stkidx;
int adj[102][102];
int nei[102];
char visited[102];

void  find(int cur){


        if (visited[cur]) return;
        visited[cur]=1;
    int i,j;
    int cnt = nei[cur];
    for (i=0;i < cnt ;i++){
        int nxt=adj[cur][i];
        find (nxt);
    }

    stk[stkidx++] = cur;
}


int main(){

    while (9){
        int m,i,j;
        scanf ("%d %d", &n, &m);
        if (m+n==0) break;
        
            memset(visited,0,sizeof(visited));
            memset(nei,0,sizeof(nei));
        for (i=0;i< m;i++){
            int a,b;
            scanf ("%d%d", & a, & b );
            adj[a][nei[a]++] = b;
            
        }
        stkidx=0;
        for (i=1; i <=n;i++){
            find(i);
        }

        for (i=0; i<stkidx/2;i++){
            int t = stk[i];
            stk[ i] = stk[stkidx-i-1];
            stk[stkidx - i - 1 ] = t;
        }

        printf("%d", stk[0]);
        for (i=1;i<stkidx;i++){
            printf(" %d",stk[i]);
        }
        printf("\n");
    }

}

