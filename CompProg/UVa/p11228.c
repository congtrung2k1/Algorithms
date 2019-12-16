/**
Algorithm:
Kruskal + Union find

Gotchas:
- No. of states is no. of railroads + 1
*/
#include<string.h>
#include<stdio.h>
#include<math.h>
#include<vector>
#include<algorithm>

// rank of node i
int r [1002];

using namespace std;

int find(int i){
    if (r[i] <0) return i;
    return r[i] = find(r[i]);
}

bool uni(int a, int b)
{
    int a1 = find(a);
    int b1 = find(b);
    if (a1==b1) return false;

    if (r[a1] < r[b1]){ r[b1] = a1;  }
    else if (r[a1]>r[b1]){r[a1]=b1; }
    else {r[a1] = b1; r[b1]--;}
    return true;
}

#define cls(p) memset(p,0,sizeof(p))
int x[1002];
int y[1002];

typedef long long ll;
struct edge { int a, b; ll sqr;};
ll limit2;
 vector<edge> list1;
int n; int cc=1;
int st[1002];

inline ll abs(ll a){ return a < 0 ? -a : a; }

class comp {
    public:bool operator ()(const edge&a,const edge&b) const {
        return a.sqr > b.sqr;}
};
void doit()
{
    
    int i,j; int num = 0;
    for (i=0; i < n;i++){
         for (j = i+1; j < n; j ++){
                ll dx = abs( x[i] - x[j]);
                ll dy = abs(y[i] - y[j]);
                edge s; s.a = i; s.b = j; s.sqr = dx*dx+dy*dy;
                list1.push_back(s);   
            
         }
        r[i] = -1;
    }
    comp comp;
    make_heap(list1.begin(), list1.end(),comp);
   double rail = 0; double road = 0;
    int conn = n;num++;
    while (conn >1){
        edge e = list1.front();
        pop_heap(list1.begin(), list1.end(),comp); list1.pop_back();
        if (uni( e.a, e.b))
        {conn--;
            if (e.sqr > limit2){
               rail +=  sqrt(e.sqr) ; num++;
            }   
            else road += sqrt(e.sqr);
        }
    }
    printf("Case #%d: %d %lld %lld\n", cc++,num,(ll)(road+.5),(ll)(rail+.5) );
}


int main(){

    int nu;scanf ("%d", &nu);
    while (nu--){ int r;
        scanf ("%d %d", & n , & r); limit2 = (ll)r * r;
        int i,j;
        for (i=0;i<n;i++){
            scanf ("%d%d", &x[i] , &y[i]);
        }
        cls(st); list1.clear();
        doit();
    }
}


