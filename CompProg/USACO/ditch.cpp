/*
LANG: C++
TASK: ditch
*/
/**
 * The tricky part is that an edge can be present twice in the input!
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
int adj[210][210];
int adjsize[210];
int cap[210][210];
int pred[210];
int N,M;

int main(){
    ifstream in("ditch.in");
    ofstream out("ditch.out");
    int i,j;
    in>>N>>M;
    for(i=0;i<N;i++){
        int a,b,c;
        in>>a>>b>>c;
        // change to undirected.
        adj[a][adjsize[a]++]=b;
        adj[b][adjsize[b]++]=a;
        cap[a][b]+=c; // must be += , not = !!!
        cap[b][a]+=c;
    }
    int ans=0,maxflow;
    while(1){
        memset(pred,0,sizeof pred);
        pred[1]=1;
        node nd; nd.rate=1<<30; nd.inter=1;
        queue<node> q;
        q.push(nd);
        maxflow=0;
        // BFS to find a path to the sink M.
        while(q.size()){
            node cur=q.front(); q.pop();
            if(cur.inter==M){
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
        i=M;
        while(i>1){
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
