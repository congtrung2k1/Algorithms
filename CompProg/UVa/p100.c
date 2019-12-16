/**
* Algortihm: 
* Straightforward + caching
*
* Gotchas:
* - Not sure if the code will timeout if caching is not used.
*
*/
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

unsigned int count[40000000]; // the cache

unsigned int countit(unsigned int n)
{
    unsigned int original = n;
    unsigned int c = 1;
    while (n != 1)
    {
        if (n < sizeof(count)/4 && count[n]) return count[original]=c+count[n]-1;
        if (n%2) n = 3*n+1;
        else n >>= 1;
        c++;
    }
    
    return count[original] = c;
}
int main()
{
    unsigned int i,j;
    memset(count,0,sizeof(count));
int first = 1;
    while (1)
    {
        if (2!=scanf("%u%u",&i,&j)) break;
	if (j+i ==0) break;
	unsigned int i1 = i, j1=j;  
      unsigned int k;
        unsigned int m = 0;
	if (i>j){i^=j;j^=i;i^=j;}
        for (k=i; k <=j;k++)
        {
	
            unsigned int p =  countit(k) ;
            if (p>m)m=p;
        }
        
        printf("%u %u %u\n",i1,j1,m);
    }
return 0;
}
