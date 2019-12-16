/**
* Algorithm:
* Edmonds-Karp maxflow solver for Bipartite matching
*
* Any other algorithm that solves bipartite matching should work
*
*/

#include<stdio.h>
#include<stdlib.h>
#include<string.h>

const int src=0;
const int tar=1;

int nbolt, nnut;
int adj[1010][1010];
int nei[1010];
char bw[1010][1010];
char f[1010][1010];

typedef struct{
    int node;
    int backidx;
} qt;

qt  q[1010];
int nq=0;
int maxflow;
int visited[1010/32];

inline bool isv(int i){ return (visited[i/32] & (1 << (i%32))) !=0; }
inline void setv(int i){visited[i/32] |= (1<<(i%32)); }
int doit()
{
    int idx=0;
    q[0].node = src;
    q[0].backidx=-1;
    nq=1;
    setv(src);
    int solved = 0;
    while(idx<nq){
         qt&cur = q[idx];
        if (cur.node == tar){solved=1; break;}
        int i,j;
        int cnt = nei[cur.node];
        for (i=0;i<cnt;i++){
            int the = adj[cur.node][i];
            if (isv(the)) continue;
            int bw1 = bw[cur.node][the];
            int f1 = f[cur.node][the];
            int flow = bw1-f1;
            if (flow <= 0) continue;
            q[nq].node = the;
            q[nq].backidx = idx;
            nq++;
            setv(the);
        }
        idx++;
    }
    if ( !solved ) return 0;

    while(1){
        qt&cur = q[idx];
        qt&prev = q[ cur.backidx ];
        f[cur.node][prev.node] -=1;
        f[prev.node][cur.node] +=1;
        if (prev.backidx < 0) break;
        idx = cur.backidx;
    }
    maxflow+= 1;
    return 1;
}

int main()
{
    int nu;
    scanf("%d",&nu);
    for (int c = 1; c<=nu;c++){
        scanf("%d%d", &nbolt, &nnut);
        memset(nei, 0, sizeof(int) * (2+nnut+nbolt));
        maxflow=0;
        int i,j;
        for (i=0;i<nbolt;i++){

            int has=0;
            int bi = i+2;
            for (j=0;j < nnut;j++){
                int k;
                scanf("%d", &k);


                if (k){ has=1;
                    int ni = 2+nbolt+j;
                    adj[bi][ nei[bi] ] = ni;
                    adj[ni][ nei[ni] ] = bi;
                    bw[bi][ni] = 1;
                    bw[ni][bi] = 0;
                    f[ni][bi]= f[bi][ni]=0;
                    nei[bi]++; nei[ni]++;
                }
            }

            if (has){
            adj[src][ nei[src] ]= bi;
            adj[bi ][ nei[bi ]] = src;
            bw[src][bi] = 1;
            bw[bi ][src]= 0;
            f[src][bi]=0;
            f[bi][src]=0;
            nei[src]++; nei[bi]++;
            }
        }

        for (i=0;i<nnut;i++){
                int ni = 2+nbolt+i;
                if (! nei[ni]) continue;
                    adj[ni][ nei[ni] ] = tar;
                    adj[tar][ nei[tar] ] = ni;
                    bw[ni][tar] = 1;
                    bw[tar][ni] = 0;
                    f[tar][ni]=f[ni][tar]=0;
                    nei[ni]++; nei[tar]++;
        }

        do{ memset(visited,0,sizeof(visited)); }while(doit());
        printf("Case %d: a maximum of %d nuts and bolts can be fitted "
            "together\n", c, maxflow);
    }
}
