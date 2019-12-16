/*
LANG: C++
TASK: stall4
*/
/**
 * Bipartite matching using maxflow (Edmond-Karp).
 * Connect each cow to each of its candidate stall with an edge of capacity 1.
 * Connect the start node to each cow with an edge of capacity 1.
 * Connect each cow to the end node with an edge of cap 1.
 * Maximising the flow is equivalent to maximising the matches since each unit
 * of flow is equivalent to a single match.
 */
#include<iostream>
#include<fstream>
#include<cstring>
#include<cstdlib>
#include<queue>
using namespace std;

struct node{
    int rate,inter;
};
int adj[410][210];
int adjsize[410];
int cap[410][410];
int pred[410];
int N,M; // N is no. of cows

int main(){
    ifstream in("stall4.in");
    ofstream out("stall4.out");
    int i,j,k;
    in>>N>>M;
    // indexes defined as cow (1..N), stall (N+1..N+M),
    const int start=N+M+1,end=start+1;
    for(i=0;i<N;i++){
        in>>k;
        int a=i+1,b;
        for(j=0;j<k;j++){
            in>>b; b+=N;
            // connect cow to stall
            adj[a][adjsize[a]++]=b;
            adj[b][adjsize[b]++]=a;
            cap[a][b]=1;
        }
        // connect start to cow
        b=a; a=start;
        adj[a][adjsize[a]++]=b;
        adj[b][adjsize[b]++]=a;
        cap[a][b]=1;
    }
    for(i=1;i<=M;i++){
        // connect cow to end.
        int a=N+i,b=end;
        adj[a][adjsize[a]++]=b;
        adj[b][adjsize[b]++]=a;
        cap[a][b]=1;
    }
    int ans=0,maxflow;
    while(1){
        memset(pred,0,sizeof pred);
        pred[start]=start;
        node nd; nd.rate=1<<30; nd.inter=start;
        queue<node> q;
        q.push(nd);
        maxflow=0;
        // BFS to find a path to the sink end.
        while(q.size()){
            node cur=q.front(); q.pop();
            if(cur.inter==end){
                maxflow=cur.rate;
                break;
            }
            for(i=0;i<adjsize[cur.inter];i++){
                int next=adj[cur.inter][i];
                int c=cap[cur.inter][next];
                if(c>0&&pred[next]==0){
                    pred[next]=cur.inter;
                    nd.rate=min(c,cur.rate);
                    nd.inter=next;
                    q.push(nd);
                }
            }
        }
        if(!maxflow)break;
        // backtracking to adjust flow for each edge in the found path.
        i=end;
        while(i!=start){
            j=pred[i];
            cap[i][j]+=maxflow;
            cap[j][i]-=maxflow;
            i=j;
        }
        ans+=maxflow;
    }
    out<<ans<<endl;
    return 0;
}
