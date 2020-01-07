#include <iostream>
#include <cstdio>
#include <queue>
#include <vector>

#define ii pair<int,int>
#define iii pair<int,ii>
#define fi first
#define se second
#define mp make_pair
#define maxN 200
#define pb push_back

using namespace std;
int K,n,m,d[maxN],value[maxN];
priority_queue<iii,vector<iii>,greater<iii> > q;

int main()
{
	int t;
	scanf("%d",&t);
	while (t--)
	{
    int u,v,l,x;
    scanf("%d%d%d",&K,&n,&m);
    vector<iii> DSK[maxN];
    while (m--)
    {
        scanf("%d%d%d%d",&u,&v,&l,&x);
        DSK[u].pb(mp(v,ii(l,x)));
    }
    for (int i=1; i<=n; i++) d[i]=long(1e9),value[i]=long(1e9);
//    d[1]=value[1]=0;
    q.push(mp(0,ii(1,0)));
    while (!q.empty())
    {
        iii tmp=q.top(); q.pop();
        u=tmp.se.fi; l=tmp.se.se; x=tmp.fi;
        if (l<d[u])
        {
            d[u]=l;
            value[u]=x;
            for (int i=0; i<DSK[u].size(); i++)
            {
                v=DSK[u][i].fi;
                if (d[v]>d[u]+DSK[u][i].se.fi && value[u]+DSK[u][i].se.se<=K)
                {
                    q.push(mp(value[u]+DSK[u][i].se.se,ii(v,d[u]+DSK[u][i].se.fi)));
                }
            }
        }
    }
    if (d[n]==long(1e9)) cout<<"-1\n"; else cout<<d[n]<<"\n";
	}
    return 0;
}
