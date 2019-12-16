#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int s[1000000];
int n;

int comp(const void * a, const void * b){
	return *(int*)a - *(int*)b;
}

#define abs(a) ((a) <0 ? -(a):(a))
int main(){

	int nu;
	scanf("%d", &nu);
	while (nu--){
	 scanf ("%d", &n);
		int i,j;
		for (i=0;i<n;i++){
			scanf("%d", & s[i]);
		}

		qsort(s, n, sizeof(int), comp);

		int m = s[(n-1)/2];
		long long sum = 0;
		for (i=0;i<n;i++){
			sum += abs(s[i] - m);
		}
		printf("%lld\n", sum);
	}return 0;
}
