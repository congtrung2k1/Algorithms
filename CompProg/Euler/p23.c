#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int dd[100000]={0};
int pp[100000]={0};
int numd = 0;

int sumd(int k)
{
    float rt = sqrt(k)+1;
    int irt = (int)rt;
    int i;
    int s = 1;
    for (i=2;i< irt;i++)
    {
        if (k%i==0) 
        {
          s+=i;
          if (i*i !=k)
            s += k/i;
        }
    }

   return s;
}

int main()
{
    int sum = 0;
    int i = 0;

    for (i = 1; i < 30000;i++)
    {
        if (sumd(i)>i) dd[numd++]=i;
    }

    int j;
    for (i = 0;i<numd;i++)
    {
        int ni=dd[i];
        for (j=i;j <numd;j++)
        {
          int nj = dd[j];
            pp[ni+nj] = -1;
        }
    }


    for (i=1;i<=28123;i++)
    {
         sum+=i& (~pp[i]);    
    }

    printf("%d\n",sum);

    return 0;
}

