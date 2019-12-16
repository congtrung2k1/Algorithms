#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int d[100000]={0};


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

    d[k]=s;
    if (s < k && d[s] == k && d[k] == s) return 1;
    return 0;
}

int main()
{
    int sum = 0;
    int i = 0;

    for (i = 1; i < 10000;i++)
    {
        if (sumd(i)) sum+=i+d[i];
    }

    printf("%d\n",sum);

    return 0;
}

