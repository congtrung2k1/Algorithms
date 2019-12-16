#include <stdlib.h>
#include <stdio.h>


int numer[100000]={0};

int check(int d)
{
	int idx = 0;
	int n = 1;
	int j = 0;
	while (1)
	{
		if (n < d) n *= 10;
		int r = n%d;
		int q = n/d;

		if (r == 0) break;
		
		for (j= idx-1; j>=0;j--)
			if (numer[j] == n) return idx-j;

		numer[idx] = n;
		n = r;
		idx++;		
	}
	return 0;
}

void main(){
	int d;
	int max = 0;
	int max_d = 0;
	for (d = 2; d <= 999;d++)
	{
		int k = check(d);
		if (k > max)
		{
			max_d =d;
			max=k;
		}
		printf("%d: %d\n", d,k);
	}
	printf("d=%d  period=%d\n",max_d,max);
}
