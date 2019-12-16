#include <bits/stdc++.h>
using namespace std;

vector<int> a[1000] , b[10000];
bool fre[100000];
int n,m;
stack<int> stk;

void dfs(int u) {
    fre[u] = true;
    for (int v: a[u]) if (!fre[v]) dfs(v);
    stk.push(u);
}
void dfs2(int u) {
    fre[u] = false;
    for (int v: b[u]) if (fre[v]) dfs2(v);
}

int main() {
    ios_base::sync_with_stdio(false); cin.tie(0); cout.tie(0);

    cin >> n >> m;
    for (int u,v,i = 1; i <= m; i++) {
        cin >> u >> v;
        a[u].push_back(v);
        b[v].push_back(u);
    }

    for (int i = 1; i <= n; i++) if (!fre[i]) dfs(i);

    int ans = 0;
    while (!stk.empty()) {
        int u = stk.top(); stk.pop();
        if (fre[u]) dfs2(u);
        while (stk.size() > 0 && !fre[stk.top()]) stk.pop();
        ans++;
    }
    cout << ans;
}