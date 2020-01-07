#include <bits/stdc++.h>
using namespace std;
#define ll long long

const int nmax = 50001;
const int oo = -1000000001;

struct type {
	int sum, pre, suf, ans;
}it[4 * nmax];

int a[nmax];

inline type com(const type& q, const type& w){
	type re;
	re.sum = q.sum + w.sum;
	re.pre = max(q.pre, q.sum + w.pre);
	re.suf = max(w.suf, q.suf + w.sum);
	re.ans = max(q.ans, max(w.ans, q.suf + w.pre));
	return re;
}

inline void build(int i, int l, int r){
	if (l == r){
		it[i].sum = it[i].ans = it[i].pre = it[i].suf = a[l];
		return;
	}

	int m = (l + r) / 2;
	build(2 * i, l, m);
	build(2 * i + 1, m + 1, r);
	type q = it[2 * i], w = it[2 * i + 1];
	it[i] = com(q,w);
}

inline type find(int i, int l, int r, int u, int v){
	if (v < l || r < u) return {0, oo, oo, oo};
	if (u <= l && r <= v) return it[i];

	int m = (l + r) / 2;
	type q = find(2 * i, l, m, u, v);
	type w = find(2 * i + 1, m + 1, r, u, v);
	return com(q,w);
}

int main(){
    ios:: sync_with_stdio(false); cin.tie(0); cout.tie(0);
    #ifndef ONLINE_JUDGE
	    freopen("input.inp","r",stdin);
	    freopen("input.out","w",stdout);
    #endif
    
    int n; cin >> n;
    for (int i = 1; i <= n; i++) cin >> a[i];

    build(1,1,n);
	int m; cin >> m;
	while (m--){
		int x,y; cin >> x >> y;
		cout << find(1,1,n,x,y).ans << "\n";
	}
   	
    return 0;
}