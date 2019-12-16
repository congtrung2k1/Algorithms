#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char seq[20000];
char sub[1000];
int seqlen = 0;
int sublen = 0;
 long long f[11000][102];

 long long doit()
{
	int i,j,k,n;
	for (i = 0; i <= seqlen;i++)f[i][0] = 1;
	for (j=1;j<=sublen;j++)f[0][j] = 0;
	for (i=1;i <= seqlen;i++){
		char c = seq[i-1];
		for (j=1;j <= sublen;j++){
			if (c==sub[j-1])f[i][j] =f[i-1][j]+ f[i-1][j-1];
			else f[i][j] = f[i-1][j];
		}
	}
	return f[seqlen][sublen];
}

int main()
{
	int i,j,k,n;
	scanf("%d", &n);
	for (i=0;i<n;i++){
		scanf("%s", seq);
		scanf("%s",sub);
		seqlen = strlen(seq);
		sublen = strlen(sub);
		printf("%lld\n",doit());
	}
	return 0;
}
