#include <bits/stdc++.h>
using namespace std;
#define nmax 11000

vector<int> a[nmax];
int dp[nmax], g[nmax], f[nmax];

void dfs(int u, int la) {
	int tmp = 0;
	for (int v: a[u])
		if (v != la)
			dfs(v,u),
			tmp += dp[v];
	dp[u] = nmax; g[u] = 0; f[u] = 1;
	for (int v: a[u])
		if (v != la)
			dp[u] = min(dp[u], tmp - dp[v] + f[v]),
			f[u] += g[v], g[u] += dp[v];
	dp[u] = min(dp[u], f[u]);
}

int main() {
	freopen("tramts.inp","r",stdin);
	freopen("tramts.out","w",stdout);

	int n; cin >> n;
	for(int u,v,i = 1; i < n; i++) {
		cin >> u >> v;
		a[u].push_back(v);
		a[v].push_back(u);
	}

	dfs(1,0);
	cout << dp[1];
}