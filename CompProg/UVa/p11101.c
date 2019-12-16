/**
* Algorithm:
* Breadth first search
*
*
* Do a BFS from the points of perimeter of one mall until you reach
* a point of the other mall.
*/

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<deque>
#define MAX 2001
using namespace std;

struct cell_t{ int r,c,d; };

deque<cell_t> q;

int map[2002][2002/32+1];
char visited[2002][2002];

inline bool get(int r, int c){ return (map[r][c/32] & (1<<(c%32)))>0; }
inline void set(int r, int c){ map[r][c/32] |= (1<<(c%32)); }
void doit(){int solved=0; cell_t cur;
    while (q.size()){
         cur = q.front(); q.pop_front();
        if (get (cur.r, cur.c)){ solved=1;break; }
        if (cur.r > 0 && !visited[cur.r-1][cur.c]){
            cell_t k = cur;
            visited[cur.r-1][cur.c]=1;
            k.r --;k.d++;
            q.push_back(k);
        } if (cur.c > 0 && !visited[cur.r][cur.c-1]){
            cell_t k = cur; k.c --; k.d++;
            visited[cur.r][cur.c-1] = 1;
            q.push_back(k);
        }
        if (cur.c < MAX && !visited[cur.r][cur.c+1])
        {
            cell_t k = cur; k.c++; k.d++; visited[cur.r][cur.c+1]=1;
            q.push_back(k);
        }
        if (cur.r < MAX && !visited[cur.r+1][cur.c])
        {
            cell_t k = cur; k.r++; k.d++; visited[cur.r+1][cur.c]=1;
            q.push_back(k);
        }

    }
    printf("%d\n",cur.d);
        
}
int main(){
    while (8){
        int n;
        int i,j;
        scanf ("%d", &n);
        if (n==0) break;
        q.clear();
        memset(visited,0,sizeof(visited));
        memset(map,0,sizeof(map));
        for (i=0;i < n;i++){ int a,b;
            scanf ("%d%d", & a, &b); 
            set(a,b);
        }
        scanf("%d", &n);
        for (i=0;i<n;i++){
            int a,b;
            scanf("%d%d",&a,&b);cell_t k; k.r = a; k.c=b;k.d=0;
            q.push_back(k);visited[a][b]=1;
        }
        doit();
    }
}



