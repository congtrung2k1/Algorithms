/**
Algorithm:
Depth first search. 
Note PPA can be negative. Average PPA is sum divided by no. of edges (roads)

The set of edges with highest average PPA is simply
the set of connected edges with the max PPA.

*/
#include <stdio.h>
#include <stdlib.h>
#include<string.h>
#include <algorithm>

char visited[505];
char adjv[505][505];
int adj[505][505]; 
int ppa[505][505]; // ppa value for edge[i][j]
int nei[505];
int n,m;

int maxw; // max ppa in entire graph
int maxn; // max no. of cities
int vgen[505][505]; // visited edges generation
int  numcities; // current num cities

void dfs(int s, int gen)
{
    
    if(visited[s]) return ;
    visited[s]=1;
    int num1 =  nei[s];
    int i,j;
    for (i=0;i < num1;i++){
        int nxt =adj[s][i];
        if (ppa[s][nxt] != maxw || vgen[s][nxt]==gen)continue;
        vgen[s][nxt] = vgen[nxt][s]=gen;
        
        if (!visited[nxt])numcities++;
        if ( maxn < numcities)maxn=numcities;

        dfs(nxt,gen);
    }
}

int main()
{
    while (scanf("%d%d",&n,&m)==2)
    {
        if (n==0)break;
        int i,j;
        memset(adjv, 0, sizeof adjv);
        memset(nei,0,sizeof nei);
        memset(ppa,0,sizeof ppa);
        maxw = 0x80000000;
        for (i=0;i < m;i++){ int a,b,v;
            scanf("%d%d%d", &a, &b,&v);
            
            // record only the edge with the highest PPA for multi-edges
            if (!adjv[a][b]){
                ppa[a][b]=v;
                ppa[b][a]=v;
                adjv[a][b] = adjv[b][a] = 1;
                adj[a][nei[a]++]=b; 
                adj[b][nei[b]++]=a;
            }else{
                ppa[a][b]=ppa[b][a]=std::max(ppa[a][b],v);
            }
            maxw = std::max(maxw,v);
        }
        
        memset(visited, 0,sizeof visited);
        memset(vgen,0,sizeof vgen);
        
        maxn = 0;
        for (i = 1;i <= n;i++){
             numcities=1;
             dfs(i,i);
        }
        printf("%d\n", maxn);
    }
    return 0;
}



