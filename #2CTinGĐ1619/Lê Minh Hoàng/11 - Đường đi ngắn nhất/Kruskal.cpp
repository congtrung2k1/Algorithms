#include <bits/stdc++.h>
using namespace std;
#define ii pair<int, int>
#define iii pair<int,ii>
#define fi first
#define se second

int n,m, lab[10000], ans;

priority_queue<iii , vector<iii> , greater<iii> > canh;

int root(int u) {
    return lab[u] < 0 ? u : lab[u] = root(lab[u]);
}

void hopNhat(int u, int v) {
    if (lab[u] > lab[v]) swap(u,v);
    lab[u] += lab[v];
    lab[v] = u;
}

int main() {
    ios_base::sync_with_stdio(false); cin.tie(0); cout.tie(0);
    freopen("input.inp","r",stdin);
    freopen("input.out","w",stdout);

    cin >> n >> m;
    for (int u,v,c,i = 1; i <= m; i++) {
        cin >> u >> v >> c;
        canh.push(iii(c, ii(u,v)));
    }

    for (int i = 1; i <= n; i++) lab[i] = -1;
    while (!canh.empty()) {
        iii tmp = canh.top(); canh.pop();
        int u = tmp.se.fi, v = tmp.se.se;
        int c = tmp.fi;
        u = root(u);
        v = root(v);
        if (u != v) {
            hopNhat(u,v);
            ans += c;
            cout << tmp.se.fi << ' ' << tmp.se.se << endl;
        }
    }

    cout << ans;
}