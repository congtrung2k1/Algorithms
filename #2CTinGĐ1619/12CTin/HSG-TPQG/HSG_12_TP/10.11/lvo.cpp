#include <bits/stdc++.h>
using namespace std;
#define nmax 1001

int n,m,q;
vector<int> a[nmax];
int cnt[nmax];
bool fre[nmax];

inline void dfs(int u, int x) {
	cnt[u] = x;
	fre[u] = true;
	for (int v: a[u]) if (!fre[v]) dfs(v, x);
}

int main(){
	ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
	freopen("lvo.inp","r",stdin);
	freopen("lvo.out","w",stdout);

	cin >> n >> m >> q;
	for (int u,v; m--;) {
		cin >> u >> v;
		a[u].push_back(v);
		a[v].push_back(u);
	}

	for (int x = 1, i = 1; i <= n; i++) if (!fre[i]) dfs(i, x++);
	for (int u,v; q--;){
		cin >> u >> v; 
		cout << (cnt[u] == cnt[v]) << '\n';
	}
      
	return 0;
}