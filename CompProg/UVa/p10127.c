#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main()
{
	while (9){

		int n; int k =scanf("%d", &n);
			if (k!=1) break;
		 k=0;
			long long m = 0;
		while (1){
			while (m < n){
				m=m*10+1; k++;
			}
			m = m % n;
			if (!m) break;
		}
		printf("%d\n",k);
	}
}


