#include <bits/stdc++.h>
using namespace std;
#define ll long long 

const long oo = 1e8;
const long maxn = 1020;

int n, m, a, b, k, g, u, v, cc;
int st = 0;
int King[maxn];
int c[maxn][maxn];
int d[maxn];
bool fre[maxn];
vector<vector<int> > node(maxn);

struct data
{
    int u, c;
    data(int uu, int cc)
    {
        this->u = uu;
        this->c = cc;
    }
    bool operator < (const data &rhs) const
    {
        return c > rhs.c;
    }
};
priority_queue<data> heap;

void dijkstra() {
    for (int i = 1; i <= n; i++) d[i] = oo;
    d[a] = k;

    for (int i = 1; i <= n; i++) heap.push(data(i, d[i]));
    memset(fre, true, sizeof(fre));
    while(true) 
    {
        data top = heap.top(); heap.pop();
        if (top.c != d[top.u]) continue;

        int u = top.u;
        fre[u] = false;
        if (u == b) break;
        for (int i = 0; i < node[u].size(); i++)
        {
            int v = node[u][i];
            int tmp;
            if (d[u] >= time[u][v].s and d[u] <= time[u][v].e) tmp = time[u][v].e + 1 - d[u]; else tmp = 0;

            if (fre[v] and d[v] > d[u] + c[u][v] + tmp)
            {
                d[v] = d[u] + c[u][v] + tmp;
                heap.push(data(v, d[v]));
            }
        }
    }
}

int main()
{
    ios_base::sync_with_stdio(false); cin.tie(0); cout.tie(0);
    freopen("ATIME.inp", "r", stdin);
    freopen("ATIME.out", "w", stdout);

    cin >> n >> m;
    cin >> a >> b >> k >> g;
    for (int i = 0; i < g; i++) cin >> King[i];
    for (int i = 0; i < m; i++) {
        cin >> u >> v >> cc;
        node[u].push_back(v);
        node[v].push_back(u);
        c[u][v] = cc;
        c[v][u] = cc;
    }

    memset(time, 0, sizeof(time));
    for (int i = 1; i < g; i++)
    {
        time[King[i-1]][King[i]].s = st;

        time[King[i-1]][King[i]].e = st + c[King[i-1]][King[i]] - 1;

        time[King[i]][King[i-1]] = time[King[i-1]][King[i]];

        st = time[King[i-1]][King[i]].e + 1;
    }

    dijkstra();
    cout << d[b] - k;
    return 0;
}
