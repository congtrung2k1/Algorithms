#include <stdlib.h>
#include <stdio.h>
#include <string.h>


int main()
{
// this requires input from stdin

	char s[10000];
	gets(s);

	int max=0;
	char *start;

	int i,j,k;
	int len = strlen(s);
	// odd palin
	for (i=0; i < len;i++){
		int left = i-1;
		int right = i+1;
		int l = 1;
		while (left >=0 && right < len && s[left] ==s[right])
		{
			left--;
			right ++;
			l+=2;
		}
		if (l > max){max=l; start=&s[left+1];}
	}

	//even palin
	for (i=0;i< len;i++){
		int left = i;
		int right=i+1;
		int l=0;
		while (left>=0 && right<len && s[left] == s[right]){
			left --; right ++;
			l += 2;
		}
	if (l > max){ max=l;start = &s[left+1]; }
	}

	start[max]=0;
	printf("%s %d\n", start, max);
}
