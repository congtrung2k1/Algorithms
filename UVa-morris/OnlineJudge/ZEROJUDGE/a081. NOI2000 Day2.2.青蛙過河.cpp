#include<stdio.h>
main() {
	int n, m, s2[26] = {1};
	for(n = 1; n < 26; n++)	s2[n] = s2[n-1]*2;
	while(scanf("%d %d", &n, &m) == 2) {
		printf("%d", s2[n]*(m+1));
	}
	return 0;
}
/*
�]s[i,j]���i�ڬW�l�Aj�����������p�U�̦h��q�L���C��ơC
�����o�X�Gs[i,j]=2s[i-1,j]
�����Gi-1�ڬW�l�ɡA�]���I��t�A�h��s[i-1,j]�ӫC���Ft�A�W�[1�ڬW�lt'�A
�h��Ft'���C��ӼƤ]��s[i- 1,j]�A�A�Nt'�@���_�I�A�ht'�W���C������i�H�ಾ��t�W�C
��ɱ���As[0,j]=j+1
�ҥH�o�D�D�����״N�O2n(m+1)�C
*/
