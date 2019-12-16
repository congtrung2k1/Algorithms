/**
* Algorithm:
* Breadth-first search for shortest path
*
* Gotchas:
* - Input data may lead you out of the maze ? Not sure, but you should guard 
*   against this
* - Tedious programming and plenty of careless opportunities
* - If starting point == ending point, you must still walk through the maze 
*   and not terminate straight away
* - Empty mazes with only the starting point and ending points but nothing else
*   are possible.
*
*/
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <deque>


#define LEFT 1
#define RIGHT 2
#define FORWARD 4

using namespace std;

typedef struct {
    char w;
    char n, s,e;
} cell_t;

typedef struct
{
    int backidx;
    int idx;
    char r,c;
    char to;
} move_t;


char name[1000]; // Name of maze
move_t moves[1000000]; // BFS storage
int nummoves = 0;
cell_t maze[12][12]; // maze data
int gr, gc; // goal row, col
int sr,sc; // starting row, col
char sdir; // starting direction
char myto[256][3]; // direction lookup after turning L,R or F
char rr[1000000]; // for storing solutions
char cc[1000000];
char visited[12][12]['W'+1]; // visited ?

void doit()
{
    deque<move_t*> q;
    char tor = sr, toc=sc;
    if (sdir=='N'){ tor --; }
    else if (sdir == 'W') toc --;
    else if (sdir == 'E') toc++;
    else tor ++;
    moves[0].idx = 0;
    moves[0].r = tor;
    moves[0].c = toc;
    moves[0].to = sdir;
    moves[0].backidx = -1;
    nummoves++;
    q.push_back(&moves[0]);
    move_t *m;
    int solved=0;
    while (q.size())
    {
        m = q.front(); q.pop_front();
        
        if (m ->r == gr && m->c ==gc){solved=1; break;}
        if (visited[m->r][m->c][m->to]) continue;
        visited[m->r][m->c][m->to] = 1;
        
        cell_t *c = &maze[m->r][m->c];
        char dirs;  
        char dl_r, dl_c, dr_r,  dr_c, df_r, df_c;
        if (m->to == 'W') {  dirs = c->w; dl_r = 1;dl_c=0;dr_r=-1;dr_c=0; df_r = 0;df_c = -1;}
        else if (m->to == 'N'){ dirs = c->n; dl_r = 0;dl_c=-1;dr_r=0;dr_c=1; df_r = -1; df_c = 0; }
        else if (m->to == 'E'){ dirs = c->e; dl_r = -1;dl_c=0;dr_r=1;dr_c=0; df_r = 0;df_c = 1;}
        else{ dirs = c->s;dl_r = 0;dl_c=1;dr_r=0;dr_c=-1; df_r = 1; df_c = 0;}
        if (dirs & LEFT){
            int rr1 = moves[nummoves].r = m->r + dl_r;
            
            int cc1 = moves[nummoves].c = m->c + dl_c;
            moves[nummoves].to = myto[m->to][0];
            moves[nummoves].backidx = m->idx;
            moves[nummoves].idx = nummoves;
            if (rr1 >=1 && cc1 >= 1){
                q.push_back(&moves[nummoves]);
                nummoves++;
            }
        }
        if (dirs & RIGHT){
           int rr1 = moves[nummoves].r = m->r + dr_r;
            int cc1 =  moves[nummoves].c = m->c + dr_c;
            moves[nummoves].to = myto[m->to][1];
            moves[nummoves].backidx = m->idx;
            moves[nummoves].idx = nummoves;
             if (rr1 >=1 && cc1 >= 1){
             q.push_back(&moves[nummoves]);
            nummoves++;
            }
        }
        if (dirs & FORWARD){
           int rr1 =  moves[nummoves].r = m->r + df_r;
           int cc1 =  moves[nummoves].c = m->c + df_c;
            moves[nummoves].to = myto[m->to][2];
            moves[nummoves].backidx = m->idx;
            moves[nummoves].idx = nummoves;
              if (rr1 >=1 && cc1 >= 1){
             q.push_back(&moves[nummoves]);
            nummoves++;
            }
        }    
    }
    
    printf("%s", name);
    
    if (!solved){
      printf("\n  No Solution Possible\n");return;
    }

    // backtracking: store the solutions in arrays rr,cc first
    // and then print them in reverse
    int cnt = 0;
    
    do{
        rr[cnt] = m->r;
        cc[cnt] = m->c; cnt++;
        if (!(m->backidx >= 0)) break;
        m = &moves[m->backidx];
    }while (1);
    rr[cnt] = sr; cc[cnt++] = sc;
    int i,j,k;
    for (i= 0; i < cnt; i++){
        if (i%10==0) printf("\n ");
        printf(" (%d,%d)", (int) rr[cnt-1-i], (int)cc[cnt-1-i]);
        
    }
    printf("\n");
}

int main()
{
    myto['W'][0] =  'S'; // left
    myto['W'][1] = 'N'; // right
    myto['W'][2] = 'W'; // forward
    
    myto['N'][0] =  'W'; // left
    myto['N'][1] = 'E'; // right
    myto['N'][2] = 'N'; // forward
    
    myto['E'][0] =  'N'; // left
    myto['E'][1] = 'S'; // right
    myto['E'][2] = 'E'; // forward
    
    myto['S'][0] =  'E'; // left
    myto['S'][1] = 'W'; // right
    myto['S'][2] = 'S'; // forward
    
    while (1)
    {
    	// clear the maze's directions since some input data may not define
	// any of the maze's grid
    	memset(maze,0,sizeof(maze));
        gets(name);
        if (strcmp(name, "END")==0) break;
        char tmp[10];
        scanf("%d%d%s%d%d", &sr, &sc, tmp, &gr,&gc);
        sdir = tmp[0];
        while (1){ int tr,tc;
            scanf("%d", & tr);
            if (tr==0){gets(tmp);break;}
            scanf("%d", &tc);
            
            cell_t *c = &maze[tr][tc];
            while (1){
                scanf("%s", tmp);
                if (tmp[0]=='*')break;
                int ii = 1;int mask=0;
                while (tmp[ii]){
                    if (tmp[ii]=='L')mask|=LEFT;
                    else if (tmp[ii]=='R')mask|=RIGHT;
                    else if (tmp[ii]=='F')mask|=FORWARD;
                    ii++;
                }
                switch(tmp[0]){
                case 'N': c->n = mask; break;
                case 'S': c->s = mask; break;
                case 'E': c->e = mask; break;
                case 'W': c->w = mask; break;
                }
            }
        }
        nummoves= 0;
        memset(visited, 0 ,sizeof(visited));
        /*
        if(sr==gr && sc==gc){
            printf("%s\n  (%d,%d)\n",name,gr,gc);
            
        }
        else */
        doit();
    }
}


