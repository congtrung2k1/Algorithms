#include <stdio.h>


void main()
{
	int i;
	int sum=1;
	for (i = 3; i <= 1001;i+=2)
	{
		sum += 4*i*i - 6*(i-1) ; 
	}
	printf("%d\n",sum);
}
