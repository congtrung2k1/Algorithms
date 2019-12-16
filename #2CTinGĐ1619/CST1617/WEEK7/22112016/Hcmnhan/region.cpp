#include <iostream>
#include <cstdio>
#include <algorithm>

#define maxN 100005
#define ii pair<int,int>
#define fi first
#define se second

using namespace std;
ii a[maxN]; int n,m,r,score[maxN]; bool chosen[maxN];

bool cmp(ii x,ii y){ return x.fi>y.fi; }

int main()
{
    freopen("region.inp","r",stdin);
    freopen("region.out","w",stdout);
    scanf("%d%d%d",&n,&m,&r);
    int n1=n,x,tmp,res=0;
    for (int i=1; i<=r; i++) score[i]=-1;
    for (int i=1; i<=n; i++)
    {
        scanf("%d%d%d%d",&x,&a[i].se,&a[i].fi,&tmp);
        if (tmp)
        {
            chosen[a[i].se]=true;
            m--; n1--;
            a[i].se=-1; a[i].fi=-1;
        }
        score[a[i].se]=max(a[i].fi,score[a[i].se]);
    }
    sort(a+1,a+n+1,cmp);
    n=n1;
    a[n+1].fi=0;
    for (int i=1; i<=n+1; i++)
    {
        chosen[a[i-1].se]=true;
        res=a[i].fi+1;
        int cnt=i-1;
        for (int j=1; j<=r; j++) if (!chosen[j] && score[j]>-1) cnt++;
        if (cnt==m)
        {
            cout<<res; return 0;
        }
    }
    return 0;
}
