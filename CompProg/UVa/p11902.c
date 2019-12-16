/**
Algorithm:
Brute force + Breadth first search

Depth first search would totally suffice but I just wanted
to improve the timing.

The code is more complicated than necessary to improve performance

Delete each node and check dominators
*/
#include<stdio.h>
#include<string.h>

int adj[102][102];
int n;
int nei[102];
int visited[103][103]; // visited[i+1][j] == gen iff j is reachable when i is deleted
int gen; // generation
int q[102];

// simple DFS
void find(int*visited){
    int i,j;
    int qcur=0;
    int qsize = 1;
    q[0] = 0;
    visited[0]=gen;
    while (qcur < qsize){
            int cur = q[qcur];
            int cnt = nei[cur];
            for (i=0;i<cnt;i++){
                int nxt = adj[cur][i];
                if (visited[nxt]==gen) continue;
                visited[nxt]=gen;
                q[qsize++]=nxt;
            }
            qcur++;
    }
}

int dom[102][102];
char dash [402]; int cc=1;
int main(){
    int p;
    for (p=0;p<400;p++){
        dash[p]='-';
    }
    int nu;
    scanf ("%d", &nu);
    while (nu--){
        scanf("%d", &n);
        int i,j; memset(nei,0,sizeof(nei));
        for (i=0;i<n;i++){
            for (j=0;j<n;j++){
                int k; scanf ("%d", &k);
                if (k==0|| i==j) continue;
                adj[i][nei[i]++] = j;
            }
        }
        
        gen++;
        // find all nodes reachable from 0
        find(&visited[0][0]);
        visited[1][0]=-1;
        
        // delete each node and find nodes that are reachable
        for (i=1;i< n;i++){
    
            // "delete" node i and do BFS
           visited[i+1][i] = gen;
            find(&visited[i+1][0]);
            visited[i+1][i]--;
            visited[1][i] = -1;
        }
printf("Case %d:\n",cc++);
        for (i=0;i<n;i++){
            dash[2*n-1]=0;
            printf("+%s+\n",dash);
            dash[2*n-1]='-';
            for (j=0;j<n;j++){
              printf("|%c", 
              // output Y iff reachable previously but not when i is deleted
                (visited[0][j]==gen&&visited[i+1][j]!=gen) ? 'Y' :'N');  
            }
            printf("|\n");

        }
            dash[2*n-1]=0;
            printf("+%s+\n",dash);
            dash[2*n-1]='-'; //printf("\n");
    }
}

