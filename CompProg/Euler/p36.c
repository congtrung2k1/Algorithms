#include <stdio.h>


int is(int n)
{
	int orig = n;
	int k = 0;
	while (n > 0)
	{
		k = 10*k + n%10;
		n/=10;
	}

	if (k != orig) return 0;

	k = 0;
n=orig;
	while (n > 0)
	{
		k = (k<<1) | (n&1);
		n >>= 1;
	}
	return k ==orig; 
}

void main()
{
	int i;
	long long sum=0;
	for (i=1; i < 1000000;i++)
		if (is(i))sum+=i;
	printf("%ld\n", sum);
	}

