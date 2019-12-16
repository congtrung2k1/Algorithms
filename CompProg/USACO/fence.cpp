/*
LANG: C++
TASK: fence
*/
#include<iostream>
#include<fstream>
#include<cmath>
#include<cstdlib>
#include<vector>
using namespace std;
int F,N,M=9999;
int adj[501][501]; // adj[i][j] == no. of edges between i and j
int adjsize[501]; // deg of i
vector<int> path;

void find(int to){
    int i,j;
    for (i=M;i<=N;i++){
        if(adj[to][i]){
            adj[to][i]--;
            adj[i][to]--;
            find(i);
        }
    }
    path.push_back(to);
}

int main(){
    ifstream in("fence.in");
    ofstream out("fence.out");
    in>>F;
    int i,j;
    for(i=0;i<F;i++){
        int a,b; 
        in>>a>>b;
        N=max(N,max(a,b));
        M=min(M,min(a,b));
        adj[a][b]++;
        adj[b][a]++;
        adjsize[a]++;
        adjsize[b]++;
    }
    int start=999;
    for(i=M;i<=N;i++){
        if(adjsize[i]%2==1)
            start=min(start,i);
    }
    if (start==999)
        start=M;
    find(start);
    for (i=path.size()-1;i>=0;i--)
        out<<path[i]<<endl;
    out.flush();
}