#include <stdio.h>
#include <stdlib.h>
#include <string.h>
char isprime[2000000]={0};

int isc(int n)
{
	int orig = n;
	int multi = 1;

	if (! isprime[n]) return 0;

	while (n > 0)
	{
		n/=10; multi *= 10;
	}
	multi/=10;
	n=orig;
	
	do{
		if (! isprime[n]) return 0;
		
		int d =n%10;
		n = n/10 + d*multi;	
	}while (n!=orig);
	return 1;
}

void main()
{
	int i,j,k;
	memset(isprime, 1, sizeof isprime);

	for (i = 2; i < sizeof(isprime);i++)
	{
		if (! isprime[i]) continue;
		for (j = i*i; j < sizeof(isprime);j+=i)
			isprime[j] = 0;
	}

	k=0;
	for (i = 2; i < 1000000;i++)
	{
		if (isc(i)) k++;
	}	
	printf("%d\n", k);
}


