#include <stdio.h>
#include <string.h>
#include <stdlib.h>



#define N 15

// f[row index][within row]
int f[1000][1000];


int main(){
    
    int i,j;

    for (i=0;i<N;i++)
    {
        for (j = 0; j <= i;j++)
        {
            scanf("%d",&f[i][j]);
        }
    }



    for (i=1;i<N;i++)
    {
        for (j = 0; j <= i;j++)
        {
            if (j > 0)
            {
                f[i][j] += (f[i-1][j-1] > f[i-1][j]?f[i-1][j-1]:f[i-1][j]);    
            }
            else
            {
                f[i][j] += f[i-1][j];
            }
        }
    }

    int m = -1;

   for (j = 0; j < N; j++)
   {
    if (f[N-1][j] > m)m = f[N-1][j];
   }
   printf("%d\n",m);

    }

