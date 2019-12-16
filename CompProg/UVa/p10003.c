#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int cuts[51];
int f[51][51];


int cost(int len, int base, int min, int max)
{
	if (min > max) return 0;
	if (f[min][max] > 0) return f[min][max];

	int i,j,c=0x7fffffff;
	for (i=min;i<=max;i++){
		int cc = cuts[i] - base;
		j = cost(cc, base, min,i-1) ;
		if (j >= c) continue;
		j += 
		    cost(len-cc,base+cc,i+1,max);
		if (j < c)c=j;
	}
	f[min][max] = c+len;
	return c+len;
}

int main()
{

	int len, n, i;
	while(1){
		scanf("%d",&len);
		if (len==0) break;
		scanf("%d",&n);
		for(i=0;i<n;i++){
			scanf("%d",&cuts[i]);
		}
		memset(f,0,sizeof(f));
		printf("The minimum cutting is %d.\n",cost(len,0,0,n-1));
	}
	return 0;
}

