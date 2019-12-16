#include <stdio.h>

int update(int mask, int num)
{
	while (num > 0)
	{
		int bit = 1 << (num%10);
		if (mask & bit) return -1;
		mask|=bit;
		num /= 10;
	}

	return mask;
}


void main()
{
	int sum = 0;
	int a , b, i;

	for (i = 1234; i <= 98765;i++)
	{
		int mask = update(1, i);
		if (mask < 0) continue;

		for (a = 1; a <= 9876; a++)
		{
			if (i %a >0) continue;


			int mask1 = update(mask, a);
			if (mask1 < 0) continue;
		
			int mask2 = update(mask1, i/a);
			if (mask2 != 1023) continue;

			sum += i;
			break;			
		}
	}

/*
	for ( a = 1; a <= 31620;a++)
	{
			int mask = update(0, a);
			if (mask < 0) continue;
		
		for (b = 1; b <= 999999999/a+1;b++)
		{
			long long p = a*b;
			if( p >= 9123456 || kk[p]) continue;
			mask = update(mask, b);
			if (mask < 0) continue;
			mask = update(mask, p);
			if (mask < 0) continue;
			kk[p] = 1;
			sum +=p; 
		} 
	}
*/	printf("%d\n",sum);
}

