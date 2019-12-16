#include <stdio.h>

long long fact[1000]={0};

long long f(long long n)
{
	long long ff = 1;
	long long norig = n;
	if (fact[n]) return fact[n];
	while (n > 1)
	{
		ff *= n;
		n--;
	}

	fact[norig] = ff;
	return ff;
}

void main()
{
	int i;
	long long sum = 0;
	for (i = 10; i <= 999999; i++)
	{

		int k = i;
		long long s2 = 0;
		while (k > 0 && s2 <= i)
		{
			s2 += f(k%10);
			k/=10;
		}
		if (s2 == i)
		{
			printf("%d\n",i);
			sum += i;
		}
	}
	printf("sum=%ld\n", sum);
}

