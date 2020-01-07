#include <bits/stdc++.h>
using namespace std;
#define ii pair<long long,int>
#define fi first
#define se second

int n,m;
vector<ii> a[5001];
long long cnt[5001], d[5001];
priority_queue<ii, vector<ii>, greater<ii> > q;


int main() {
	ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);

	cin >> n >> m;
	for (int k,u,v,l,i = 0; i < m; i++) {
		cin >> k >> u >> v >> l;
		a[u].push_back(ii(l,v));
		if (k == 2) a[v].push_back(ii(l,u));
	}

	cnt[1] = 1;
	for (int i = 1; i <= n; i++) d[i] = 100000000000000000000;
	d[1] = 0;

	q.push(ii(0,1));
	while (!q.empty()) {
		int u = q.top().se;
		long long gt = q.top().fi; 
		q.pop();
		if (d[u] != gt) continue;
		if (u == n) {
			cout << d[u] << ' ' << cnt[u];
			return 0;
		}

		for (int i = 0; i < a[u].size(); i++) {
			long long l = a[u][i].fi;
			int v = a[u][i].se;

			if (d[v] > d[u] + l) {
				d[v] = d[u] + l;
				cnt[v] = cnt[u];
				q.push(ii(d[v] , v));
			}
			else 
			if (d[v] == d[u] + l) cnt[v] += cnt[u];
		}
	}

	return 0;
}