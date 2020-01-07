/*input
6 7 1 4
2 1 2 4
2 2 3 7
2 3 4 6
2 1 6 5
2 6 5 5
2 5 4 8
2 2 5 2
*/
#ifdef UncleGrandpa
#include <prettyprint.hpp>
#endif
#include <bits/stdc++.h>
using namespace std;
#define sp ' '
#define endl '\n'
#define mp make_pair
#define fi first
#define se second
#define __builtin_popcount __builtin_popcountll
#define int long long
#define loop(i,l,r) for(int i=(l); i<=(r); i++)
#define rloop(i,l,r) for(int i=(l); i>=(r); i--)
#define bit(x,y) ((x>>y)&1LL)
#define debug(x...) {cout << "[" << #x << "] = "; println(x);}
// const int N =;
void println() {cout << endl;}
template<typename T, typename... Ts>
void println(const T& value, const Ts&... values) {
	cout << value << ' '; println(values...);
}
struct edge {
	int u, v, w;
};
#define data data__
struct data {
	int time, u, par;
};

struct dsu {
	vector<int> par;
	vector<data> change;
	void init(int n) {
		par = vector<int>(n + 5, 0);
		for (int i = 0; i < n + 5; i++) par[i] = i;
	}
	int find(int x, int Time) {
		if (par[x] != x) {
			change.push_back({Time, x, par[x]});
			par[x] = find(par[x], Time);
		}
		return par[x];
	}
	void uni(int x, int y, int Time) {
		x = find(x, Time); y = find(y, Time);
		if (x != y) {
			change.push_back({Time, x, par[x]});
			par[x] = y;
		}
	}
	void rollback(int Time) {
		while (!change.empty() && change.back().time == Time) {
			par[change.back().u] = change.back().par;
			change.pop_back();
		}
	}
} d;


int n, m, S, T;
vector<edge> A, B;
int opt[100005];
int peak = 0;
void solve(int L, int R, int L2, int R2) {
	if (L > R) return;
	int M = (L + R) / 2;
	int stamp = ++peak;
	loop(i, L, M) d.uni(A[i].u, A[i].v, stamp);
	int M2 = L2;
	int stamp2 = ++peak;
	while (M2 <= R2 && true) {
		d.uni(B[M2].u, B[M2].v, stamp2);
		if (d.find(S, stamp2) == d.find(T, stamp2)) break;
		M2++;
	}
	opt[M] = M2;
	d.rollback(stamp2);
	solve(M + 1, R, L2, M2);
	d.rollback(stamp);
	int stamp3 = ++peak;
	loop(i, L2, M2) d.uni(B[i].u, B[i].v, stamp3);
	solve(L, M - 1, M2, R2);
	d.rollback(stamp3);
}

signed main() {
	ios_base::sync_with_stdio(false); cin.tie(0);
	cin >> n >> m >> S >> T;
	d.init(n);
	loop(i, 1, m) {
		int type, u, v, w;
		cin >> type >> u >> v >> w;
		if (type == 1) A.push_back({u, v, w});
		else B.push_back({u, v, w});
	}
	loop(i, 1, n - 1) B.push_back({i, i + 1, (int)1e18});
	B.push_back({1, 1, 0});
	A.push_back({1, 1, 0});
	sort(A.begin(), A.end(), [&](edge & X, edge & Y) {
		return X.w < Y.w;
	});
	sort(B.begin(), B.end(), [&](edge & X, edge & Y) {
		return X.w < Y.w;
	});
	solve(0, A.size() - 1, 0, B.size() - 1);
	int ans = 1e18;
	loop(i, 0, A.size() - 1) {
		ans = min(ans, A[i].w + B[opt[i]].w);
	}
	assert(ans <= (int)(1e18));
	cout << ans << endl;
}