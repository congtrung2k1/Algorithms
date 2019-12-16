#include <stdio.h>


int gcd(int a, int b)
{
	if (a == 0) return b;
	if (b == 0) return a;
	if (a == 1 ) return 1;
	return gcd (b, a%b);
}

int eq(int n1, int d1, int n2, int d2)
{
			int g = gcd(n1,d1);
			n1 = n1/g;
			d1 = d1/g;

		int g2 = gcd(n2,d2);
		n2/=g2;
		d2/=g2;

	return n1 == n2 && d1 == d2;
}

void main(){

	int n,d,i,j;
	int nn[10];
	int dd[10];
	int idx=0;
	for (n = 10; n <= 99; n ++)
	{
		for (d = n+1; d <= 99; d++)
		{
			// 49/98 -> 4/8
			int p = n%10;
			int q = d/10;
			if (p==q && eq(n,d, n/10, d%10))
			{
				if (idx < 4){
				nn[idx] = n;
				dd[idx] = d;idx++;
}
				printf("n/d = %d/%d\n",n,d);
			} 
			p = n/10;
			q = d%10;
			
			if (p==q && eq(n,d, n%10, d/10))
			{
if (idx < 4){
				nn[idx] = n;
				dd[idx] = d;idx++;
	}			printf("n/d = %d/%d\n",n,d);
			} 
		}
	}

	int n3 = nn[0] * nn[1] * nn[2] * nn[3];
	int d3 = dd[0] * dd[1] * dd[2] * dd[3];

	int kk = gcd(n3,d3);
	n3/=kk;
	d3/=kk;

	printf("%d\n",d3); 

}
