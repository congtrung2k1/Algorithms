#include <stdio.h>
#include <stdlib.h>

#include<string.h>



long long rev(long long n)
{
	long long o = n;
	long long sum = 0;
	while (n){
		long long d = n % 10;
		sum = sum*10 + d;
		n/=10;
	}
	return sum;
}
/*
long long add(long long n)
{
	long long sum = n;
	while (n){
		sum += n % 10;
n/=10;	}
return sum;
}
*/

void doit(long long n)
{
	int count = 0;
long long chk;	while (1){
		long long r = rev(n);
		long long res = r + n;
		 chk = rev(res);
		count++;
		if (chk ==res) break;
		n = res;
	}

	printf("%d %lld\n", count, chk);
}

int main()
{
	int nu; 
	scanf("%d", &nu);
	while (nu--){ int n;
		scanf ("%d", &n);
		doit(n);
	}
}



