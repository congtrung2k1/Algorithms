#include <bits/stdc++.h>
using namespace std;

const int nmax = 50001;

int a[nmax], it[4 * nmax];

inline void build(int i, int l, int r){
	if (l == r){
		it[i] = a[l];
		return;
	}
	
	int m = (l + r) / 2;
	build(2 * i, l, m); build(2 * i + 1, m + 1, r);
	it[i] = max(it[2 * i], it[2 * i + 1]);
}

inline int query(int i, int l, int r, int u, int v){
	if (r < u || v < l) return 0;
	if (u <= l && r <= v) return it[i];

	int m = (l + r) / 2;
	return max(query(2 * i, l, m, u, v), query(2 * i + 1, m + 1, r, u, v));
}

int main(){
    ios:: sync_with_stdio(false); cin.tie(0); cout.tie(0);

	int n,m; cin >> n >> m;
	while (m--){
		int u,v,k; cin >> u >> v >> k;
		a[u] += k;
		a[v + 1] -= k;
	}
	for (int i = 1; i <= n; i++) a[i] += a[i - 1];

	build(1,1,n);

	int q; cin >> q;
	while (q--){
		int u,v; cin >> u >> v;
		cout << query(1,1,n,u,v) << '\n';
	}

    return 0;
}