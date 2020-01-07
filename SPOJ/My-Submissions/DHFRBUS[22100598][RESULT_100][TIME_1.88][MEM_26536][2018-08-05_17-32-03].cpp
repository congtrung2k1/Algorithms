#include <bits/stdc++.h>
using namespace std;
#define ll long long
#define ii pair<int, int>
#define iii pair<ll, ii>
#define fi first
#define se second
#define nmax 100001

int n,m,k,s,t;
const ll oo = 10000000000000000;
priority_queue<iii, vector<iii>, greater<iii> > heap;
ll d[nmax][6];
vector<ii> a[nmax];

int main(){
	ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
	
	cin >> n >> m >> k >> s >> t;
	for (int i = 0; i < m; i++){
		int u,v; cin >> u >> v;
		ll x; cin >> x;
		a[u].push_back(ii(v, x));
		a[v].push_back(ii(u, x));
	}

	for (int i = 1; i <= n; i++)
        for (int j = 0; j <= k; j++) d[i][j] = oo;
    d[s][0] = 0;
	heap.push(iii(0, ii(s,0)));

	while (!heap.empty()){
		iii tmp = heap.top(); heap.pop();
		int u = tmp.se.fi, x = tmp.se.se, val = tmp.fi;
		for (int i = 0; i < a[u].size(); i++){
            int v = a[u][i].fi, c = a[u][i].se;

            if (d[v][x] > d[u][x] + c) {
                d[v][x] = d[u][x] + c;
                heap.push(iii(d[v][x], ii(v, x)));
            }

            if (x < k && d[v][x + 1] > d[u][x]){
                d[v][x + 1] = d[u][x];
                heap.push(iii(d[v][x + 1], ii(v, x + 1)));
            }
		}
	}

	ll ans = oo;
	for (int i = 0; i <= k; i++) ans = min(ans, d[t][i]);
	cout << ans;

	return 0;
}
