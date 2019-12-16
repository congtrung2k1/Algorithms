/*
LANG: C++
TASK: camelot
*/
/**
 * First use breadth-first search to compute the knight distance from each
 * cell to every other cell.
 * There are 3 possible situations:
 * 1) knights and king move separately to target cell.
 * 2) King moves to the nearest knight and all knights to target cell.
 * 3) King does not move and one of the knights move to the king to pick him,
 *    and all knights move to target cell.
 * Try every possible target cell and compute distance for above situations.
 */
#include<iostream>
#include<fstream>
#include<cstring>
#include<queue>
using namespace std;

struct pos{int r,c;};
struct step{int steps,r,c;};
queue<step> q;
int kdist[31][31][31][31];
int R,C;
vector<pos> knights;

void init(int r, int c){
    step first; first.r=r; first.c=c; first.steps=0;
    q.push(first);
    while(q.size()){
        step cur=q.front(); q.pop();
        #define gen(r1,c1) if(0<=(r1)&&(r1)<R&&0<=(c1)&&(c1)<C&&0>kdist[r][c][r1][c1]) \
            {step p;p.r=r1;p.c=c1;p.steps=kdist[r][c][r1][c1]=cur.steps+1;q.push(p);}
        gen(cur.r-2,cur.c+1);
        gen(cur.r-1,cur.c+2);
        gen(cur.r+1,cur.c+2);
        gen(cur.r+2,cur.c+1);
        gen(cur.r-2,cur.c-1);
        gen(cur.r-1,cur.c-2);
        gen(cur.r+1,cur.c-2);
        gen(cur.r+2,cur.c-1);
    }
    kdist[r][c][r][c]=0;
}

int calcking(int r, int c, int r1, int c1){
    return max(abs(r-r1),abs(c-c1));
}

int main(){
    ifstream in("camelot.in");
    ofstream out("camelot.out");
    in>>R>>C;
    int i,j,k;
    for(i=0;i<R;i++)
        for(j=0;j<C;j++){
            for(int i2=0;i2<R;i2++)
                for(int j2=0;j2<C;j2++)
                    kdist[i][j][i2][j2]=-1;
            init(i,j);
        }
    char ch;
    int nearestidx,nearestdist=1<<30;
    while(in>>ch>>j){
        pos p; p.r = j-1; p.c=ch-'A';
        knights.push_back(p);
        if(knights.size()>1){
            pos&king=knights[0];
            int d=calcking(king.r,king.c,p.r,p.c);
            if(d<nearestdist){
                nearestdist=d;
                nearestidx=knights.size()-1;
            }
        }
    }
    if(knights.size()==1){
        out<<0<<endl;
        return 0;
    }
    pos&king=knights[0];
    pos&nearest=knights[nearestidx];
    int ans=1<<30;
    for(i=0;i<R;i++){
        for(j=0;j<C;j++){
            int m1 = 0;
            for(k=1;k<knights.size();k++){
                pos&p=knights[k];
                int a=kdist[p.r][p.c][i][j];
                if(a<0){m1=-1;break;}
                m1+=a;
            }
            if(m1<0)continue;
            for(k=1;k<knights.size();k++){
                pos&p=knights[k];
                int m2=m1-kdist[p.r][p.c][i][j];
                int a = kdist[p.r][p.c][king.r][king.c];
                int b = kdist[king.r][king.c][i][j];
                if(a<0||b<0){continue;}
                ans=min(ans,m2+a+b);
            }
            int m3 = m1+nearestdist;
            m1+=calcking(king.r,king.c,i,j);
            ans=min(ans,min(m3,m1));
        }
    }
    out<<ans<<endl;
}


