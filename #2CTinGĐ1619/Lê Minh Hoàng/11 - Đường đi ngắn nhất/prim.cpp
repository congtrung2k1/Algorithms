#include <bits/stdc++.h>
using namespace std;
#define ii pair<int, int>
#define fi first
#define se second

int n,m, d[10000], trace[10000], ts[10000][10000];
vector<ii> a[10000];
priority_queue<ii , vector<ii> , greater<ii> > heap;
bool fre[10000];

int main() {
    ios_base::sync_with_stdio(false); cin.tie(0); cout.tie(0);
    freopen("input.inp","r",stdin);
    freopen("input.out","w",stdout);

    cin >> n >> m;
    for (int u,v,c,i = 1; i <= m; i++) {
        cin >> u >> v >> c;
        a[u].push_back(ii(c,v));
        a[v].push_back(ii(c,u));
        ts[u][v] = c;
        ts[v][u] = c;
    }

    for (int i = 1; i <= n; i++) d[i] = 1000000000;
    d[1] = 0;
    trace[1] = -1;

    heap.push(ii(0,1));
    while(!heap.empty()) {
        int du = heap.top().fi , u = heap.top().se; heap.pop();
        if (du != d[u]) continue;

        for (ii i: a[u]) {
            int v = i.se , c = i.fi;
            if (d[v] > du + c) {
                d[v] = du + c;
                trace[v] = u;
                heap.push(ii(d[v], v));
            }
        }
    }
    
    int ans = 0;
    for (int i = 2; i <= n; i++) {
        cout << i << ' ' << trace[i] << '\n';
        ans += ts[i][trace[i]];
    }
    cout << ans << '\n';
}