#include <bits/stdc++.h> 
using namespace std;

typedef unsigned long long UINT64;
UINT64 mul(UINT64 a, UINT64 b, UINT64 mod) { 
	UINT64 ret = 0; 
	for (a = a >= mod ? a%mod : a, b = b >= mod ? b%mod : b; b != 0; b>>=1, a <<= 1, a = a >= mod ? a - mod : a) { 
		if (b&1) {
			ret += a;
			if (ret >= mod) 
				ret -= mod;
		} 
	} 
	return ret; 
}
UINT64 mpowR2L(UINT64 x, char y[], UINT64 z) {
	int n;
	for (n = 1; y[n]; n <<= 1);
	UINT64 ret = 1;
	for (int i = n-1; i >= 0; i--) {
		if (y[i] == '1')
			ret = mul(ret, x, z);
		x = mul(x, x, z);
	}
	return ret;
}
char y[(1<<20) + 5];
int main() {
	long long x, z;
	while (scanf("%lld %s %lld", &x, y, &z) == 3) {
		printf("%llu\n", mpowR2L(x, y, z));
	}
	return 0;
}
/*
5 01 7
5 10 7
5 0101 7
3 0110 7
*/
