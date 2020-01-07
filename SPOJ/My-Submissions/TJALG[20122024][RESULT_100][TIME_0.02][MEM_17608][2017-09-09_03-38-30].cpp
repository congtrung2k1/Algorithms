#include <bits/stdc++.h>

using namespace std;
vector<int> a[10100],b[10100];
int n,m,par[10100],cur;
bool fre[10100],cc;
stack<int> stk;
void dfs(int u){
    fre[u] = false;
    bool bb = false;
    for(int i = 0;i<a[u].size();i++){
        int v = a[u][i];
        if(fre[v]){
            dfs(v);
        }
    }
    stk.push(u);
}
void dfs2(int u){
    fre[u] = false;
    for(int i = 0;i<b[u].size();i++){
        int v = b[u][i];
        if(fre[v]){
            dfs2(v);
        }
    }
}
int main()
{
    ios_base::sync_with_stdio(0);
    cin.tie(0);
    cout.tie(0);
    cin >> n >> m;
    for(int i = 1;i<=m;i++){
        int u,v;
        cin >> u >> v;
        a[u].push_back(v);
        b[v].push_back(u);
    }
    memset(fre,true,sizeof(fre));
    for(int i = 1;i<=n;i++) if(fre[i]) dfs(i);
    memset(fre,true,sizeof(fre));
    int res = 0;
    while(stk.size() > 0){
        cur = stk.top();
        stk.pop();
        if(fre[cur]) dfs2(cur);
        while(stk.size() > 0 && !fre[stk.top()]) stk.pop();
        res++;
    }
    cout << res;
    return 0;
}