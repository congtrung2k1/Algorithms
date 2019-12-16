#include <stdio.h>


int update(int mask, int n)
{
	while (n>0)
	{
		int b = 1<<(n %10);
		if (mask & b ) return -1;
		mask |= b;
		n/=10;
	}

	return mask;
}
int len(int n)
{
	int l = 1;
	while (n >0){l*=10;n/=10;}
	return l;
}

int catn(int n, int append)
{
	return n*len(append) + append;
}

void main(){
	int max = 0;
	int i,j;
	
	for (i = 10;i <= 9999;i++)
	{
		int mask = 1;
		int cat = 0;
		for (j = 1; j <= 4;j++)
		{
			int p = i*j;
			
			mask = update(mask, p);
			if (mask <0) break;
			cat = catn(cat,p);
			if (mask==0x3ff && cat > max){
				max=cat;
				break;
			}

		}
	}
	printf("%d\n",max);
}
