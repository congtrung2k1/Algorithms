#include <bits/stdc++.h>
using namespace std;
#define ll long long
#define ii pair<int, int>
#define iii pair<int, ii>
#define fi first
#define se second

const int nmax = 101;
const int oo = 1000000000;

int d[nmax];
vector<iii> a[nmax];

int main(){
    ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
    freopen("roads.inp","r",stdin);
    freopen("roads.out","w",stdout);

    int n,k,m; cin >> k >> n >> m;
    for (int i = 0; i < m; i++){
        int u,v,l,t; cin >> u >> v >> l >> t;
        a[u].push_back(iii(v, ii(l,t)));
        a[v].push_back(iii(u, ii(l,t)));
    }

    priority_queue<iii, vector<iii>, greater<iii> > heap;
    for (int i = 1; i <= n; i++) d[i] = oo;
    d[1] = 0;
    heap.push(iii(0,ii(0,1)));
    while (!heap.empty()){
        int u = heap.top().se.se, cost = heap.top().se.fi, len = heap.top().fi;
        heap.pop();
        if (len != d[u] || cost > k) continue;
        if (u == n) break;

        for (int i = 0; i < (int)a[u].size(); i++){
            int v = a[u][i].fi, len = a[u][i].se.fi, val = a[u][i].se.se;
            if (d[v] > d[u] + len && cost + val < k){
                d[v] = d[u] + len;
                heap.push(iii(d[u] + len, ii(cost + val, v)));
            }
        }
    }

    if (d[n] == oo) cout << "-1"; else cout << d[n];

    return 0;
}
