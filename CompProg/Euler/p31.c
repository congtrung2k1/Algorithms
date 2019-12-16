#include <stdio.h>

	int v[] = {1,2,5,10,20,50,100,200};

int s = 0;


void count(int left, int k)
{
	int i;
	
	if (k==0||left==0){s+=1; return;}

	for ( i = 0; i <= left/v[k];i++)
	{
		
		count(left - v[k]*i,k-1);
	}
}

void main()
{
	count(200, 7);
	printf("%d\n", s);
	
}

