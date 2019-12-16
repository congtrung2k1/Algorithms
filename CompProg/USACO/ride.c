/* 
ID: tbhtan31
LANG: C
TASK: ride 
*/
#include <stdio.h>


int num(char *s)
{
	int len = strlen(s);
	int i;
	int sum=1;
	for (i=0;i<len;i++) sum *= s[i]-'A'+1;
	return sum;
}

void main ()
{
	FILE *f;
	FILE *out ;
	int s1, s2;

	out = fopen("ride.out", "w");
	f = fopen("ride.in", "r");
	char str[10000];
	fscanf(f,"%s", str);
	s1 = num(str);
	fscanf(f,"%s", str);
	s2 = num(str);

	if (s1 % 47 == s2 % 47 ) fprintf(out, "GO\n");
	else fprintf(out, "STAY\n");
	exit(0);
}
