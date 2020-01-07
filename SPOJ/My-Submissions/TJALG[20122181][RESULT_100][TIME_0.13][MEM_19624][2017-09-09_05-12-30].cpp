#include <bits/stdc++.h>
using namespace std;
typedef long long ll;

vector<ll> canh[10100], dao[10100];
bool poped[10100];
stack<ll> mang;
ll n,m;

void dfs(ll u)
{
    poped[u] = false;
    for (ll i = 0; i<canh[u].size(); i++)
        if (poped[canh[u][i]]) dfs(canh[u][i]);
    mang.push(u);
}

void dfs1(ll u)
{
    poped[u] = false;
    for (ll i = 0; i<dao[u].size(); i++)
        if (poped[dao[u][i]]) dfs1(dao[u][i]);
}

int main()
{
    cin >> n >> m;
    for (ll i=1; i<=m; i++)
    {
        ll u,v;
        cin >> u >> v;
        canh[u].push_back(v);
        dao[v].push_back(u);
    }

    memset(poped,true,sizeof(poped));
    for (ll i=1; i<=n; i++)
        if (poped[i]) dfs(i);
    memset(poped,true,sizeof(poped));
    ll dem = 0;
    while (mang.size() > 0)
    {
        ll x = mang.top();
        mang.pop();
        if (poped[x]) dfs1(x);
        while (mang.size() > 0 && !poped[mang.top()]) mang.pop();
        dem++;
    }
    cout << dem << endl;
    return 0;
}
