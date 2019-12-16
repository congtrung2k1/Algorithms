#include <stdio.h>
#include <stdlib.h>

 struct try1
{
const	char* name;
	int a;
	int b;
	int c;
} ;

// BGC BGC BGC
// 012 345 678

try1 tries[]={
	{"BCG", 0, 5, 7 },
	{"BGC", 0, 4,8},
	{"CBG", 2,3,7},
	{"CGB", 2, 4, 6},
	{"GBC", 1, 3, 8},
	{"GCB", 1, 5, 6}
};

int main()
{
	int n[9];
	int i;
	
while(1)
{
	int sum =0;
	for (i=0;i<9;i++)
	{
		int k = scanf("%d", &n[i]);
		if (k != 1) exit(0);
		sum += n[i];
	}

	int s = 0;
	int idx = -1;
	int min = 0x7fffffff;
	for (i  =0; i < 6;i++)
	{
		try1 t = tries[i];
		s = sum - n[t.a] - n[t.b] - n[t.c];
		if (idx < 0 || s<min){
			min=s; idx = i;
		}
	}

	printf("%s %d\n",  tries[idx].name, min);
	}
	return 0;	
}

