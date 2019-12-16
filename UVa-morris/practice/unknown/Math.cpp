#include <stdio.h>
#include <stdlib.h>
#include <math.h>
int main() {
	long long PASCAL[20][20] = {}; /*Pascal Triangle*/
	PASCAL[0][0] = 1;
	int i, j;
	for(i = 1; i < 20; i++) {
		PASCAL[i][0] = 1;
		for(j = 1; j <= i; j++) {
			PASCAL[i][j] = PASCAL[i-1][j-1] + PASCAL[i-1][j];
		}
	}
	long long Ans[20], A[20]; 
	/**
	 *	Ans[i] �O��i�檺�����`��
	 *	A[i] �O��i�檺�զX�`�� 
	 */
	A[1] = 1, Ans[1] = 10;
	long long p = 10; /*�T�{���v�O�_�i�H�F��*/ 
	printf(" 1 line %11I64d / 1e+10\n", Ans[1]);
	for(i = 2; i <= 10; i++) {
		long long sum = 0;
		for(j = 1; j < i; j++) {
			sum += PASCAL[i][j]*A[j];
		}
		sum = (long long)pow(i, 10) - sum;
		A[i] = sum;
		Ans[i] = PASCAL[10][i]*sum;
		printf("%2d line %11I64d / 1e+10\n", i, Ans[i]);
		p += Ans[i];
	}
	printf("Sum %e / 1e+10\n", (double)p);
	system("pause");
    return 0;
}
/*
1 line : C(10, 1) * (1^10) 
		=> Ans[1] = 10, 
			A[1] = 1
2 line : C(10, 2) * (2^10 - C(2,1)*A[1]) 
		=> Ans[2] = 45990, 
			A[2] = 2^10 - C(2,1)*A[1] = 1022 
3 line : C(10, 3) * (3^10 - C(3,1)*A[1] - C(3,2)*A[2]) 
		=> Ans[3] = 6717600, 
			A[3] = 3^10 - C(3,1)*A[1] - C(3,2)*A[2] = 55980
...
 
A[i] �s�� 10 ���u�]��J i ��, �B�C��ܤ� 1 �����ƦC
Ans[i] �s�� 10 ���u�], �� i �椤���ƦC�`�� 
*/
