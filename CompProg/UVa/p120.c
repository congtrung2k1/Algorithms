#include<stdio.h>
#include <stdlib.h>
#include <string.h>


int pan[100];
int n;
int sorted[100];

void rev(int from ,int to){
	int s=from, e = to;
	while (from <= to){
	
		int k = pan[from];
		pan[from] = pan[to];
		pan[to]=k;
		from++;to--;
	}

}
int f = 0;
void flip(int i){
	// exclude i
	int j,k;
	int max = -1;
	int maxidx = 0;
	for (j=i+1; j < n;j++){
		if (pan[j] >max){
			max=pan[j]; maxidx=j;
		}
	}
	rev(maxidx,n-1);
	rev(i,n-1);
	if (f)	printf(" "); f = 1;
	printf("%d", maxidx+1);
	printf(" %d", i+1);
}

int comp(const void * a, const void * b){
	return *(int*) b - *(int*) a;
}
int main(){

	char s[10000];
	int h = 0;
	while (1){
		if (!gets(s)) break;
		if (s[0]==0) break;
		if (h) printf("\n");
		h= 1;
		printf("%s\n", s);
		n=0;
		char * tok = strtok(s," \n");
		while (tok){
			pan[n] = atoi(tok);n++;
			tok = strtok(NULL, " \n");	
		}
		rev(0,n-1);
		memcpy ( sorted, pan, sizeof(int)*n);
		qsort( sorted, n, sizeof(int),comp);
//sorted[0] = biggest/bottom

		int i,j,k;  f=0;
		for (i=0;i<n;i++){
			if (sorted[i] != pan[i]){
				flip(i);
			}
		}

		if (f) printf(" "); 
		printf("0");
		
	}return 0;
}


