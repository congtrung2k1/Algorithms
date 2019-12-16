#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct node;
typedef struct node
{
	
	int count;
	int hash;
	char * s;
	struct node *next;
}node;

#define SIZE 10001
node *nodes[SIZE]={0};
node snodes[SIZE];
int nidx=0;

void freeit(node * head)
{

nidx=0;
node *next = head;
	while (next)
	{
		node * saved = next->next;
	if (next > &snodes[SIZE-1] ||
		next < &snodes[0])
	free(next);
		next =saved;
		}

}

void clear()
{
nidx=0;
	int i;
	for (i = 0; i < SIZE; i++)
		freeit(nodes[i]);
	memset(nodes, 0, sizeof(nodes));
}
int n;

int code (char *s)
{
	int i,j;
	int hash = 0;
	for (i = 0; i < n ;i++)
		{
			hash = 31*hash+  s[i];
		}
	return hash < 0 ? -hash : hash;
}
int hash (char * s)
{
	int i,j;
	int scode = code (s);
	int idx = scode % SIZE;

	node * next = nodes[idx];
	while (next)
	{
		if (next->hash == scode &&
			strncmp(next->s, s, n) == 0)
		{
			return ++next->count;
		}
		next = next->next;
	}

	node * ne =NULL;
	if (nidx < SIZE){
		ne = &snodes[nidx++];
	} else{
	 ne= (node*)malloc(sizeof(node));
	if (ne==NULL){printf("NE NULL\n"); fflush(stdout);}
}
	ne->s = s;
	ne->count = 1;
	ne->hash = scode;
	ne->next = nodes[idx] ;
	nodes[idx]=ne;
return 1;	
{
		

	}

}


int main()
{
char*msg =(char*)malloc(15000000);
if (msg == NULL) printf("msg is null\n");
	while (1)
	{
clear();
		int p=  scanf("%d%s", &n,& msg[0]);
		if (p<2) break;
		int len = strlen(msg);
		int i,j;int max=0; int idx = 0;
		for (i = 0; i <1+ len-n; i++)
		{
			int f =hash(&msg[i]) ;
			if (f > max ) { max=f; idx=i; }
		}		
		msg[idx+n]=0;
		printf("%s\n", &msg[idx]);
		}
	return 0;
}




