#include<stdlib.h>
#include<string.h>
#include<stdio.h>
#include<math.h>
char isprime[1000000];
int main(){

	int i,j,k;
	memset(isprime, 1, sizeof(isprime));
	for (i=2; i < sizeof(isprime);i++){
		if (!isprime[i]) continue;
		for (k=i*2; k < sizeof (isprime);k+=i){
			isprime[k]=0;
		}
	}

	int a = 1;
	int b = 1;
	while (b <= 227000 || !isprime[b]){
		int c=a+b; a = b; b = c;
	}
	int sum=0;
	b++;
	int sqr = (int)sqrt(b)+1;
	for(i=2; i<=sqr;i++){
		if (isprime[i] && b%i==0) sum+=i;
	}
	printf("%d\n", sum);
}
