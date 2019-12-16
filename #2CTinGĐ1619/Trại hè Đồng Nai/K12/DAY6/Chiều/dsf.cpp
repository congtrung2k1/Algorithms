#include <bits/stdc++.h>
using namespace std;
#define nmax 100001

int n,m, root[nmax];

int froot(int u){
	return (root[u] < 0) ? u : root[u] = froot(root[u]);
}
void hop(int u, int v){
	if (root[u] > root[v]) swap(u,v);
	root[u] += root[v];
	root[v] = u;
}

int main(){
	ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
	freopen("dsf.inp","r",stdin);
	freopen("dsf.out","w",stdout);

	cin >> n >> m;
	memset(root,-1,sizeof(root));
	int ans = n;
	for (int i = 0; i < m; i++){
		int u,v; cin >> u >> v;
		u = froot(u); 
		v = froot(v);
		if (u != v){
			hop(u,v);
			ans--;
		}
		cout << ans << '\n';
	}

	return 0;
}