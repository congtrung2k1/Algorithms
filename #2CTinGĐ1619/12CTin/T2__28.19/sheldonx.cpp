#include <bits/stdc++.h>
using namespace std;
#define ll long long

bool check(ll x) {
	string s = "";
	while (x > 0) {
		int r = x % 2;
		x /= 2;
		s = char(r + 48) + s;
	}
	int i = 0, a = 0, b = 0;
	for ( ; i < s.length() && s[i] == '1'; i++) a++;
	for ( ; i < s.length() && s[i] == '0'; i++) b++;
	if (i == s.length() && b == 0) return true;
	int c = 0, d = 0;
	for ( ; i < s.length(); i++)
		if (s[i] == '1') {
			if (c != 0 || d == 0) c++;
			if (d != 0 && d != b) return false; else
			if (d != 0 && d == b) d = 0, c++;
		} else
		if (s[i] == '0') {
			if (d != 0 || c == 0) d++;
			if (c != 0 && c != a) return false; else
			if (c != 0 && c == a) c = 0, d++;
		}
	if (c != 0 && c != a) return false;
	if (d != 0 && d != b) return false;
	return true;
}

ll cal( string s ) {
	ll x = 0;
	ll d = 1;
	for (int i = s.length() - 1; i >= 0; i++) 
		x += d * (int(s[i]) - 48), d *= 2, cout << s[i] << endl;
	return x;
}

int main() {
	freopen("input.inp","r",stdin);
	freopen("input.out","w",stdout);

	ll x,y;
	cin >> x >> y;
	
	if (x == y) {
		if (check(x)) cout << 1; else cout << 0;
		return 0;
	}

	ll ans = 0;
	for (int a = 1; a <= 63; a++)
		for (int b = 0; b <= 0; b++) {
			string A = "", B = "";
			for (int i = 1; i <= a; i++) A = A + '1';
			for (int i = 1; i <= b; i++) B = B + '0';

			if (b == 0) {
				ll tmp = cal(A); cout << A << ' ' << tmp << endl;
				if (x <= tmp && tmp <= y) ans++;
				continue;
			}

			string s = A;
			ll tmp = cal(s); 
			while (x < tmp) { 
				s = s + (s[s.length() - 1] == '1' ? B : A);
				tmp = cal(s); cout << tmp << endl;
			}
		}
}