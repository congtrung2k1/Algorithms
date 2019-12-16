#include <bits/stdc++.h>
using namespace std;
#define ll long long
#define base 31

ll hashS[1000001];
ll MOD = 100000007;

ll mu(ll a, ll n){
	if (n == 0) return 1; else if (n == 1) return a % MOD;
	ll re = mu(a, n / 2);
	if (n & 1) return ((re * re) % MOD * (a % MOD)) % MOD; else return (re * re) % MOD;
}

int main(){
	string s,a; cin >> s >> a;
	int lS = s.length(), lA = a.length();
	s = " " + s; a = " " + a;

	ll pow = mu(base, lA);

	ll hashA = 0;
	for (int i = 1; i <= lA; ++i) hashA = (hashA * base + a[i] - 'a' + 1) % MOD;

	for (int i = 1; i <= lS; ++i) hashS[i] = (hashS[i - 1] * base + s[i] - 'a' + 1) % MOD;

	for (int i = 1; i <= lS - lA + 1; ++i)
		if (hashA == (hashS[i + lA - 1] - hashS[i - 1] * pow + MOD * MOD) % MOD) cout << i << ' ';

	return 0;
}