#include <bits/stdc++.h>
using namespace std;
#define ll long long
#define ii unordered_map<int, int>
#define type ii*

const int nmax = 1e5 + 1;
type mau[nmax];
ll ans = 0;
int n,m, root[nmax];

inline int read(){
	char c;
	for (c = getchar(); c < '0' || c > '9'; c = getchar());
	int re = c - '0';
	for (c = getchar(); c >= '0' && c <= '9'; c = getchar()) re = re * 10 + c - '0';
	return re;
}

void write(ll x){
	if (x > 9) write(x / 10);
	putchar(x % 10 + '0');
}

int getroot(int u){
	return (root[u] <= 0) ? u : root[u] = getroot(root[u]);
}

int Union(int u, int v){
	if (root[u] < root[v]) return root[v] = u;
	if (root[u] == root[v]) --root[v];
	return root[u] = v;
}

inline ll tinh(int x){
	return (ll)x * (x - 1) / 2;
}

inline void update(int a, int b){
	ans -= tinh(a) + tinh(b);
	ans += tinh(a + b);
}

type Unionmau(type& u, type& v){
	if (u->size() < v->size()) swap(u,v);
	for (const auto& x: *v){
		auto findres = u->find(x.first);
		if (findres == u->end()) u->insert(x);
		else
		{
			update(findres->second, x.second);
			findres->second += x.second;
		}
	}
	delete v;
	return u;
}

int main(){
	ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
	freopen("vcpairs.inp","r",stdin);
	freopen("vcpairs.out","w",stdout);

	n = read(); m = read();

	for (int i = 1; i <= n; i++) {
		int x = read();
		mau[i] = new ii;
		mau[i]->insert({x, 1});
	}

	for (int i = 1; i <= n; i++) root[i] = 0;
	while (m--){
		int u = read(); u = getroot(u);
		int v = read(); v = getroot(v);
		if (u != v) {
			int r = Union(u, v);
			mau[r] = Unionmau(mau[u], mau[v]);
		}
		write(ans); putchar('\n');
	}

	return 0;
}