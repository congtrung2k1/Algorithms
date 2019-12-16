#include <iostream>
#include <cstdio>
#include <vector>
#include <queue>

using namespace std;

#define maxN 33
#define maxNN 550
#define pb push_back
#define maxC 2000000000

char a[maxN][maxN];
int n,f[maxNN][maxNN],c[maxNN][maxNN],fp[maxN],maxpoint,s,t,cond,cnt,visited[maxNN],flow,k;
vector <int> g2[maxN],d,g[maxNN];
bool Free[maxNN][maxNN];

void nhap()
{
    cin >> n;
    char temp;
    for (int i=1; i<=n; i++)
    {
        for (int j=1; j<=n; j++)
        {
            cin >> temp;
            if (temp == '1') fp[i]+=2;
            else if (temp =='d') fp[i]++;
                 else if (temp == '.') g2[i].pb(j);
        }
        maxpoint = max(maxpoint,fp[i]);
    }
}

bool init(int x)
{
    int point = fp[x];
    for (int i=1; i<=n; i++) for (int j=1; j<=n; j++) Free[i][j] = true;
    for (int i=0; i<g2[x].size(); i++) {point+=2; Free[x][g2[x][i]]=Free[g2[x][i]][x]=false;}
    if (point < maxpoint) return false;
    s = cond = 0; cnt = n;
    int v;
    for (int i=0; i<=t; i++) g[i].clear();
    for (int i=1; i<=n; i++)
        if (i!=x)
            for (int j=0; j<g2[i].size(); j++)
            {
                v = g2[i][j]; if (!Free[i][v]) continue;
                if (Free[i][v])
                {
                    cnt++;
                    c[s][cnt] = 2; c[cnt][i] = c[cnt][v] = 2;
                    g[0].pb(cnt); g[cnt].pb(0); g[cnt].pb(i); g[i].pb(cnt); g[cnt].pb(v); g[v].pb(cnt);
                    Free[i][v] = Free[v][i] = false; cond+=2;
                }
            }
    t = cnt+1;
    for (int i=1; i<=n; i++)
    {
        c[i][t] = point - fp[i];
        g[i].pb(t); g[t].pb(i);
    }
    for (int i=0; i<=t; i++)
        for (int j=0; j<=t; j++)
            f[i][j] = 0;
    return true;
}

bool findpath()
{
    int u,v;
    queue<int> q; q.push(s);
    d.assign(t+1,0); d[s] = 1;
    while (!q.empty())
    {
        u = q.front(); q.pop();
        for (unsigned i=0; i<g[u].size(); i++)
        {
            v = g[u][i];
            if (!d[v] && c[u][v] > f[u][v])
            {
                d[v] = d[u]+1;
                q.push(v);
            }
        }
    }
    return d[t];
}

int augment(int u, int minE)
{
    if (u==t) return minE;
    visited[u] = k;
    int v;
    for (unsigned i=0; i<g[u].size(); i++)
    {
        v = g[u][i];
        if (visited[v] != k && f[u][v] < c[u][v] && d[v] > d[u])
            if (flow = augment(v,min(minE,c[u][v] - f[u][v])))
                {f[u][v]+=flow; f[v][u] -= flow; return flow;}
    }
    return 0;
}
void xuli()
{
    for (int i=1; i<=n; i++)
    {
        if (!init(i)) continue;
        int mf = 0;
        while (findpath())
            while ((++k,flow = augment(s,maxC)))
                mf+= flow;
        if (mf == cond) cout << i << " ";
    }
}
int main()
{
    ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
    freopen("covua.inp","r",stdin);
    freopen("covua.out","w",stdout);
    nhap();
    xuli();
    return 0;
}
