#include <bits/stdc++.h>
using namespace std;
#define ll long long
#define nmax 2000001
#define oo 2e5 + 3
#define ii pair<ll, ll>
#define iii pair<ll, ii>
#define fi first
#define se second

iii luu[nmax], a[nmax];
ll n, b[nmax], c[nmax], g[nmax], r[nmax], sumg[nmax], sumr[nmax], pre[nmax];

int main(){
	ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);

	cin >> n;
	for (int i = 1; i <= n; i++) cin >> a[i].fi >> a[i].se.fi >> a[i].se.se;

	sumg[0] = 0; sumr[0] = 0;
	for (int i = 1; i <= n; i++) 
		sumg[i] = sumg[i - 1] + a[i].se.fi,
		sumr[i] = sumr[i - 1] + a[i].se.se;
	
	for (int i = 1; i <= n; i++) 
		b[i] = sumr[i] - a[i].fi, c[i] = sumr[i - 1] - a[i].fi;

	for (int i = 1; i <= n; i++)
		luu[i] = iii(b[i], ii(i, 1)),
		luu[i + n] = iii(c[i], ii(i, 2));
	sort(luu + 1, luu + 2 * n + 1);
	
	pre[0] = oo;
	pre[1] = luu[1].se.fi;
	for (int i = 2; i <= 2 * n; i++)
		if (luu[i].se.se == 1) pre[i] = pre[i - 1]; else pre[i] = min(pre[i - 1], luu[i].se.fi); 

	ll ans = 0;
	for (int i = 1; i <= 2 * n; i++) 
		if (luu[i].se.se == 1) {
			ll u = luu[i].se.fi, v = pre[i - 1];
			if (u < v || u == oo || v == oo) continue;
			ans = max(ans, sumg[u] - sumg[v - 1]);
		}

	cout << ans;
 
	return 0;
}