// pretty sure this is correct but might be too slow

#include<stdio.h>
#include<string.h>
#include<algorithm>
#include<vector>
using namespace std;
inline int abs(int x){ return x < 0 ?-x:x; }
inline int dist(int x, int y, int x1, int y1, int x2, int y2){

    if (y1==y2){
        // hori line
    if (x1 > x2){ int t = x1; x1 = x2; x2 = t; }
        if (x1 <= x && x <= x2) return abs(y-y1);
        if (x > x2) return abs(x-x2)+abs(y-y1);
         return abs(x-x1)+abs(y-y1);
    }

    if (y1 > y2){ int t = y1; y1 = y2; y2 = t; }
        if (y1 <= y && y <= y2) return abs(x-x1);
        if (y > y2) return abs(x-x2)+abs(y-y2);
         return abs(x-x1)+abs(y-y1);
}

inline int dist(int x1, int y1, int x2, int y2, int x3, int y3, int x4,int y4){
   
   
   if (x1==x2){
        
        if (y1 > y2){ int t = y1; y1 = y2; y2 = t; }
        if (x3==x4){
            // second line vert

            if (y3 > y4){ int t = y3; y3 = y4; y4 = t; }
            int total = abs(x3-x1);

            if ( y4 < y1) return total + y1-y4;
            if (y3 > y2) return total + y3-y2;
            return total;
        }
        
        if (x3 > x4){ int t = x3; x3 = x4; x4 = t; }

        //second line hori
        int total = 0;
        if (x4<x1) total = x1-x4;
        if (x3 > x1) total = x3-x1;

        if (y4 < y1) return total + y1-y4;
        if (y4 > y2) return total + y4-y2;
        return total;
    }
    if (y3==y4){
        // second line hori ?
        return dist(y1,x1,y2,x2,y3,x3,y4,x4);
    }
    // first hori, second vert
    return dist(x3,y3,x4,y4, x1,y1,x2,y2);
}

int D; int nroute;
struct node{int idx;int dist, cost;};
vector<node> q;
struct pt{int x,y;};
pt pts[102][55];
int numpts[102];
int smdist[102]; // smallest dist encountered for route
int rdist[102][102]; // dist between route
int edist[102]; // dist btw end and route
int sdist[102]; // dist btw start and route
int ex, ey;
int rcost[102]; // cost of route
int sx, sy;
class comp{
public:bool operator()(const node&a,const node&b)const{
    return a.cost > b.cost;
}
};comp comp;
void doit(){
    node cur ; int solved =0;
    while (q.size()){
        cur = q.front();
        pop_heap(q.begin(),q.end(),comp);q.pop_back();
        if (edist[ cur.idx] + cur.dist <= D){solved=1;break;}
        
        int i,j;
        for (i=0;i < nroute;i++){
            int dd = rdist[i][cur.idx];
            int newd = dd+cur.dist;
            if (newd >= smdist[i]||newd > D) continue;
            smdist[i] = newd;
            node nn; nn.idx=i; nn.dist=dd+cur.dist; nn.cost=cur.cost+
                rcost[i];
            q.push_back(nn);
        }
    }
    if (solved)printf("%d\n",cur.cost);
    else printf("-1\n");
}

int main(){
    scanf("%d", &D);
    scanf("%d%d%d%d", &sx, &sy, &ex, &ey);
    scanf("%d",&nroute);
    int i,j;
    for (i=0;i < nroute;i++){
        scanf("%d%d", &numpts[i], &rcost[i]);
        int dd = 0x7fffffff;
        int edd = 0x7fffffff;
        for (j=0;j < numpts[i];j++){int a,b;
            scanf("%d%d", &a, &b);
            pts[i][j].x = a; pts[i][j].y=b;
            if (j){
                int cdd = dist(sx,sy,pts[i][j-1].x,pts[i][j-1].y,a,b);
                if (cdd < dd) dd=cdd;
                int ecdd = dist(ex,ey,pts[i][j-1].x,pts[i][j-1].y,a,b);
                if (ecdd < edd) edd=ecdd;
            }
        }
        sdist[i]=dd;edist[i]=edd;
    }
    for (i=0; i < nroute; i++){
        for (j=i+1; j < nroute;j++){
            int dd = 0x7fffffff;
            int p,q;
            for (p=1;p<numpts[i];p++){
                for (q=1;q<numpts[j];q++){
                    int curd = dist(pts[i][p-1].x, pts[i][p-1].y,
                                    pts[i][p].x, pts[i][p].y,
                                    pts[j][q-1].x, pts[j][q-1].y,
                                    pts[j][q].x, pts[j][q].y);
                    if (curd < dd) { dd=curd; if (curd==0){p=q= 60; break;} }
                }
            }
            rdist[i][j] = dd; rdist[j][i]=dd;
        }
        if (sdist[i] <=D){
            node nn; nn.idx=i; nn.cost = rcost[i];
            nn.dist = sdist[i]; smdist[i] = nn.dist;
            q.push_back(nn);
        }else smdist[i]=0x7fffffff;
    }
    make_heap(q.begin(),q.end(),comp);
    doit();
}

