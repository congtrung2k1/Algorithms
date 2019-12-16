#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct 
{
	int size;
	int iq;
	int idx;
} elem;

elem all[2000];
int n;

int f[2000];
int p[2000]; // backpointer idx into p

int comp(const void * a, const void *b)
{
	elem* ea = (elem*)a;
	elem* eb = (elem*)b;
 int k = ea->size - eb->size;
if (k !=0 ) return k;
return ea->iq-eb->iq;
}

int main()
{
	int i = 0;
	n=0;
	while (1)
	{
		
		int k = scanf("%d%d", &all[n].size, & all[n].iq);
		if (k < 2) break;
		all[n].idx = n+1;
		n++;
	}

	qsort(all, n, sizeof(elem), comp);

	for (i=0;i<n;i++)
	{
		int j;
		int max = 1;
		int maxidx = -1;
		for (j=0;j < i;j++){
			if (f[j]>=max && all[i].size >all[j].size 
				&& all[i].iq < all[j].iq)
			{
				maxidx = j;
				max=1+f[j];
			}	
		}
		f[i] = max;
		p[i] = maxidx;
	}
	int max = -1;
	int maxidx = -1;
	for (i=0;i < n;i++){
		if (f[i] > max) {max=f[i]; maxidx = i;}
	}
	
	int r[2000];int k=0;
	while(maxidx >=0){
		r[k++]=(maxidx);
		maxidx=p[maxidx];
	}
	printf("%d\n",k);
	for (i=k-1;i>=0;i--)printf("%d\n",all[r[i]].idx);
	return 0;
}


