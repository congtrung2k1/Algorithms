#include <bits/stdc++.h>
using namespace std;
#define ll long long
#define ii pair<ll, int>

int n,m;
vector<ii> a[1000001];
ll d[1000001], sl[1000001];
priority_queue<ii, vector<ii>, greater<ii> > q;

int main() {
	ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
	freopen("road.inp","r",stdin);
	freopen("road.out","w",stdout);

	cin >> n >> m;
	for (int k,u,v,c,i = 1; i <= m; i++) {
		cin >> k >> u >> v >> c;
		a[u].push_back(ii(c,v));
		if (k == 2) a[v].push_back(ii(c,u));
	}

	for (int i = 1; i <= n; i++) d[i] = 10000000000000;
	d[1] = 0;
	sl[1] = 1;

	q.push(ii(0,1));
	while (!q.empty()) {
		ll du = q.top().first; int u = q.top().second; q.pop();
		if (du != d[u]) continue;
		if (u == n) {
			cout << du << ' ' << sl[n];
			return 0;
		}

		for (int i = 0; i < a[u].size(); i++) {
			ll c = a[u][i].first; int v = a[u][i].second;

			if (d[v] > du + c) {
				d[v] = du + c;
				sl[v] = sl[u];
				q.push(ii(d[v], v));
			} else
			if (d[v] == du + c) sl[v] += sl[u];
		}
	}
}
