#include <bits/stdc++.h>
using namespace std;

int n,m;
int cha[810], instack[810], f[810];
bool fre[810];
vector<int> stk, a[810];

int findRoot(int v){
    if (cha[v] != v) cha[v] = findRoot(cha[v]);
    return cha[v];
}

void dfs(int u){
    instack[u] = true;
    fre[u] = false;
    stk.push_back(u);

    for (int v: a[u])
        if (instack[v]){
            v = findRoot(v);
            while (stk.back() != v){
                cha[stk.back()] = v;
                stk.pop_back();
            }
        }

    for (int v: a[u])
        if (fre[v]) dfs(v);

    instack[u] = false;
    if (stk.back() == u) stk.pop_back();
}

int main(){
    ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
    //freopen("input.inp","r",stdin);
    //freopen("output.out","w",stdout);

    cin >> n >> m;
    for (int i = 0; i < m; i++){
        int u,v; cin >> u >> v;
        a[u-1].push_back(v-1);
    }
    for (int i = 0; i < n; i++) cha[i] = i , fre[i] = true;

    for (int i = 0; i < n; i++)
        if (fre[i]) dfs(i);

    for (int i = 0; i < n; i++) f[i] = (cha[i] == i);
    for (int i = 0; i < n; i++)
        for (int j: a[i])
            if (findRoot(i) != findRoot(j)) f[findRoot(j)] = 0;

    int ans = 0;
    for (int i = 0; i < n; i++) ans += f[i];
    cout << ans;

    return 0;
}
