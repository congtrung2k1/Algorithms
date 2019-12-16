#include <iostream>
#include <cstdio>
#include <queue>
#include <cmath>
#include <vector>

#define maxN 10005
#define pb push_back
#define ii pair<int,int>
#define fi first
#define se second

using namespace std;
int pa[maxN][15],p[maxN],level[maxN],n,k,d[maxN]; vector<ii> DSK[maxN];

int log2(int x){ return (int)(log(x)/log(2)); }

void DFS(int x)
{
    for (int i=0; i<DSK[x].size(); i++)
    {
        int y=DSK[x][i].fi;
        if (level[y]>-1) continue;
        level[y]=level[x]+1;
        d[y]=d[x]+DSK[x][i].se;
        p[y]=x;
        DFS(y);
    }
}

int init()
{
    int Max=0,luu=0;
    for (int i=1; i<=n; i++) level[i]=-1; level[k]=0;
    DFS(k);
    for (int i=1; i<=n; i++)
    {
        pa[i][0]=p[i];
        if (d[i]>Max)
        {
            Max=d[i]; luu=i;
        }
    }
    for (int j=1; j<=log2(n); j++) for (int i=1; i<=n; i++) if (level[i]>=(1<<j)) pa[i][j]=pa[pa[i][j-1]][j-1];
    return luu;
}

int LCA(int u,int v)
{
    if (level[u]<level[v]) swap(u,v);
    while (level[u]>level[v])
    {
        int tmp=log2(level[u]-level[v]);
        u=pa[u][tmp];
    }
    if (u==v) return u;
    while (pa[u][0]!=pa[v][0])
    {
        for (int i=log2(n); i>=0; i--) if (pa[u][i]!=pa[v][i])
        {
            u=pa[u][i]; v=pa[v][i];
        }
    }
    return pa[u][0];
}

int main()
{
    int u,v,x;
    freopen("truso.inp","r",stdin);
    freopen("truso.out","w",stdout);
    scanf("%d%d",&n,&k);
    for (int i=1; i<n; i++)
    {
        scanf("%d%d%d",&u,&v,&x);
        DSK[u].pb(ii(v,x));
        DSK[v].pb(ii(u,x));
    }
    int longest=init();
    int res1=d[longest],res2=long(2e9);
    while (longest!=k)
    {
        int Max=0;
        for (int i=1; i<=n; i++)
        {
            if (i==longest || i==k) continue;
            int tmp=d[longest]+d[i]-2*d[LCA(longest,i)];
            if (tmp>d[i]) Max=max(Max,d[i]);
            else Max=max(Max,tmp);
        }
        res2=min(res2,Max);
        longest=p[longest];
    }
    cout<<res1-res2;
    return 0;
}
