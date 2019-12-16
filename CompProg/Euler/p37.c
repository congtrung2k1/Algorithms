#include <stdio.h>
#include <string.h>
char isprime[1000000];
int primes[1000000];


int is(int n)
{
	int orig = n;
	while (1)
	{
		n/=10;
		if (n==0) break;
		if ( !isprime[n]) return 0;
	}
	n = orig;
	int m = 1;
	while (m < n )
	{

		m*=10;
		if (! isprime[n % m])return 0;
	}

	return 1;
}

void main()
{
	memset(isprime,1,sizeof isprime);
	int idx = 0;
	int i,j,k;

	for (i = 2; i < sizeof isprime; i++)
	{
		if (!isprime[i]) continue;
		primes[idx++]=i;
		for (j = i*i; j < sizeof isprime; j+=i)
			isprime[j]=0;
	}	

	isprime[0] = isprime[1] = 0;

	int found = 0;
	int sum = 0;
	for ( i = idx - 1; i >= 0; i--)
	{
		int p = primes[i];
		if (is (p))
		{
			printf("%d\n",p);
			sum+=p;
			found++;
			if (found == 11) break;
		}
	}

	printf("sum=%d\n",sum);
}

