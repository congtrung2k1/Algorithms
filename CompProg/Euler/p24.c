#include <stdio.h>

int dup(long long k)
{
    int p[10] = {0};
    while (k > 1)
    {
        int d=k%10;
        if(p[d] ) return 0;
        p[d] = 1;
        k /= 10;
    }
    return 1;
}

void main()
{
    long long i;
    int p = 362880*2;
    for (i = 12013456789; ;i++)
    {

      if(dup(i) )
        {
   //       printf("%lld\n",i);
            p ++;
            if (p == 1000000){printf("%lld\n",i);break;}
        }
    }

}

