#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define min(a,b) ((a)>(b)?(b):(a))
typedef struct elem
{
	int w;
	int total;
	int cap;
} elem;

elem all[6000];
int n;
int minw[5700][5700];

int comp(const void * a, const void *b)
{
	elem* ea = (elem*)a;
	elem* eb = (elem*)b;
	return  ea->total - eb->total;
}

int main()
{
	n=0;
	int i,j,k;
	while(1)
	{
		k=scanf("%d%d", &all[n].w, &all[n].total);
		if (k<2)break;
		all[n].cap = all[n].total - all[n].w;
		n++;		
	}	

	qsort(all, n, sizeof(all[0]), comp);
	
	minw[1][1] = all[0].w;

	for (i =2;i <= n;i++)
	{
		minw[i][1] = min(minw[i-1][1],all[i-1].w);
		for (j=2;j<=i ;j++){
			if (all[i-1].cap >= minw[i-1][j-1] && minw[i-1][j-1]!=0){
			if (minw[i-1][j]==0) 
				minw[i][j] = minw[i-1][j-1]+all[i-1].w;
			else
				minw[i][j] = min(minw[i-1][j],
						minw[i-1][j-1]+all[i-1].w);
			} 
			else minw[i][j]=minw[i-1][j];
		}
	}
	int size =0;
	while(minw[n][1+size]){
		size++;
	}
	printf("%d\n",size);
	return 0;
}
