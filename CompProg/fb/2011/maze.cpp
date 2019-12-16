/**
 * Algorithm: BFS
 */

#include<deque>
#include<stdio.h>
#include <iostream>
#include <stdlib.h>
#include<string.h>

using namespace std;

struct rc{ int r,c; };

char maze[200][200];
int r,c;
rc special[10][20000];
int nspecial[10];
int sr, sc;
int er, ec;

struct node{
    int r,c;
    int step;
};

char visited[200][200];

void handle(int step, int r, int c, deque<node>&q){
   char cc = maze[r][c];
   if (cc=='W') return;
        node nxt ;
        nxt.step =step;
        nxt.r = r;
        nxt.c=c;
   { q.push_back(nxt);}
}
int main(){

    int n;
    cin >> n; int casen=1;

    for (int i= 1; i <=n;i++){
        cin >> r >> c;
    
    memset(visited,0,sizeof visited);
    memset(special,0,sizeof special);
    memset(nspecial,0,sizeof nspecial);
        for (int j = 0; j < r;j++){string line;
            cin >> line;
            strcpy(&maze[j][0], line.c_str());

            for (int k = 0;  k <  line.size();k++)
            {
                char c = maze[j][k];
                if (maze[j][k]=='S'){sr = j; sc = k;}
                else if(maze[j][k]=='E'){er = j; ec = k;}
                else if(c!='0' && c!='W'){ rc rc; rc.r=j;rc.c=k;
                        special[c-'0'][ nspecial[c-'0']++]=rc;
                    }
             }
        }
        

        deque<node> q;
        node start;
        start.r = sr;
        start.c = sc;
        start.step=0;
        q.push_back(start);
        while (q.size()){
            node cur = q.front(); q.pop_front();
            if (cur.r ==er && cur.c == ec){
                printf("Case #%d: %d\n", casen++,cur.step);break;
            }
            if (visited[cur.r][cur.c] ) continue;
            visited[cur.r][cur.c] = 1;
            char cc = maze[cur.r][cur.c];
            if (cur.r ) handle(cur.step+1,cur.r-1,cur.c, q);
            if (cur.c)handle(cur.step+1,cur.r, cur.c-1, q);
            if (cur.r < r-1)handle(cur.step+1,cur.r+1, cur.c, q);
            if (cur.c < c-1)handle(cur.step+1,cur.r, cur.c+1,q);

   if ('1' <= cc &&cc <= '9'){ 
    for (int i = 0; i < nspecial[cc-'0'];i++){
        node nxt;
        nxt.step=cur.step+1;
        nxt.r = special[cc-'0'][i].r;
        nxt.c = special[cc-'0'][i].c; q.push_back(nxt);
    }
   }
        }

    }

    

}







