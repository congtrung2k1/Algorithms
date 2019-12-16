#include <bits/stdc++.h>
using namespace std;

int n,m,cnt, a[1000][1000], cntChild[1000], parent[1000], low[1000], num[1000];
bool khop[1000];

void dfs(int u) {
    cnt++;
    num[u] = cnt;
    low[u] = n + 1;

    for (int v = 1; v <= n; v++) 
        if (a[u][v]) {
            a[v][u] = false;
            if (parent[v] == 0) {
                parent[v] = u;
                dfs(v);
                low[u] = min(low[u], low[v]);
            }
            else
                low[u] = min(low[u], num[v]);
    }

}

int main() {
    ios_base::sync_with_stdio(false); cin.tie(0); cout.tie(0);
    freopen("input.inp","r",stdin);
    freopen("input.out","w",stdout);

    cin >> n >> m;
    for (int u,v,i = 1; i <= m; i++) {
        cin >> u >> v;
        a[u][v] = true;
        a[v][u] = true;
    }

    for (int i = 1; i <= n; i++) if (parent[i] == 0) {
        parent[i] = -1;
        dfs(i);
    }

    for (int i = 1; i <= n; i++) if (parent[i] != -1) cntChild[parent[i]]++;

    cout << "Cau:\n";
    for (int i = 1; i <= n; i++) if (parent[i] != -1 && low[i] >= num[i]) cout << parent[i] << " , " << i << '\n';

    cout << "\nKhop:\n";
    for (int i = 1; i <= n; i++)
        if (parent[i] != -1 && low[i] >= num[parent[i]]) 
            khop[parent[i]] = khop[parent[i]] || parent[parent[i]] != -1 || cntChild[parent[i]] >= 2;

    for (int i = 1; i <= n; i++) if (khop[i]) cout << i << endl;      
}