#include <bits/stdc++.h>
using namespace std;

int n,s,t,len, trace[30010], ans[30010];
vector<int> a[30010], sv,tv;
bool yes = false, fre[30010];

void dfs(int u, int i){
    fre[u] = true;
    if (u == t){
        yes = true;
        len = i - 1;
        return;
    }
    for (int v : a[u])
        if (!fre[v]){
            trace[i] = v;
            dfs(v, i + 1);
            if (yes) return;
        }
}

int bfs(int u){
    int cnt = 0;// cout << u << endl;
    fre[u] = true;
    for (int v: a[u])
        if (!fre[v]) cnt += bfs(v);
    return cnt + 1;
}

int main(){
    ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
    freopen("wedding.inp","r",stdin);
    freopen("wedding.out","w",stdout);

    cin >> n;
    for (int i = 0; i < n - 1; i++){
        int u,v; cin >> u >> v;
        a[u].push_back(v);
        a[v].push_back(u);
    }
    cin >> s >> t;

    trace[1] = s;
    dfs(s,2);

    memset(fre,false,sizeof(fre));
    for (int i = 1; i <= len; i++) fre[trace[i]] = true;
    for (int i = 1; i <= len; i++){
        vector<int> st;
        for (int u : a[trace[i]])
            if (!fre[u]){
                int tmp = bfs(u);
                st.push_back(i + tmp);
                if (ans[len - i + 1 + tmp] == 1){
                    cout << len - i + 1 + tmp; return 0;
                }
            }
        for (int u: st) ans[u]++;
    }

    cout << 0;
    return 0;
}
