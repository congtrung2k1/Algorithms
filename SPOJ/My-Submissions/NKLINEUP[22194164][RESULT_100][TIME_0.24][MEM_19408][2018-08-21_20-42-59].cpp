#include <bits/stdc++.h>
using namespace std;
#define ll long long

const ll oo = 1LL << 31;
const int nmax = 50001;

int a[nmax];
struct type
{
	ll mi,ma;
} it[4 * nmax];


inline void build(int i, int l, int r){
	if (l == r){
		it[i].ma = it[i].mi = a[l];
		return;
	}
	
	int m = (l + r) / 2;
	build(2 * i, l, m); build(2 * i + 1, m + 1, r);
	it[i].ma = max(it[2 * i].ma, it[2 * i + 1].ma);
	it[i].mi = min(it[2 * i].mi, it[2 * i + 1].mi);
}

inline type query(int i, int l, int r, int u, int v){
	if (r < u || v < l) return {oo,0};
	if (u <= l && r <= v) return it[i];

	int m = (l + r) / 2;
	type q = query(2 * i, l, m, u, v);
	type w = query(2 * i + 1, m + 1, r, u, v);
	type re;
	re.ma = max(q.ma, w.ma);
	re.mi = min(q.mi, w.mi);
	return re;
}

int main(){
    ios:: sync_with_stdio(false); cin.tie(0); cout.tie(0);
    #ifndef ONLINE_JUDGE
	    freopen("input.inp","r",stdin);
	    freopen("input.out","w",stdout);
    #endif

	int n,q; cin >> n >> q;
	for (int i = 1; i <= n; i++) cin >> a[i];
	
	build(1,1,n);
	
	while (q--){
		int u,v; cin >> u >> v;
		type ans = query(1,1,n,u,v);
		cout << ans.ma - ans.mi << '\n';
	}

    return 0;
}