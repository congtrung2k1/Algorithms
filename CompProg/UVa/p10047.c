/**
Algorithm:
Breadth-first search


*/

#include<string.h>
#include<stdio.h>

// north,  east, south, west
int dx[]= {0,1,0,-1}; // delta X
int dy[]= {-1,0,1,0}; // delta Y

struct cell_t{
    char x,y,dir,color;
    int d;
} ;

int tarx, tary; // target
int sx,sy; // starting
cell_t q[26*26*21];
char visited[26][26][5][6]; //x,y,dir,collor
int M,N;

void doit();
inline void mark(int x, int y){
    int i,j;
    for (i=0; i < 4; i ++){
        for( j = 0; j < 5; j ++){
            visited[x][y][i][j] =1;
        }
    }
}
int main(){ int p=0;
    while (9){
            scanf ("%d%d", &M,&N);
            if (M+N==0)break;
            if (p) printf("\n"); p =1;
            char s[99];
            int i,j;
            
         memset(visited,0,sizeof(visited));
            for (i=0; i<M;i++){
                scanf("%s", s);
                for (j=0; j<N;j++){
                    char c=s[j];
                    if (c=='#') mark(j,i);
                    else if (c=='S'){sx=j; sy=i;}
                    else if (c=='T'){tarx=j;tary=i;}
                }
            }
            doit();
    }
}
int cc=1;
void doit(){
    int qidx=0;
    int qsize=1;
    q[0].x=sx;
    q[0].y=sy;
    q[0].d=0;
    q[0].dir =0;
    q[0].color=0;
    cell_t cur; int solved=0;
    while (qidx<qsize){
        cur = q[qidx];
        if (cur.x == tarx && cur.y == tary && cur.color==0){solved=1;
            break;}
        int ndir = (cur.dir+1)%4;
        int x = cur.x; int y = cur.y;
        if (!visited[x][y][ndir][cur.color]){
            visited[x][y][ndir][cur.color] = 1;
            cell_t k = cur;
            k.dir=ndir; k.d++;
            q[qsize++]=k;
        }
        ndir = (4+cur.dir-1)%4;
        if (!visited[x][y][ndir][cur.color]){
            visited[x][y][ndir][cur.color] = 1;
            cell_t k = cur;
            k.dir=ndir; k.d++;
            q[qsize++]=k;
        }
        int nx = cur.x + dx[cur.dir];
        int ny = cur.y + dy[cur.dir];
        int ncolor = (cur.color+1)%5;
        if ( nx>=0 && ny >=0 && nx<N && ny<M&&
            !visited[nx][ny][cur.dir][ncolor]){
                visited[nx][ny][cur.dir][ncolor] = 1;
                cell_t k = cur; k.color=ncolor; k.d++;
                k.x=nx;k.y=ny;
                q[qsize++]=k;
            }

        qidx++;
    }
    printf("Case #%d\n", cc++);
    if (solved){
        printf("minimum time = %d sec\n", cur.d);
    }else printf("destination not reachable\n");
}



