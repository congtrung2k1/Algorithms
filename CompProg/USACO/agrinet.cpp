/*
user: tbhtan31
LANG: C++
TASK: agrinet
*/
#include<iostream>
#include<fstream>
#include<cstring>
#include<cstdlib>
#include<queue>
#include<cmath>
using namespace std;

struct edge{int weight,dest;};
int dist[151][151];
int N;
char visited[101];

class comp{
    public:bool operator()(const edge&a,const edge&b)const{
        return a.weight>b.weight;
    }
};

priority_queue<edge,vector<edge>,comp> q;

int main(){
    ifstream in("agrinet.in");
    ofstream out("agrinet.out");
    int i,j;
    in>>N;
    for (i=0;i<N;i++){
        for(j=0;j<N;j++){
            in>>dist[i][j];
        }
    }
    for (i=0;i<N;i++){
        edge e;e.weight=dist[i][0];
        if (!e.weight)continue;
        e.dest=i;
        q.push(e);
    }
    visited[0]=1;
    int count=1,ans=0;
    while(count<N){
        edge e=q.top();q.pop();
        if(visited[e.dest]){
            continue;}
        ans+=e.weight;
        visited[e.dest]=1;
        count++;
        for(i=0;i<N;i++){
            edge e2;e2.weight=dist[e.dest][i];
            if(!e2.weight||visited[i])continue;
            e2.dest=i;q.push(e2);
        }
    }
    out<<ans<<endl;
    out.flush();out.close();
    return 0;
}
