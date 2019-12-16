/*
user: tbhtan31
LANG: C++
TASK: butter
*/
/**
 * Perform Dijkstra for each cow's pasture. Then for pasture, calculate the
 * total distance and output the shortest.
 */
#include<iostream>
#include<fstream>
#include<cstring>
#include<cstdlib>
#include<queue>
#include<vector>
using namespace std;

struct node{int src,idx,dist;};

class comp{
public:bool operator()(const node&a, const node&b) const{
    return a.dist>b.dist;
}
};

char visited[900];
int cowp[900]; // cowp[i] = pasture number of cow i
int dist[900][900]; // dist matrix
int adj[900][900];
int adjsize[900];
int N,P,C;

void calc(int cow){
    priority_queue<node,vector<node>,comp> q;
    node first;
    first.idx=first.src=cowp[cow];
    first.dist=0;
    q.push(first);
    memset(visited,0,sizeof visited);
    int numvisited=0;
    while(numvisited<P){
        node cur = q.top(); q.pop();
        if(visited[cur.idx])continue;
        numvisited++;
        visited[cur.idx]=1;
        dist[first.src][cur.idx]=dist[cur.idx][first.src]=cur.dist;
        int i,j;
        for(i=0;i<adjsize[cur.idx];i++){
            int next=adj[cur.idx][i];
            if(visited[next])continue;
            int d=dist[cur.idx][next];
            node n;n.src=cur.idx;n.idx=next;n.dist=cur.dist+d;
            q.push(n);
        }
    }
}

int main(){
    ifstream in("butter.in");
    ofstream out("butter.out");
    int i,j;
    in>>N>>P>>C;
    for (i=0;i<N;i++){
        in>>cowp[i];
    }
    for(i=0;i<C;i++){
        int a,b,c;
        in >> a >>b>>c;
        adj[a][adjsize[a]++]=b;
        adj[b][adjsize[b]++]=a;
        dist[a][b]=dist[b][a]=c;
    }
    for(i=0;i<N;i++)
        calc(i);
    int ans=1<<30;
    for(j=1;j<=P;j++){
        int total=0;
        for(i=0;i<N;i++){
            total+=dist[cowp[i]][j];
        }
        ans=min(ans,total);
    }
    out<<ans<<endl;
    out.flush();out.close();
    return 0;
}
