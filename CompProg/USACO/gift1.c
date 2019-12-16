/*
user: tbhtan31
LANG: C
TASK: gift1
*/

#include <stdio.h>

char names[20][1000];
int m[20];
int NP;


int search(char *name)
{
	int i =0;
	for (; i < NP;i++)
	{
		if (strcmp(name, names[i])==0) return i;
	}	
	return -1;
}

void main()
{
	FILE *in = fopen("gift1.in","r");
	FILE *out = fopen("gift1.out","w");
	int i;
	fscanf(in,"%d", &NP);
	for (i =0 ;i < NP;i++)
	{
		fscanf(in,"%s", names[i]);
		m[i]=0;
	}

	for (i=0; i < NP;i++)
	{
		char n[1000];
		fscanf(in, "%s", n);
		int giver_idx = search(n);
		int amt, num;
		fscanf(in, "%d%d", &amt,&num);

		int j;

		for (j = 0; j < num;j++)
		{
			fscanf(in, "%s", n);
			int rcv_idx = search(n);
			m[rcv_idx] += amt/num;
			m[giver_idx] -= amt/num;
		}
	}

	for (i = 0; i < NP;i++)
	{
		fprintf(out, "%s %d\n", names[i], m[i]);
	}

	fclose (in);
	fclose(out);
	exit(0);
}







