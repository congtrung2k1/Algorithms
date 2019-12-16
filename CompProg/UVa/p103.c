#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int n,k;

// box[i][dimension]
// box[i][0] is the box index, rest is dim
int box[100][20];
int f[100]={0};
int last[100];

int boxcomp(const void * a, const void * b)
{
	int i = 0;
	for (i = 1; i <= k;i++)
	{
		int p = ((int*)a)[i]-((int*)b)[i];
		if (p != 0 ) return p; 
	}
	return 0;
}

int dimcomp(const void * a, const void * b)
{
	return *((int*)a) -*((int*)b); 
}

int fit (int * a, int * b)
{
	int i = 0; 

	for (i = 0; i<k;i++)
	{
		if ( a[i] >= b[i]) return 0;
	}
	return 1;
}
/*
int find(int start)
{
	int i = 0;
	if (start ==n ) return 0;
	for (i =1+ start; i < n; i++)
	{
		if (! fit(&box[start][1], &box[i][1])) continue;
		int ff = 2 + find(i);
		int f2 = 2 + find(i+1);
	}
}
*/
int main()
{
	while (1)
	{
		int i = 0;
		int p= scanf("%d%d", &n,&k);
		if (p<2) break;
		for (i = 0; i < n ; i++)
		{

			int j;
			for (j=0;j < k;j++)
				scanf("%d", &box[i][j+1]);
			box[i][0] =1+ i;
			qsort(&box[i][1],k,sizeof(int),dimcomp);
		}

		qsort(&box[0][0], n, sizeof(int)*(20), boxcomp);

		int maxfit = 1;
		int fitidx = 0;
		f[0] = 1;
		last[0] = -1;
		for (i=1;i <n;i++)
		{
			maxfit = 1;
			fitidx = -1;
			int j;
			for (j = i-1; j >=0;j--)
			{
				if ( !fit (&box[j][1],&box[i][1]))
					continue;
				int ff = f[j] + 1;
				if (ff > maxfit){
					fitidx = j;
					maxfit=ff;	
				}	
			}
			f[i]=maxfit; last[i] = fitidx;
		}

		maxfit = 0;
		fitidx = 0;
		for (i=0;i<n;i++){
			if ( f[i] > maxfit ){
				maxfit = f[i]; fitidx = i;
			}
		}


		printf("%d\n",maxfit);

		int kk[100];
		int kkidx = 0;
		kk[kkidx++]=fitidx;
		while (1)
		{
			int h = last[fitidx];
			if (h==-1) break;
			kk[kkidx++] = h;
			fitidx = h;
		}
		int j;
		for (j=kkidx-1;j>=1;j--) {
			printf("%d ",box[kk[j]][0]);
		}
		printf("%d\n", box[kk[j]][0]);
	}

return 0;}



