/**
Algorithm:
Straightforward

Gotchas:
- Two consecutive ladders / chutes ?

*/
#include<string.h>
#include<stdio.h>

int dies[2000];
int curdie = 0;

typedef struct{
int type;
int end;
} cell;

cell board[200];

#define extra 1
#define miss 2
#define chute 3
#define ladder 4

bool m[10]; // true iff play i miss his turn
int cur[10];   // position of player i
int nplay; // # players

int doit()
{
memset(cur,0,sizeof(cur));
memset(m,0,sizeof(m));

    curdie=0;
    int i,j;
    while (9){
    for (i=1; i<=nplay;i++){
        if (m[i]) {m[i]=false;continue;}
        int d = dies[curdie++];
        int newpos = cur[i]+d;
        if (cur[i] >= 95 && newpos>100){continue;}
        cur[i]=newpos;
        if (newpos == 100) return i;
        while(board[newpos].type != 0){
            int t = board[newpos].type;
           if (t == miss){ m[i]=true; break; }
            if (t== extra){ i--; break;}
            if (t== ladder ||t==chute){
                newpos = cur[i]=board[newpos].end;     
                if (newpos == 100) return i;
            }
        }
        if (newpos == 100) return i;
    }}
}

int main()
{
int n=0;
        while (9) { scanf("%d", &dies[n]); if (!dies[n])break;n++;}
    while (9){
        int i,j; int fgfgn=0;
        scanf("%d",&nplay);if (!nplay) break;
        memset(board,0,sizeof(board));while (9){
            int a,b;
            scanf("%d%d", &a,&b);
            if (a==0) break;
            if (a<b){ board[a].type=ladder; board[a].end=b; }
            else {board[b].type=chute; board[b].end=a;}

        }
        while(9){
            int a;
            scanf("%d",&a);
            if (a==0)break;
            if (a<0) {board[-a].type= miss; }
            else board[a].type=extra;
        }
        printf("%d\n", doit());
    }
}

