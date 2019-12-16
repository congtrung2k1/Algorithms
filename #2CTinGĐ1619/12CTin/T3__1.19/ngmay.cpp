#include <bits/stdc++.h>
using namespace std;
#define ll long long
#define ii pair<ll, int>
#define iii pair<ll, ii>
#define fi first
#define se second

int n,m;
vector<iii> a[501];
bool eng[501];

ll check(ll k) {
	priority_queue<iii, vector<iii>, greater<iii> > heap;

	ll t[501];
	for (int i = 1; i <= n; i++) t[i] = 10000000000000;
	t[1] = 0;

	heap.push(iii(0,ii(k,1)));
	while (!heap.empty()) {
		ll tu = heap.top().fi, wu = heap.top().se.fi; int u = heap.top().se.se; heap.pop();
		if (u == n && tu == t[u]) return tu;
		if (tu != t[u] || wu == 0) continue;

		for (int i = 0; i < a[u].size(); i++) {
			ll time = a[u][i].fi, energy = a[u][i].se.fi; int v = a[u][i].se.se;

			if (t[v] > tu + time) 
				if (wu - energy >= 0) {
					t[v] = t[u] + time;
					if (eng[v]) heap.push(iii(t[v] , ii(k, v)));
					else 		heap.push(iii(t[v] , ii(wu - energy , v)));
				}
		}
	} 

	return -1;
}

int main() {
	ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
	freopen("NGMAY.inp","r",stdin);
	freopen("NGMAY.out","w",stdout);

	cin >> n;
	for (int i = 1; i <= n; i++) cin >> eng[i]; 
	cin >> m;
	for (int u,v,t,w,i = 1; i <= m; i++) {
		cin >> u >> v >> t >> w;
		a[u].push_back(iii(t, ii(w,v)));
		a[v].push_back(iii(t, ii(w,u)));
	}

	ll ans = 10000000000000, timemin = 10000000000000;
	for (ll l = 0, r = 10000000000000; l <= r; ) {
		ll m = (l + r) / 2;
		ll tmp = check(m);
		
		if (tmp == -1 || tmp > timemin) l = m + 1; 
		else
		if (tmp < timemin) {
			timemin = tmp;
			ans = m;
			r = m - 1;
		} 
		else
		if (tmp == timemin) {
			ans = min(ans,m);
			r = m - 1;
		}
	}

	cout << ans;
}
