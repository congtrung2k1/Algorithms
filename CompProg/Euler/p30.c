#include <stdio.h>

#define s(n) (n*n*n*n*n)

void main()
{
	int i;
	int sum = 0;
	for (i = 1000; i <= 999999;i++)
	{
		int d0 = i % 10;
		int d1 = (i/10) % 10;
		int d2 = (i/100) % 10;
		int d3 = (i/1000) % 10;
		int d4 = (i/10000) % 10;
		int d5 = (i/100000)%10;
		if (i == s(d0) + s(d1) + s(d2)+s(d3) +s(d4)+s(d5))
			sum+=i;
	}

	printf("%d\n", sum);
}
