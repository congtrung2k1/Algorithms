/*
LANG: C++
TASK: fence6
*/
/**
 * First build a graph and then use depth-first search to find the
 * minimum sum of edges of all cycles. The trickiest part is building the
 * graph since we are not explicitly told which node connect to which.
 * We treat each segment as having 2 nodes which are shared with neighboring
 * segments.
 */
#include<iostream>
#include<fstream>
#include<cstring>
#include<cstdlib>
using namespace std;

int n;
unsigned char lens[210][210][101];// len between nodes i and j
int adj[210][210]; // no. of edges between nodes i and j
int pts[110][110]; // no. of connections between segs i and j
int conn[110][110][2]; // node used for seg i and j
int nnodes;
int ans=1<<30;
char visited[210][210];
ifstream in("fence6.in");
ofstream out("fence6.out");

void find(int start, int from, int to, int sum){
    int i,j;
    if(from>=0){
        if(visited[from][to]>=adj[from][to]){
            return;
        }
        if(to==start){
            ans=min(ans,sum);
            return;
        }
        visited[from][to]++; visited[to][from]++;
    }
    for(i=0;i<210;i++){
        for(j=0;j<adj[to][i];j++){
            int l=lens[to][i][j];
            if(!l)continue;
            lens[to][i][j]=lens[i][to][j]=0;
            find(start,to,i,sum+l);
            lens[to][i][j]=lens[i][to][j]=l;
        }
    }
    if(from>=0){
        visited[from][to]--; visited[to][from]--;
    }
}

void link(int cur, int len, int counts[2]){
    int i,j,k,tmp[101][2],freq[101]={0},f[2]={-1,-1};
    for(j=0;j<2;j++){
        for(i=0;i<counts[j];i++){
            int seg; in>>seg;
            freq[seg]++;
            tmp[i][j]=seg;
            if(j==1&&pts[seg][cur]==2)f[j]=conn[seg][cur][1];
            else if(pts[seg][cur])f[j]=conn[seg][cur][0];
        }
        if(f[j]<0)f[j]=nnodes++;
    }
    k=adj[f[0]][f[1]]++;adj[f[1]][f[0]]++;
    lens[f[0]][f[1]][k]=lens[f[1]][f[0]][k]=len;
    for(j=0;j<2;j++)
        for(i=0;i<counts[j];i++){
            k=tmp[i][j];
            if(pts[k][cur]==0){
                if(j==1&&freq[k]==2)
                conn[k][cur][1]=conn[cur][k][1]=f[j];
                else
                conn[k][cur][0]=conn[cur][k][0]=f[j];
            }
        }
    for(j=0;j<2;j++)
        for(i=0;i<counts[j];i++){
            k=tmp[i][j];
            if(!pts[k][cur]){
                pts[k][cur]+=freq[k];pts[cur][k]+=freq[k];
            }
        }
}

int main(){
    int i,j,k;
    in>>n;
    for(i=0;i<n;i++){
        int a,b,nn[2];
        in>>a>>b>>nn[0]>>nn[1];
        link(a,b,nn);
    }
    for(i=0;i<nnodes;i++){
        memset(visited,0,sizeof visited);
        find(i,-1,i,0);
    }
    out<<ans<<endl;
    out.flush();out.close();
    return 0;
}
