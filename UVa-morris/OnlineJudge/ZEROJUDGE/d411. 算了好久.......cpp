#include<stdio.h>
main() {
	char S[10001];
	int a, N, s2[10]={1};
	for(a = 1; a < 10;s2[a]=s2[a-1]*2,a++);
	while(scanf("%s %d", S, &N) == 2) {
		int t = S[0]-'0';
		for(a = 1; S[a]; a++) {
			t = t*10 + S[a]-'0';
			t %= s2[N];
		}
		if(t)	printf("�i�c!!��F�o��[%s���M�L�k�Q2��%d���㰣\n", S, N);
		else	printf("YA!!�ש��X%s�i�Q2��%d���㰣�F!!\n", S, N);
	}
	return 0;
}
