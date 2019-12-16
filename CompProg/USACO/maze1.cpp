/*
user: tbhtan31
LANG: C++
TASK: maze1
*/
/**
 * Solved using breadth-first search from the 2 exits. The tricky part is to
 * parse and interpret the maze.
 */
#include<iostream>
#include<fstream>
#include<cstring>
#include<cstdlib>
#include<queue>
using namespace std;

struct pos{int r,c,steps;};
char grid[301][301];
int W,H,rows,cols;
int dc[]={0,1,0,-1},dr[]={-1,0,1,0};
queue<pos> q;
char visited[300][300];
int steps[300][300];
int ans=0;

void find(int r,int c){
    memset(visited,0,sizeof visited);
    pos p; p.r=r; p.c=c; p.steps=1;q.push(p);
    visited[r][c]=1;
    while(q.size()){
        p = q.front(); q.pop();
        int &s=steps[p.r][p.c];
        if(s==0)s=p.steps;
        else ans=max(ans,min(s,p.steps));
        int i,j;
        for(i=0;i<4;i++){
            int newr=p.r+dr[i]; int newc = p.c+dc[i];
            if (0<=newr&&newr<H && 0<=newc&&newc<W&&!grid[newr*2+1-dr[i]][newc*2+1-dc[i]]
                &&!visited[newr][newc])
            {
                pos p2;p2.steps=p.steps+1; p2.r=newr;p2.c=newc;q.push(p2);
                visited[p2.r][p2.c]=1;
            }
        }
    }
}

int main(){
    ifstream in("maze1.in");
    ofstream out("maze1.out");
    char line[300];
    int i,j,er[2],ec[2],exitidx=0;
    in>>W>>H;
    rows=2*H+1; cols=W*2+1;
    in.getline(line, 300);
    for (i=0;i<rows;i++){
        in.getline(line,sizeof line);
        for (j=0;j<cols;j++){
            char ch=line[j];
            grid[i][j] = ch!=' ';
            if(ch==' '&&(i==rows-1||j==cols-1||i==0||j==0))
            {
                if(j==cols-1){er[exitidx]=(i-1)/2;ec[exitidx++]=(j-2)/2;}
                if(i==rows-1){er[exitidx]=(i-2)/2;ec[exitidx++]=(j-1)/2;}
                if(j==0){er[exitidx]=(i-1)/2;ec[exitidx++]=0;}
                if(i==0){er[exitidx]=0;ec[exitidx++]=(j-1)/2;}
            }
        }
    }
    find(er[0],ec[0]);find(er[1],ec[1]);
    out<<ans<<endl;
    out.flush();out.close();
    return 0;
}
