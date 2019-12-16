#include <stdio.h>
#include <stdlib.h>

inline int abs(int n)
{
	return n;

/*<0?  -n : n;
*/}


char isprime[3000000]={1};

void main()
{
	memset(isprime, 1, sizeof isprime);
	isprime[0]=0;
	int i,j,a,b,n;

	
	for ( i= 2; i < sizeof(isprime);i++)
	{
		if (!isprime[i]) continue;

		for ( j=i*i; j < sizeof(isprime) ;j+=i)
		{
			isprime[j] = 0;
		}
	}

	int max = 0;
	int maxa=0, maxb=0;
	for ( a = -999; a < 1000;a++)
	{
		for ( b =-999;b < 1000;b++)
		{
			int k = abs(max*(max+a)+b);
			if (k<0||!isprime[k]) continue;
			for ( n= 0; ;n++)
			{
				k = abs(n*n+a*n+b);
				if (k<0||!isprime[k]) break;
			}	
			if (n >max){ max = n; maxa = a; maxb=b;}
		}
	}

	printf("a=%d  b=%d %d\n", maxa, maxb, maxa*maxb);	
}
