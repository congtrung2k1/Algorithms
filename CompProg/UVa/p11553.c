/*
Algorithm:
Basically find the numbers in each column that sum up to the least.
These numbers must come from different rows as well.

This is because no matter which row Alice plays, Bob always can
pick one of those numbers.
*/
#include<stdlib.h>
#include<string.h>
#include<stdio.h>

int board[20][20];
int n;
char row[20];
int min;

void play(int c, int s)
{
    if (c==n){ if (s<min){min=s;}return; }

    int i,j;
    for (i=0;i<n;i++){
        if (row[i]) continue;
        row[i]=1;
        play(c+1, s+board[i][c]);
        row[i]=0;
    }
}

int main()
{
    int nu;
        scanf("%d",&nu);
    while(nu--){
        scanf("%d", &n);
        int i,j;

        for(i=0;i<n;i++){
            for (j=0;j < n;j++){
                scanf("%d", &board[i][j]);
            }
        }

        min = 0x7fffffff;
        memset(row,0,sizeof(row));
        play(0,0);
        printf("%d\n",min);
    }
}
