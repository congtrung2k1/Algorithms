#include <iostream>
#include <cstdio>
#include <cmath>
#include <cstdlib>
#include <cstring>
#include <algorithm>
#define ii pair<int, int>
#include <queue>
#include <vector>
using namespace std;
const int N = (int) 1e4 + 7;
int n, m, c[N][N], f[N][N], d[N], mp[N], rs;
vector <ii> ed, a[N];
void init()
{
    freopen("trongcay.inp", "r", stdin);
    freopen("trongcay.out", "w", stdout);
    scanf("%d%d", &n, &m);
    int x, y, z;
    for(int i = 0; i < m; i++)
    {
        scanf("%d%d%d", &x, &y, &z);
        if(c[x][y] == 0 || c[x][y] > z)
        {
            if(c[x][y] == 0) ed.push_back(ii(x, y));
            c[x][y] = c[y][x] = z;
            f[x][y] = f[y][x] = 1;
        }else
        if(c[x][y] == z)
        {
            f[x][y] ++;
            f[y][x] ++;
        }
    }
    for(int i = 0; i < (int)ed.size(); i++)
    {
        int u = ed[i].first, v = ed[i].second;
        a[u].push_back(ii(c[u][v], v));
        a[v].push_back(ii(c[u][v], u));
    }
    rs = 0;
}
void dijkstra()
{
    priority_queue<ii, vector<ii>, greater<ii> > qu;
    qu.push(ii(0, 0));
    d[0] = 0;
    for(int i = 1; i < n; i++) d[i] = (int)1e9 + 7;
    while(qu.size())
    {
        int u = qu.top().second, du = qu.top().first;
        qu.pop();
        if(du != d[u]) continue;
        for(int i = 0; i < a[u].size(); i++)
        {
            int uv = a[u][i].first, v = a[u][i].second;
            if(d[v] > du + uv)
            {
                d[v] = du + uv;
                qu.push(ii(d[v], v));
            }
        }
    }
    mp[0] = 0;
    for(int i = 1; i < n; i++) mp[i] = d[i];
}
void dijkstra1()
{
    priority_queue<ii, vector<ii>, greater<ii> > qu;
    qu.push(ii(0, 0));
    d[0] = 0;
    for(int i = 1; i < n; i++) d[i] = (int)1e9 + 7;
    while(qu.size())
    {
        int u = qu.top().second, du = qu.top().first;
        qu.pop();
        if(du != d[u]) continue;
        for(int i = 0; i < a[u].size(); i++)
        {
            int uv = a[u][i].first, v = a[u][i].second;
            if(d[v] > du + uv)
            {
                d[v] = du + uv;
                qu.push(ii(d[v], v));
            }
            if(d[v] == mp[v] && du + uv == d[v])
            {
                rs += f[u][v] * c[u][v];
            }
        }
    }
}
void solve()
{
    init();
    dijkstra();
    dijkstra1();
    rs *= 2;
    printf("%d", rs);
}
int main()
{
    solve();
    return 0;
}
