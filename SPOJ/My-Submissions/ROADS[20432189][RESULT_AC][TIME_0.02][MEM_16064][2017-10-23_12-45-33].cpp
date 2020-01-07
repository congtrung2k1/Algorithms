#include <iostream>
#include <cstdio>
#include <queue>
#include <vector>

#define ii pair<int,int>
#define iii pair<int,ii>
#define fi first
#define se second

using namespace std;




int main()
{
    //freopen("input.inp","r",stdin);
    //freopen("roads.out","w",stdout);
int t; cin >> t;
while (t--)
{
    vector<iii> a[200];
    int n,m,s,d[200],val[200];
    priority_queue<iii, vector<iii>, greater<iii> > q;
    cin >> s >> n >> m;
    while (m--)
    {
        int u,v,l,c;
        cin >> u >> v >> l >> c;
        a[u].push_back(make_pair(v,ii(l,c)));
    }
    for (int i = 1; i<=n; i++) d[i]=long(1e9), val[i]=long(1e9);

    q.push(make_pair(0,ii(1,0)));
    while (!q.empty())
    {
        int u = q.top().se.fi, l = q.top().se.se, c = q.top().fi;
        q.pop();
        if (l < d[u])
        {
            d[u] = l;
            val[u] = c;
            for (int i = 0; i<a[u].size(); i++)
            {
                int v = a[u][i].fi;
                if (d[v] > d[u] + a[u][i].se.fi && val[u] + a[u][i].se.se <= s)
                {
                    q.push(make_pair(val[u] + a[u][i].se.se, ii(v, d[u] + a[u][i].se.fi)));
                }
            }
        }
    }

    if (d[n] == long(1e9)) cout << "-1\n"; else cout << d[n] <<"\n";
}
    return 0;
}
