#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int a[20];
int b[20];


void doit()
{
	int i,j,k;
	int numc = 0;
	int c= 0;
	for (i=0;i< 20; i++){
		int sum =c+ a[i] + b[i];
		c = sum/10; 
		if (c) numc++;
	}	
	if (numc>1) printf("%d carry operations.\n", numc);
	else if (numc == 1) printf("1 carry operation.\n");
	else
	printf("No carry operation.\n");
}

int main()
{
char s2[1000];	char s[1000];
	while (9){
		scanf("%s", s);
scanf("%s", s2);
if (s[0]=='0' && !s[1] && s2[0]=='0' && !s2[1]) break;
		memset(a,0,sizeof(a));
		int i; int n = strlen(s);
		for (i=0; i<n;i++){
			a[n-1-i] = s[i]-'0';
		}

		memset(b,0,sizeof(b));
		n=strlen(s2);
		for (i=0; i<n;i++){
			b[n-1-i] = s2[i]-'0';
		}

		doit();
	}return 0;
}
