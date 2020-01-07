#include <bits/stdc++.h>
using namespace std;

int n,m;
bool fre[30010];
stack<int> stk;
int active[30010], root[30010];
vector<int> a[30010];

int findRoot(int u){
    if (root[u] != u) root[u] = findRoot(root[u]);
    return root[u];
}

void dfs(int u){
    fre[u] = true;
    stk.push(u);
    root[u] = u;

    for (int v: a[u])
        if (fre[v]) {
            int x = findRoot(active[v]);
            while (stk.top() != x){
                root[findRoot(stk.top())] = x;
                stk.pop();
            }
        }

    for (int v: a[u]) if (!fre[v]){
        active[u] = v;
        dfs(v);
    }

    if (stk.top() == u) stk.pop();
}

int main(){
    ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
    //freopen("input.inp","r",stdin);

    cin >> n >> m;
    if (m == 0){ cout << 1; return 0; }
    for (int i = 0; i < m; i++){
        int u,v; cin >> u >> v;
        a[u].push_back(v);
        a[v].push_back(u);
    }

    for (int i = 1; i <= n; i++) if (!fre[i]) dfs(i);

    vector<int> tmp(n + 1, 0);
    for (int i = 1; i <= n; i++) tmp[findRoot(i)]++;

    cout << 1 + *max_element(tmp.begin() , tmp.end());

    return 0;
}
