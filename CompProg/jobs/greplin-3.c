#include<stdlib.h>
#include<stdio.h>
#include<string.h>


int num[] = {3, 4, 9, 14, 15, 19, 28, 37, 47, 50, 54, 56, 59, 61, 70, 73, 78, 81, 92, 95, 97, 99};

char set[256];

int sums[300];
int sums2[300];
int sums3[300];

int main()
{
	int n = 22 ; 

	int max = 0;
	int min = 999999;
	int i,j,k;
	for (i=0;i < n;i++){
		if (num[i] > max) max = num[i];
		if (num[i] <min)min = num[i];
		set[num[i]] = 1;
	}

	for (i=0; i <= (1<<8)-1; i++){
		for (k= 0; k < 8;k++){
			if (i & (1<<k)) sums[i] += num[k];
		}
	}

	for (i=0; i <= (1<<8)-1; i++){
		for (k= 0; k < 8;k++){
			if (i & (1<<k)) sums2[i] += num[k+8];
		}
	}
	for (i=0; i <= (1<<6)-1; i++){
		for (k= 0; k < 6;k++){
			if (i & (1<<k)) sums3[i] += num[k+8+8];
		}
	} int c=0;
	for (i=1; i <= (1 << 21) - 1; i++)
	{
		int s = sums[i & 255] + sums2[ (i >> 8) & 255]
			+ sums3[(i >> 16) & 63];
		if (min <= s && s <= max &&  set[s]){c++;}
	}
	c -= n-1; // minus sets with only one elem
	printf("%d\n", c);
	return 0;
}


