#include <stdio.h>
#include <stdlib.h>
long long Ans[11] = {}; /*�p�⦳ i �榳�u�]���i���`��*/ 
int tmp[11] = {}; /*�p��� i �榳�X���u�]*/ 
void DFS(int now) {
	if(now == 10)	{/*���������i��p��*/ 
		int i, temp = 0;
		for(i = 0; i < 10; i++)
			if(tmp[i])
				temp++;
		Ans[temp] ++;
		return;
	}
	int i;
	for(i = 0; i < 10; i++) {
		tmp[i]++;
		DFS(now+1);
		tmp[i]--;
	}
}
int main() {
	DFS(0);
	int i;
	for(i = 1; i <= 10; i++) {
		printf("%2d line %11I64d / 1e+10\n", i, Ans[i]);
	}
	system("pause");
    return 0;
}
/*
���� 10 ���u�]���O��F�ĴX��,
�Ҧp�Ĥ@���u�]��F�� i ��, �h���U�@�ӿ� 
*/ 
