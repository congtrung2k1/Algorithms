/*
ID:tbhtan31
LANG:C
TASK:money
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <memory.h>

int V;
int coins[30];
long long f[30][10002];
/*
long long find(int i,int n)
{
	if (n==0) return 1;
	if (i<0) return 0;
	if (f[i][n]>=0) return f[i][n];

	

	int j;
		int val = coins[i];
		long long num = 0;
			for (j=0;  j <= n;j+=val){
				num += find(i-1,n-j);	
			}

	return f[i][n] = num;
 
}
*/
int main()
{
	FILE *in = fopen("money.in","r");
	FILE *out = fopen("money.out", "w");
	int n;
	int p = fscanf(in, "%d%d", &V,&n);


	int i,j;
	for (i=0;i<V;i++)
		p = fscanf(in, "%d", &coins[i]);

	for (i=0;i<=V;i++)
		f[i][0] = 1;

	for (i = 1;i <= n;i++)
		f[0][i] = 0;

	for (i=1;i <=V;i++){
		int val =coins[i-1];
		for (j = 1; j <= n;j++){
			int k ;
			long long s = f[i][j];
			for (k=j;k>=0;k-=val){
				s += f[i-1][k];
			}
			f[i][j] = s;
		} 
	}

	fprintf(out, "%lld\n", f[V][n]);

	return 0;
}
