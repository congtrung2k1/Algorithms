#include <bits/stdc++.h>
using namespace std;
typedef long long int ll;

ll n,m,dem, lt[2001], root[2001];
vector<ll> canh[2001],dao[2001];
bool fre[2001];
stack<ll> st;

void init()
{
    cin >> n >> m;
    for (ll i = 1; i<=m; i++)
    {
        ll u,v;
        cin >> u >> v;
        canh[u].push_back(v);
        dao[v].push_back(u);
    }
}

void dfs(ll u)
{
    fre[u] = false;
    for (ll v = 0; v < canh[u].size(); v++)
        if (fre[canh[u][v]])
            dfs(canh[u][v]);
    st.push(u);
}
void dfs2(ll u, vector<ll> &tmp)
{
    fre[u] = false;
    for (ll v = 0; v < dao[u].size(); v++)
        if (fre[dao[u][v]])
            dfs2(dao[u][v], tmp);
    tmp.push_back(u);
}

int main()
{
    init();
    memset(fre,true,sizeof(fre));
    for (ll i = 1; i <= n; i++)
        if (fre[i]) dfs(i);

    memset(fre,true,sizeof(fre));
    ll dem = 0;
    while (st.size() > 0)
    {
        vector<ll> tmp;
        dem++;
        ll u = st.top(); st.pop(); root[dem] = u;

        if (fre[u]) dfs2(u,tmp);
        while (st.size() > 0 && !fre[st.top()]) st.pop();
        for (ll i = 0; i < tmp.size(); i++)
        {
            lt[tmp[i]] = dem;
        }
    }

    ll deOu[2001], deIn[2001];
    memset(deOu,0,sizeof(deOu)); memset(deIn,0,sizeof(deIn));
    for (ll u = 1; u <= n; u++)
        for (ll v = 0; v < canh[u].size(); v++)
            if (lt[u] != lt[canh[u][v]])
    {
        deOu[lt[u]]++; deIn[lt[canh[u][v]]]++;
    }

    ll tOu = 0, tIn = 0;
    for (ll i = 1; i <= dem; i++)
    {
        if (deOu[i] == 0) tOu++;
        if (deIn[i] == 0) tIn++;
    }
    if (tOu == 1 && tIn == 1)
    {
        cout << "YES" << endl;
        for (ll i = 1; i <= dem; i++)
            if (deOu[i] == 0) { cout << root[i] << " "; break; }
        for (ll i = 1; i <= dem; i++)
            if (deIn[i] == 0) { cout << root[i] << endl; break; }
        return 0;
    }

    cout << "NO" << endl;
    return 0;
}
