/*
ID: tbhtan31
LANG: C
TASK: subset
*/
#include <stdlib.h>
#include <stdio.h>
#include <memory.h>
#include <string.h>

int f [40][(1+39)*39/2+1] = {-1};

// all one based
int find(int i, int n)
{
	if (f[i][n] >= 0) return f[i][n];

	if (n==1) return f[i][n] = 1;
	if (i==1) return f[i][n]=(i==n);

	int s = (1+i)*i/2;
	if (s == n) return f[i][n] = 1;
	if (s<n) return f[i][n]=0;

	int max =0;
	if(i<=n)
	{
		max = find(i-1,n-i)+find(i-1,n);
	}
	else max = find(i-1,n);

	f[i][n] = max;
	return max;
}

int main ()
{
	FILE *in = fopen ("subset.in", "r");
	FILE * out = fopen ("subset.out", "w");

	memset (&f[0][0], -1, sizeof(int)*40*(40*39/2+1));
	int n;
	fscanf (in,"%d",&n);
	int sum = (1+n)*n/2;
	
	int i,j;
	for (i=0;i <= n;i++) f[i][0]=1;

	if (sum & 1) fprintf(out, "0\n");
else	fprintf(out, "%d\n",	find(n-1,sum/2-n));
//printf("%d %d %d %d \n",find(5,1), find(5,7), find(4,7),find(4,2));
	fclose (in);
	fclose (out);
	return 0;
}
