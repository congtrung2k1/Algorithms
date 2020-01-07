#include <bits/stdc++.h>
using namespace std;
#define ll long long

ll z[10000001];

int main(){
	ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);

	string s,a; cin >> s >> a;
	s = a + '$' + s;
	ll n = s.length(), m = a.length();

	ll l = 0, r = 0;
	for (ll i = 1; i < n; i++){
		if (z[i - l] < r - i + 1) z[i] = z[i - l];
		else 
		{
			l = i;
			r = max(r, i);
			while (r < n && s[r - i] == s[r]) r++;
			z[i] = r - i;
			r--;
		}

		if (m < i && i < n && z[i] == m) cout << i - m << ' ';
	}

	return 0;
}