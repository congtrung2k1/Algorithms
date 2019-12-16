#include <bits/stdc++.h>
using namespace std;
#define ll long long

int n,m;
ll ans;
vector<int> e[5005];
ll d[5005], cap[5005][5005], f[5005][5005];

bool bfs(){
    memset(d,-1,sizeof(d));
    d[1] = 0;

    queue<int> qu;
    qu.push(1);
    while (!qu.empty()){
        int u = qu.front(); qu.pop();
        if (u == n) break;
        for (int v: e[u])
            if (d[v] == -1 && cap[u][v] > f[u][v]){
                qu.push(v);
                d[v] = d[u] + 1;
            }
    }
    return d[n] != -1;
}

int dfs(int u, ll minflow){
    if (u == n) return minflow;
    for (int v : e[u])
        if (cap[u][v] > f[u][v] && d[v] == d[u] + 1){
            minflow = min(minflow , cap[u][v] - f[u][v]);
            int dmin = dfs(v , minflow);
            if (dmin > 0){
                f[u][v] += dmin;
                f[v][u] -= dmin;
                return dmin;
            }
        }
    d[u] = 1e15;
    return 0;
}

int main(){
    ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
    freopen("input.inp","r",stdin);

    cin >> n >> m;
    for (int i = 0; i < m; i++){
        int u,v,c; cin >> u >> v >> c;
        if (cap[u][v]){
            cap[u][v] += c;
            cap[v][u] += c;
        }
        else
        if (v != u){
            e[u].push_back(v);
            e[v].push_back(u);
            cap[u][v] = c;
            cap[v][u] = c;
        }
    }

    while (bfs())
        while (1){
            int dmin = dfs(1 , 1e15);
            if (dmin) ans += dmin; else break;
        }

    cout << ans;

    return 0;
}
