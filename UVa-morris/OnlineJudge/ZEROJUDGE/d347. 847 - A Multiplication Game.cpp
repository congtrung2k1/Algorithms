#include<stdio.h>
main() {
	long long n, p, i;
	while(scanf("%lld", &n) == 1)  {
		p = 1, i = 1; 
		while(1) {
			if(i&1) p *= 9; 
			else p *= 2;
			if(p >= n) {
				if(i&1) 
					puts("Stan wins."); 
				else
					puts("Ollie wins."); 
				break; 
			}
			i++; 
		} 
	} 
	return 0; 
}
/*
�o�D���Ѫk�N�O�b n = 1 - 9 �ɬ��v��Ĺ�Bn = 10 - 18 ���ڤOĹ�B
n = 19 - 162 ���v��Ĺ�Bn = 163 - 324 ���ڤOĹ....�C
�]�N�O���A��v���M�w���ƮɡAp �� 9 ���A�ݥ����S���j�� n�A
�p�G���j�� n�A�N�O�v��Ĺ�F���ڤO�M�w���ƮɡAp �� 2 ���A
�ݥ����S���j�� n�A�p�G���j�� n�A�N�O�ڤOĹ�C
*/ 
