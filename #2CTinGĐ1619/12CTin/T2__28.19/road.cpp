#include <bits/stdc++.h>
using namespace std;
#define ii pair<int,int>

int n, dp[100001], id[200001];;
bool fre[100001];
vector<ii> a[100001];

void dfs(int u) {
	fre[u] = true;
	for (int i = 0; i < a[u].size(); i++) {
		int v = a[u][i].first , c = a[u][i].second;

		if (!fre[v]) {
			dfs(v);
			dp[u] += max(dp[v] , 0) + c;
		}
	}
}

int main() {
	ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
	freopen("road.inp","r",stdin);
	freopen("road.out","w",stdout);

	cin >> n;
	for (int u,v,c, d = 0, i = 1; i <= n; i++) {
		cin >> u >> v >> c;
		if (id[u] == 0) id[u] = ++d;
		if (id[v] == 0) id[v] = ++d;

		a[id[u]].push_back(ii(id[v],c));
		a[id[v]].push_back(ii(id[u],c));
	}

	dfs(1);
	int ans = 0;
	for (int i = 1; i <= n + 1; i++) ans = max(ans, dp[i]);
	cout << ans;
}