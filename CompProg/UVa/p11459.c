/*
Algorithm:
Straightforward

Gotchas:
- Don't need to care if it is a ladder or snake ...
  Just need to know the start and end points .
  In other words, be very careful what is meant by tail / mouth of the snake
*/
#include<string.h>
#include<stdio.h>

#define cls(x) memset(x,0,sizeof(x))

char pos[1000010];
char dies[1000010];
int ndie;
int cdie;
int nplay;
int board[101];

void doit()
{
    while (9){
        int i,j;
        for (i=1; i<=nplay;i++){
            if (cdie ==ndie)return;
            int d = dies[cdie++];
            
            int newpos = (int)pos[i] + d;
            if (newpos>100)newpos=100;
            pos[i] = newpos;
            if (newpos==100)return;
            while (board[newpos] >0){
                newpos = board[newpos];
                pos[i] = newpos;
                if (newpos==100)return;
            }
            
        }
    }
}

int main(){
    int nu;
    scanf("%d",&nu);
    while(nu--){
        int k;scanf("%d%d%d", &nplay, &k, &ndie);
        int i,j; cls(board);
        for (i=0;i<k;i++){ int a,b;
            scanf("%d%d", &a, &b);

            // a can be > b or < b but we don't care.
            board[a]=b;

        } for (i=0;i<ndie;i++){ int d;
            scanf("%d", & d); dies[i]=d;
        }
        cdie = 0;
        memset(pos, 1,sizeof(char)*(1+nplay));
        doit();
        for (i=1; i <=nplay;i++){
            printf("Position of player %d is %d.\n", i, (int)pos[i]);
        }
    }
}
