#include <bits/stdc++.h>
using namespace std;
#define ll long long
#define nmax 55
const ll oo = 1e9;

ll a[nmax][nmax];

int main(){
	ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
	freopen("comeback.inp","r",stdin);
	freopen("comeback.out","w",stdout);

	int m; cin >> m;

	for (int i = 0; i <= 51; i++)
		for (int j = 0; j <= 51; j++) a[i][j] = oo;

	for (int i = 0; i < m; i++) {
		char s,x; int c; cin >> s >> x >> c;
		int u = ('A' <= s && s <= 'Z') ? (s - 'A' + 26) : (s - 'a');
		int v = ('A' <= x && x <= 'Z') ? (x - 'A' + 26) : (x - 'a');
		if (u != v && a[u][v] > c) a[u][v] = a[v][u] = c;
	}
	for (int k = 0; k <= 51; k++)
		for (int i = 0; i <= 51; i++)
			for (int j = 0; j <= 51; j++)
				a[i][j] = min(a[i][j], a[i][k] + a[k][j]);

	int c;
	ll ans = oo;
	for (int i = 26; i < 51; i++)
		if (ans > a[i][51])
			ans = a[i][51], 
			c = i;

	cout << char(c - 26 + 'A') << ' ' << ans;

	return 0;
}
