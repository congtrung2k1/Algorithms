#include <bits/stdc++.h>
using namespace std;
#define ll long long
#define nmax 1001

int n,m,st,en;
ll d[nmax], cap[nmax][nmax], f[nmax][nmax];
vector<int> a[nmax];

bool check() {
    memset(d,-1,sizeof(d));
    d[st] = 0;

    queue<int> que;
    que.push(st);
    while (!que.empty()) {
        int u = que.front(); que.pop();
        if (u == en) break;

        for (int v: a[u])
            if (d[v] == -1 && cap[u][v] > f[u][v]) {
                d[v] = d[u] + 1;
                que.push(v);
            }
    }

    return d[en] != -1;
}

ll dfs(int u, ll minflow) {
    if (u == en) return minflow;

    for (int v: a[u]) 
        if (cap[u][v] > f[u][v] && d[v] == d[u] + 1) {
            minflow = min(minflow, cap[u][v] - f[u][v]);
            ll dmin = dfs(v, minflow);
            if (dmin > 0) {
                f[u][v] += dmin;
                f[v][u] -= dmin;
                return dmin;
            }
        }

    d[u] = 1e15;
    return 0;
}

int main() {
    ios_base::sync_with_stdio(false); cin.tie(0); cout.tie(0);

    cin >> n >> m >> st >> en;
    for (int u,v,c,i = 1; i <= m; i++) {
        cin >> u >> v >> c;
        if (cap[u][v] == 0) a[u].push_back(v);
        cap[u][v] += c;
    }

    ll ans = 0;
    while (check()) 
        while (1) {
            ll dmin = dfs(st, 1e15);
            if (dmin > 0) ans += dmin; else break;
        }

    cout << ans;
}