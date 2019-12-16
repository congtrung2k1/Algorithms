/*
ID : tbhtan31
LANG : C
TASK : prefix
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <memory.h>

#define SIZE 10001

typedef struct node {
	unsigned int hash;
	int len;
	char *s;
	struct node *next;
} node;

node *table[SIZE]={0};

node nodes[300];
int nodeCount = 0;

unsigned int hash(char *s)
{

	unsigned int h = 0;
	while (*s)
	{
		h = 31 *h + *s;
		s++;
	}
	return h;
}

void add(char *s)
{
	unsigned int h = hash(s);
	unsigned int idx = h % SIZE;

	node * nw =& nodes[nodeCount ++];
	nw->hash = h;
	nw->len = strlen(s);
	nw->next = table[idx];
	nw->s = s;
	table[idx] = nw;
}

int exists(char*s)
{
	unsigned int h = hash(s);
	unsigned int idx = h % SIZE;
	node *next = table[idx];
	while (next)
	{
		if (next->hash == h &&strcmp(next->s,s)==0
		) return 1;
		next=next->next;
	}
	return 0;
}

char  all[300][20];
int alllen[300];
char msg[300000];
char f[300000];
int haslen[20];
int maxlen = 0;
int main()
{
	FILE * in = fopen("prefix.in", "r");
	FILE * out = fopen ("prefix.out","w");

	int allidx = 0;
	while (1)
	{
		fscanf(in,"%s",&all[allidx][0]);
		if (all[allidx][0] == '.') break;
		add(&all[allidx][0]);
		int len = alllen[allidx] = strlen(&all[allidx][0]);
		haslen[alllen[allidx]]=1;
		if (len > maxlen)maxlen = len;
		allidx +=1;
	}

	int msgidx = 0;
	while (1)
	{
		int p =fscanf(in,"%s", &msg[msgidx]);
		 	if (p<1)break;
		int len = strlen(&msg[msgidx]);
		msgidx+=len;
	}	

	int i,j;
	int maxp = -1;
	for (i = 0; i < msgidx;i++)
	{
		f[i] =0;	
		for (j=1;j<=maxlen;j++){
			if (!haslen[j]) continue;
			int plen = j;
			int last = i-plen+1;
			char tmp = msg[i+1];
			msg[i+1] =0;
			if ( last >= 0 && exists(&msg[last]) && 
				(f[last-1]||last==0)){ 
				f[i]=1;
				if (i > maxp)maxp=i;
				msg[i+1]=tmp;break; } 
			msg[i+1]=tmp;
		}
	}

	fprintf(out,"%d\n",maxp+1);

	return 0;
}

