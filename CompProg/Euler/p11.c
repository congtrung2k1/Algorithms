#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define N 20

int n[N][N];

int prod(int a,int b)
{
    int i,j;
    int m=  0;
    int p =1;

    if (a+4 < N)
    {

    for (i = a; i < a+4;i++)
    {
        p *= n[i][b];
    }
    if (p>m) m =p;

        if (b+4 < N)
        {
            p=1;
            for (i = 0; i<4;i++)
            {
                p*=n[i+a][i+b];
            }
            if (p>m)m=p;
        }


        if (b-4>=0)
        {
            p=1;
            for (i = 0; i<4;i++)
            {
                p*=n[i+a][b-i];
            }
            if (p>m)m=p;
        }

    }

    if (a-4>=0)
    {
p=1;
    for (i = a-4; i < a;i++)
    {
        p *= n[i][b];
    }
    if (p>m)m=p;
    
    
        if (b-4>=0)
        {
            p=1;
            for (i = 0; i<4;i++)
            {
                p*=n[a-i][b-i];
            }
            if (p>m)m=p;
        }
    
        if (b+4 < N)
        {
            p=1;
            for (i = 0; i<4;i++)
            {
                p*=n[a-i][i+b];
            }
            if (p>m)m=p;
        }
    }

    if (b-4 >=0)
    {
      p=1;
        for (i = b-4; i < b;i++)
        {
            p *= n[a][i];
        }
        if (p>m)m=p;
    
    
    
    }

    if (b +4 <N)
    {
        p=1;
        for (i = b; i < b+4; i++)
        {
            p *= n[a][i];
        }
        if (p>m)m=p;
    }



    return m;

}

int main()
{
    int i,j;

    for (i = 0; i < N; i++){
        for (j = 0; j < N; j++)
        {
            int k;
            scanf("%d", &k);
            n[i][j] = k;
        }
    }

    int m = 0;
    for (i  = 0; i < N;i++)
    {
      for (j = 0; j < N;j++)
      {
         int k = prod(i,j);
         if (k>m)m=k;
      }
        
        }
printf("%d\n", m);
return 0;
}

