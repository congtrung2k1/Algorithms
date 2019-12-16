/**
Algorithm:
Kruskal with union find

Find the MST normally first. 
To find second MST, exclude each edge in the first MST one by one 
(while using the other N-2 edges), and then search for an MST.
The MST with the lowest cost will be the second best MST.
The theory is that both MST's must differ by exactly one edge, either with
the same or different cost. 
*/
#include<string.h>
#include<algorithm>
#include<vector>
#include<stdio.h>

int r[102];

int find(int n){
    if (r[n]<0) return n;
    return r[n] = find(r[n]);
}

// true if union ok
bool uni(int a,int b){
    int x = find(a);
    int y = find(b);
    if (x==y)return false;
    if (r[x] < r[y]){ r[y] = x; }
    else if(r[x] > r[y]){ r[x] = y; }
    else {r[x]=y; r[y]--;}
    return true;
}

using namespace std;
struct edge{int a,b,dist;};
vector<edge> q;
vector<edge> q2;
class comp{
public:bool operator()(const edge&a, const edge&b) const {
return a.dist > b.dist;}
};comp comp; int n;

bool operator!=(const edge &a, const edge &b){
    return a.a != b.a || a.b != b.b || a.dist != b.dist;
}

int doit(vector<edge>& q,const edge &forbid){
    int conn = n;
    int cost = 0;
    while (q.size() && conn > 1){
        edge e = q.front();
        pop_heap(q.begin(),q.end(),comp);q.pop_back();
        if  ( forbid != e && uni( e.a, e.b)){
            conn--; cost += e.dist;     
        }
    }
    return conn==1 ?  cost : -1;
}
int doit(vector<edge>& q,vector<edge> &used){
    int conn = n;
    int cost = 0;
    while (q.size() && conn > 1){
        edge e = q.front();
        pop_heap(q.begin(),q.end(),comp);q.pop_back();
        if  ( uni( e.a, e.b)){
            conn--; cost += e.dist;     
            used.push_back(e);
        }
    }
    return  cost;
}

int main(){
    int nu;scanf ("%d",&nu);
    while(nu--){
        int m;scanf("%d%d", &n,&m);
        memset( r,-1,sizeof(r));
        int i,j; q.clear(); q2.clear();
        for (i=0;i <m ;i++){
            int a,b,d;
            scanf("%d%d%d", &a,&b,&d);
            edge e; e.a=a; e.b=b; e.dist = d;
            q2.push_back(e);
        }
        make_heap(q2.begin(),q2.end(),comp);    
        q=q2;
        vector<edge> used;
        // find MST normally
       int s1 = doit(q,used);

        int s2 = 0x7fffffff;
        // Now exclude each edge in the MST one by one
        for (int i = used.size()-1; i>=0;i--){
            q = q2;
            memset( r,-1,sizeof(r));
             int c  = doit(q,  used[i]);
             if (c >=0&& c < s2) s2 = c;
        }
        if ( s2 == 0x7fffffff) s2=s1;
        printf("%d %d\n",s1,s2);
    }
}

