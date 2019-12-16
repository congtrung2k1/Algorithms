/*
Algorithm:
Flyod Warshall

One of the easiest problems in the finals...

Gotchas:
- "every possible pair" literally means so
- Page numbers present might not form a sequence. For e.g., present pages
  can be 1,2,7 with 3,4,5,6 missing
- Representing and treatment of infinity as a numerical value
- Do not include self-links
*/
#include<stdio.h>
#include<string.h>
#include<stdlib.h>


inline int min(int a, int b)
{
	return a < b ? a : b;
}

inline int max(int a,int b ){ return a >  b ? a : b; }

int path[103][103];
int n;

void doit()
{
	int i,j,k;
	for (i=1; i <= n;i++){
		for (j=1; j <=n;j++){
			for (k=1; k <= n;k++){
				int a = 
					path[j][i]+path[i][k];	
				int ainf = (path[j][i] == 0);
				int binf = (path[i][k] == 0);
				int inf = (path[j][k]==0);

				if ((ainf || binf) ) continue;
				else if (inf )path[j][k] = a;
				else if (!inf)
					path[j][k]=min(path[j][k], a);
			}
		}
	}	
	long long  t = 0;
	long long cnt = n*(n-1);
	for (i=1; i <=n;i++){
		for (j=1; j<=n;j++){
			if (i!=j&&path[i][j]>0){ t += path[i][j]; }
		}
	}

	double avg = (double)t / cnt;
	printf("average length between pages = %.3f clicks\n",avg);
}

int main()
{
	int i,j,k,a,b; int casen = 1;
	int has[200] = {0};

	while(1){
		memset(has,0,sizeof(has));
		memset(path,0,sizeof(path));
		n=0;
		while (1){
			scanf("%d%d",&a,&b);
			if (a+b==0) break;
			int aidx = 0; int bidx = 0;
			if (! has [a]) has[a] = (aidx = ++n);
			else aidx = has[a];
			if ( ! has[b]) has[b] = (bidx = ++n);
			else bidx = has[b];
			path[aidx][bidx] = 1;
			
		}
		if (n==0)break;

		printf("Case %d: ",casen);
		doit(); casen++;
	}

}
