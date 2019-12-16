/*
ID: tbhtan31
LANG: C
TASK : zerosum
*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int N;
long calc(char *s)
{
	char tmp[20];
	int tmpidx = 0;
	int i,j;
	long sum =0;
	int prevop = 1;
	for (i = 0; s[i];i++)
	{
		char c = s[i];
		if ( c=='+'){
			tmp[tmpidx]=0;
			long k = atoi(tmp);
			sum+=prevop*k;tmpidx=0;;
			prevop =1;	
		}
		else if (c=='-'){
			tmp[tmpidx]=0;
			long k = atoi(tmp);
			sum += prevop*k; tmpidx=0;;
			prevop=-1;
		}
		else if (c!=' '){
			tmp[tmpidx++] = c;
		}
	} 

			tmp[tmpidx]=0;
			long k = atol(tmp);
			sum+=prevop*k;tmpidx=0;;
	return sum;
}


char output [1000][25];
int ocount = 0;

FILE *out;
void permute(int i, char *s)
{
	if (! s[i]){
		long sum = calc(s);
		if (sum==0) strcpy(&output[ocount++][0], s);
	
		return ;
	}

		s[i] = '+';
		permute(i+2,s);
		s[i] = '-';
		permute(i+2, s);
		s[i] = ' ';
		permute(i+2,s);	
}
int strcmp1(const void * a, const void * b)
{
	return strcmp((const char*) a, (const char *)b);
}

int main()
{
	FILE * in = fopen("zerosum.in","r");
	out = fopen ("zerosum.out","w");

int p =	fscanf(in, "%d", &N);
p;

	char s[100];

	int i,j;
	char cc='1';
	for (i = 0; i < 2*N; i+=2){
		s[i] = cc;cc++;
	}
	for (i=1; i < 2*N; i += 2) s[i]=' ';

	s[2*N-1]=0;

	permute(1, s);

	qsort(output, ocount, 25,strcmp1);

	for (i=0;i<ocount;i++)
		fprintf(out, "%s\n", &output[i][0]);
fclose(out);
fclose(in);
	return 0;
}
