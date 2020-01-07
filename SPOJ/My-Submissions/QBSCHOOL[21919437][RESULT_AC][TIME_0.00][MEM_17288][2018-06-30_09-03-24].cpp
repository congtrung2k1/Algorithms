#include <bits/stdc++.h>
using namespace std;
#define ll long long
#define nmax 5005
#define ii pair<ll, int>
#define fi first
#define se second
#define oo 1e20

priority_queue<ii, vector<ii>, greater<ii> > q;
vector<ii> a[nmax];
ll d[nmax], f[nmax];
int n,m;

int main(){
    ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);

    cin >> n >> m;
    for (int i = 0; i < m; i++){
        int k,u,v,l;
        cin >> k >> u >> v >> l;
        a[u].push_back( {l,v} );
        if (k == 2) a[v].push_back( {l,u} );
    }

    for (int i = 1; i <= n; i++) d[i] = oo;
    memset(f,0,sizeof(f));
    d[1] = 0; f[1] = 1;

    q.push( {0,1} );
    while (!q.empty()){
        ll du = q.top().fi; int u = q.top().se; q.pop();
        if (du != d[u]) continue;
        if (u == n) break;

        for (ii t: a[u]){
            int v = t.se; ll l = t.fi;
            if (d[v] == d[u] + l) f[v] += f[u];
            if (d[v] > d[u] + l){
                d[v] = d[u] + l;
                f[v] = f[u];
                q.push( {d[v], v} );
            }
        }
    }

    cout << d[n] << ' ' << f[n];

    return 0;
}
