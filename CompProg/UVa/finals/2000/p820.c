/**
 * Algorithm: Edmond-Karp max-flow
 * Runtime: O(V * E^2)
 *
 * Gotchas:
 * - Ford-Fulkerson algorithm is too slow.
 * - A "connection" of bandwidth x is simply two directed edges
 *   of opposite direction with capacity x each.
 *
 */

#include<stdlib.h>
#include<stdio.h>
#include<string.h>

int nei[111];      // neighbor count for vertex i
int bw[111][111];  // bandwidth capacity
int f[111][111];   // residual flow
int adj[111][111]; // adj list for vertex i
int n;             // # nodes
char visited[111];
int gen[111][111];
 struct
{
    int idx; // index of node
    int prev; // index of prev element in q
    int cap; // capacity flowing thru this node
}q[111];


// find a path from src node to dest
// returns the bandwidth that can be pushed
int find(int src, int dest)
{
    visited[src]=1;
    int qidx = 0;
    int cur=0;
    
    q[0].idx = src;
    q[0].cap = 0x7fffffff;
    q[0].prev = -1;
    qidx ++;
    int cidx;

    // breadth first search
    while (cur<qidx){
        cidx = q[cur].idx;
        if (cidx==dest){ break; }
        int cap = q[cur].cap;
        int cnt = nei[cidx];
        for (int i=0; i<cnt; i++){
            int nidx = adj[cidx][i];
            if(visited[nidx])continue;
        
            int bw1 = bw[cidx][nidx];
            int f1 = f[cidx][nidx];
            if (bw1-f1 <=0) continue;

            int newcap =bw1-f1;
            if(cap<newcap) newcap=cap;
            q[qidx].cap = newcap;
            q[qidx].idx= nidx;
            q[qidx].prev = cur;
            qidx++;
            visited[nidx]=1;
        }

        cur++;
    }

    if (cidx != dest) return 0;
    
    // update residual flow
    int cap = q[cur].cap;
    while(1){
        cidx = q[cur].idx;
        int prev = q[cur].prev;
        int pidx = q[prev].idx;
        f[ pidx][cidx] += cap;
        f[cidx][pidx] -= cap;
        if (q[prev].prev==-1) break;
        cur=prev;
    }
    return cap;

}

int casen=1;
int main()
{
    while(1)
    {
        scanf("%d",&n);
        if(n==0)break;
        memset(nei,0,(n+1)*sizeof(nei[0]));
        int src,dest,c;
        scanf("%d%d%d",&src,&dest,&c);
        int i,j;
        for (i=0;i<c;i++){
            int a,b,w;
            scanf("%d%d%d",&a,&b,&w);
            adj[a][nei[a]] = b;
            adj[b][nei[b]]=a;
            nei[b]++;
            nei[a]++;
            if (gen[a][b] != casen){bw[a][b] = w; gen[a][b]=casen;}
            else bw[a][b] += w;
            
            if (gen[b][a] != casen){ bw[b][a] = w; gen[b][a]=casen;}
            else bw[b][a] += w;
            f[a][b]=f[b][a]=0;
        }
        long long total=0;
        while(1){
            memset(visited,0,sizeof(visited));
            int f=find(src,dest);
            if (!f) break;
            total+=f;
        }
        printf("Network %d\nThe bandwidth is %lld.\n\n",casen,total);
        casen++;
    }
}

