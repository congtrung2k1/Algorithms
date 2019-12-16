/**
Algorithm:
Dijkstra's

*/
#include<stdio.h>
#include<string.h>
#include<algorithm>
#include<vector>

struct node{int dist, cur;};
using namespace std;
class comp {
public:bool operator()(const node&a,const node&b)const{
    return a.dist>b.dist;
}
};
comp comp;
int f[6][102]; // f[i] is list of floors visited by elev i, terminated by -1
int adj[502][502];
int nei[502];
int tar;
int n;
int time[6];
vector<node> q;
char visited[502];
inline int abs(int x){return x <0?-x:x;}
void doit()
{
    q.clear();
    node np; np.dist=0;
    for (int i=0;i<n;i++){np.cur=i*100; q.push_back(np); }
    node cur;int solved=0;
    while(q.size()){
        cur= q.front(); 
        pop_heap(q.begin(), q.end(),comp); q.pop_back();
        if (cur.cur%100 == tar){solved=1;break;}
        if (visited[cur.cur]) continue;
        visited[cur.cur]=1;
        int cnt = nei[cur.cur];
        for (int i = 0; i < cnt; i++){
            int nxt =  adj[cur.cur][i];
            int nxte = nxt/100;
            int cure = cur.cur/100;node nn;
             nn.cur = nxt;
            if (nxte!=cure){nn.dist =60; }
            else nn.dist =abs(nxt-cur.cur)* time[cure];
            nn.dist += cur.dist;
            q.push_back(nn);  push_heap(q.begin(),q.end(),comp);
        }
    }
    if (solved)printf("%d\n",cur.dist);
    else printf("IMPOSSIBLE\n");
}
char s[9999];
int main(){
    while(9){
         int kk = scanf("%d%d", &n,&tar);if (kk!=2)break;
        int i,j;
        for (i=0;i < n;i++){
            scanf("%d", &time[i]);
        }gets(s);
        for (i=0;i < n;i++){
            gets(s);
            char * tok = strtok(s," \n"); int p=0;
            while (tok){
                f[i][p++] = atoi(tok);
                tok = strtok(0," \n");
            }
            f[i][p]=-1;
        }memset(visited,0,sizeof(visited));
        memset(nei,0,sizeof(nei));
        for (i=0; i<n;i++){
            // add edges amongst the elev i's floors
            for (j = 0; f[i][j] >= 0; j++){
                for (int k = j+1;  f[i][k]>=0;k++){
                    int a = i*100+f[i][j]; int b = i*100+f[i][k];
                    adj[a][nei[a]++] = b;
                    adj[b][nei[b]++] = a;
                }
            }
            // add edges between elevs' common floors
            for (j=i+1; j < n;j++){
                int a = 0;
                int b = 0;
                while (f[i][a] >=0 && f[j][b] >= 0){
                    if (f[i][a] < f[j][b]) a++;
                    else if (f[i][a] > f[j][b])b++;
                    else {
                        int p = i*100+f[i][a];
                        int q = j*100+f[j][b];
                        adj[p][nei[p]++]=q;
                        adj[q][nei[q]++]=p;a++;b++;
                    }
                }
            }
        }
        doit();
    }

}
