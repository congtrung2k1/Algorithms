/**
* Algorithm:
* Brute force all solutions to the 8x8 board
*
* Then compare the input board to every solution and get the least moves
*
*/
#include<stdio.h>
#include<string.h>
#include<stdlib.h>


int solns[200][9]; // solutions to 8x8
int numsoln;
char row[10];
char d1[20];
char d2[20];
int soln[9];

void find(int c)
{
    if (c==9){
        memcpy(&solns[numsoln][1],  &soln[1], 8*sizeof(int));
        numsoln++;return;
    }

    int i,j;
    for (i=1; i <= 8;i++){
        if ( d1[i+c] || d2[8-i+c] || row[i])continue;

        row[i]=1;
        d2[8-i+c]=1;
        d1[i+c]=1;
        soln[c]=i;
        find(c+1);
        row[i]=0;
        d2[8-i+c]=0;
        d1[i+c]=0;
    }
}
int cc=1;
int main()
    {
    find(1);
    int ss[9];
    while (1)
    {
        int i,j;
        for (i=1;i<=8;i++){
            int k = scanf("%d",&ss[i]);
            if (k!=1) return 0;
        }
        int min = 10000;
        for (i=0;i<numsoln;i++){
            int m=0;
            for (j=1; j <=8;j++){
                if (solns[i][j] != ss[j])
                    m++;
            }
            if (m < min)min=m;
        }
        printf("Case %d: %d\n", cc, min);cc++;
    }
}


