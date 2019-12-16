#include <bits/stdc++.h>
using namespace std;

vector<int> st, a[1000];
bool fre[1000];
int num[1000], low[1000], cnt;

void dfs(int u , int s){
    num[u] = s;
    low[u] = s;
    st.push_back(u);

    for (int i = 0; i < a[u].size(); i++)
        if (!fre[a[u][i]])
            if (num[a[u][i]] == -1) {
                dfs(a[u][i] , s + 1);
                low[u] = min(low[u], low[a[u][i]]);
            }
            else
                low[u] = min(low[u], num[a[u][i]]);

    if (low[u] == num[u]) {
        cnt++;
        cout << "-----------------" << cnt << endl;
        while (1) {
            int x = st.back(); st.pop_back();
            cout << x << endl;
            fre[x] = true;
            if (x == u) break;
        }
    }
}

int main() {
    ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
	freopen("input.inp","r",stdin);
	freopen("input.out","w",stdout);

    int n,m; cin >> n >> m;
    for (int u,v,i = 1; i <= m; i++) {
        cin >> u >> v;  
        a[u].push_back(v);
    }

    for (int i = 1; i <= n; i++) num[i] = -1, low[i] = -1;
    dfs(1,1);

    return 0;
}
