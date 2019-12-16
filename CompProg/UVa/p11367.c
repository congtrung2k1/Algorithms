/**
 * Algorithm:
 * Dijkstra's. Each state is <s, f> where s is the index of the city and
 * f is the amount of fuel left.
 * From a state <s, f>, we can transit to <s, f+1> if f+1 <= c with an 
 * extra cost of p[s] or transit to <s, f-dist[s][i]> where i is a
 * neighbor of s, without any extra cost.
 *
 */

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<vector>
#include<algorithm>

struct node{
    int cost; 
    int idx; // idx of cur node
    int fuelLeft;
};

int adj[1001][1001]; 
char dist[1001][1001]; // dist for edge i,j
int nei [1001];
int p[1001]; // prices
char visited[1001][102];
using namespace std;

class comp{
// min heap comparator
public: bool operator()(const node&a, const node&b)const{
    return a.cost > b.cost;
}
};
comp comp;
    vector<node> q;
int find(int s, int e, int c)
{
    q.clear();
    node start;
    start.cost = 0;
    start.fuelLeft = 0;
    start.idx = s;
    q.push_back(start);
    while (q.size()){
        node cur = q.front(); 
        pop_heap(q.begin(),q.end(), comp); q.pop_back();
           if (visited[cur.idx][cur.fuelLeft]) continue;
            visited[cur.idx][cur.fuelLeft]=1;
        int cnt = nei[cur.idx];
        if (cur.idx == e) return cur.cost;
        for (int i = 0; i < cnt ;i ++){
            int nxt = adj[cur.idx][i];
            int d = dist[cur.idx][nxt];
            if (cur.fuelLeft >= d){
                node nw = cur;
                nw.fuelLeft -= d;
                nw.idx = nxt;
                q.push_back(nw);
                push_heap(q.begin(), q.end(), comp);
            }
        }
        node nw = cur;
        if (nw.fuelLeft < c){
            nw.fuelLeft++;
            nw.cost += p[cur.idx];
            
                q.push_back(nw);
                push_heap(q.begin(), q.end(), comp);
        }
    }
    return -1;
}



int main(){
    int n,m;
    scanf ("%d%d",&n,&m);
    for (int i = 0; i < n;i++) scanf("%d", &p[i]);
    for (int i = 0; i < m;i++){ int a,d,b;
        scanf("%d%d%d", &a, &b, &d);
        adj[a][nei[a]++] = b;
        adj[b][nei[b]++] = a;
       dist[a][b] = dist[b][a] = d;
    }
   int q;
   scanf("%d", &q);
   for (int i =0; i < q;i++){
        int  c,s,e;
        scanf("%d%d%d", &c,&s,&e);
    int cost = find(s,e,c);
    memset(visited,0,sizeof visited);
     if (cost <0)printf("impossible\n");
     else printf("%d\n", cost);
   }return 0;
}
