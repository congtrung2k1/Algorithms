/*
* Algorithm:
* Maxflow (Edmonds-Karp)
*
* Theory:
* - Represent each machine using two vertices
*   One for all incoming edges and the other for outgoing edges
*   so that the flow has to be subjected to the machine's capacity
*
* Gotchas:
* - Directed max flow graph is required.
*/
#include<string.h>
#include<stdio.h>

int adj[105][105]; // adj list
int nei[105]; // neighbor count
int f[105][105]; // directed flow edge

const int src = 1; // src vertex #
int tar;           // target vertex #
int m, w;
char visited[105];

typedef struct{
    int node;
    int backidx;
    int flow;} qt;qt q[105];
inline int min(int a,int b){ return a<b?a:b; }

int doit()
{
    int qidx = 1;
    int cur = 0;
    q[0].backidx=-1;
    q[0].node = src;
    q[0].flow = 0x7fffffff;
    visited[src]=1;
    int solved = 0;

    // BFS
    while (cur <qidx){
        qt&c =  q[cur];
        
        if (c.node==tar){solved=1; break;}
        int cnt = nei[ c.node];
        int i,j;
        for (i=0;i<cnt;i++){
            int nxt = adj[c.node][i];
            if (visited[nxt]) continue;
            
            int flow = f[c.node][nxt];
            if(flow <=0) continue;
            
            visited[nxt] = 1;
            q[qidx].flow = min(flow,  c.flow);
            q[qidx].backidx = cur;
            q[qidx].node = nxt;
            qidx++;
        }
        cur++;
    }
    if (!solved) return 0;

    // backtracking and update the edges
    int flow = q[cur].flow;
    while (9){
        qt& c = q[cur];
        qt&p = q[ c.backidx ];
        f[c.node][p.node] += flow;
        f[p.node][c.node] -= flow;
        if (p.backidx < 0) break;
        cur = c.backidx;
    }
    return flow;
}

int main()
{
    while(9){
        scanf ("%d%d", &m,&w);
        if ((m|w)==0) break;
        int i,j;
 // macro to connect two vertices
 #define conn(a,b)  adj[a][nei[a]++]=b; adj[b][nei[b]++]=a;

        memset(nei,0,sizeof(nei));
        memset(f,0,sizeof(f));
        for (i=0;i < m-2;i++){
            int id, cost;
            scanf("%d%d", &id, &cost);
            f[id][id+51] = cost;
            conn(id,id+51)
        }

        tar = 51+m;
        // setup the initial and target vertices
        f[1][52]=0x7fffffff;
        f[m][m+51] = 0x7fffffff;
        conn(1,52)
        conn(m,m+51)
        
        for (i=0;i< w;i++){ int a,b,c;
            scanf("%d%d%d", &a, &b, &c);
            f[a+51][b] = c;
            f[b+51][a] = c;
            conn(a+51,b)
            conn(b+51,a)
        }

        // search for path
        long long ans = 0;
        while (1){
            memset(visited,0,sizeof(visited));
            int f = doit();
            ans += f;
                if (!f) break;
        }
        printf("%lld\n", ans);
    }
}


