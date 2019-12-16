/**
Algorithm:
Kruskal and Union find

Theory:
This is essentially printing all the unused heaviest edges.

*/
#include<stdio.h>
#include<string.h>
#include<vector>
#include<algorithm>
using namespace std;
struct edge{
    int a,  b; int w;
};

class comp{
    public:bool operator ()(const edge &a, const edge &b) const { 
        return a.w > b.w;}
};

int n;
vector<edge> edges;
int r[1002];

int find (int i){
    if (r [i] < 0 ) return i;
    return r[i] = find (r[i]);
}

bool uni( int a, int b){
     int a1 = find (a);
      int b1 = find (b);
      if (a1==b1) return false;
        if (r[a1] < r[b1] ){ r[b1] = a1; }
        else if (r[a1 ]>r[b1]){ r[a1] = b1;}
        else {r[a1]= b1; r[b1]--;}
      return true;
}
int all[30000];

void doit()
{
    int idx = 0;
    int i,j; comp comp;
    make_heap( edges.begin(),edges.end(),comp);
    memset ( r, -1,sizeof(r));
    while (edges.size()){
        edge e= edges.front();
        pop_heap(edges.begin(),edges.end(),comp); edges.pop_back();
        if (uni( e.a, e.b)){
        }else all[idx++] =  e.w;
    }
    int f = 0;
    for ( i = 0; i < idx;  i++){
        if (f) printf(" ");
        f = 1;
        printf("%d", all[i]);
    }
    if (!idx) printf ("forest");
    printf ("\n");
}

int main(){
    while (99){ int m;
        scanf ("%d%d", & n, &m );
        if (m+n==0) break;
        int i,j;edges.clear();
        for (i = 0; i < m;i++){
         edge e;
            scanf ("%d %d%d", &e.a, &e. b, &e.w);
            edges.push_back (e);
        }
        doit();
    }
}

