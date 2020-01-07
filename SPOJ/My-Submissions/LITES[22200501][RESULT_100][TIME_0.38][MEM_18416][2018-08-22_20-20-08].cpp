#include <bits/stdc++.h>
using namespace std;
#define ll long long

const int nmax = 100001;

bool lz[4 * nmax];
int a[nmax], it[4 * nmax];

inline void update(int i, int l, int r, int u, int v){
	if (lz[i]){
		lz[i] = false;
		it[i] = r - l + 1 - it[i];
		if (l != r){
			lz[2 * i] = !lz[2 * i];
			lz[2 * i + 1] = !lz[2 * i + 1];
		}
	}

	if (v < l || r < u) return;
	if (u <= l && r <= v) {
		it[i] = r - l + 1 - it[i];
		if (l != r){
			lz[2 * i] = !lz[2 * i];
			lz[2 * i + 1] = !lz[2 * i + 1];
		}
		return;
	}

	int m = (l + r) / 2;
	update(2 * i, l, m, u, v); update(2 * i + 1, m + 1, r, u, v);
	it[i] = it[2 * i] + it[2 * i + 1];
}

inline int query(int i, int l, int r, int u, int v){
	if (lz[i]){
		lz[i] = false;
		it[i] = r - l + 1 - it[i];
		if (l != r){
			lz[2 * i] = !lz[2 * i];
			lz[2 * i + 1] = !lz[2 * i + 1];
		}
	}

	if (r < u || v < l) return 0;
	if (u <= l && r <= v) return it[i];

	int m = (l + r) / 2;
	return query(2 * i, l, m, u, v) + query(2 * i + 1, m + 1, r, u, v);
}

int main(){
    ios:: sync_with_stdio(false); cin.tie(0); cout.tie(0);
    #ifndef ONLINE_JUDGE
	    freopen("input.inp","r",stdin);
	    freopen("input.out","w",stdout);
    #endif

	int n,q; cin >> n >> q;
	while (q--){
		int w,u,v; cin >> w >> u >> v;
		if (w) cout << query(1,1,n,u,v) << '\n'; else update(1,1,n,u,v);
	}

    return 0;
}