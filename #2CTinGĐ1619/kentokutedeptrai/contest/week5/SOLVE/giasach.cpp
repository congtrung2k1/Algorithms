#include <bits/stdc++.h>
using namespace std;
typedef long long ll;

vector<ll> sach[1000],a[10000],b[10000];
ll n;

void push(ll x, ll l, ll r, ll j)
{
    while (l<=r)
    {
        ll mid = (l+r) / 2;
        if (a[j][mid] <= x) l = mid + 1;
        else if (a[j][mid] > x) r = mid - 1;
    }
    if (l > a[j].size()) a[j].push_back(x); else a[j].insert(a[j].begin()+l,x);
}

void init()
{
    ifstream inp; inp.open("giasach.inp");
    inp >> n;
    for (ll i = 1; i<=n; i++)
    {
        ll x,u,v;
        inp >> x >> u >> v; v--;
        sach[i].push_back(x); sach[i].push_back(u); sach[i].push_back(v);

        for (ll j = u; j <= v; j++)
            if (a[j].empty()) a[j].push_back(x); else push(x,0,a[j].size(), j);
    }
    inp.close();
}

void qsort(ll l, ll r)
{
    ll i = l, j = r, x = sach[(ll)(l+r)/2][0];
    do
    {
        while (sach[i][0]<x) i++;
        while (x<sach[j][0]) j--;
        if (!(i>j))
        {
            vector<ll> t = sach[i]; sach[i] = sach[j]; sach[j] = t;
            i++; j--;
        }
    }while (i<=j);
    if (l<j) qsort(l,j);
    if (i<r) qsort(i,r);
}

int main()
{
    init();
    qsort(1,n);

    ll sum=0;
    for (ll i = n; i > 0; i--)
    {
        ll m = sach[i][0];
        ll x = sach[i][1], y = sach[i][2];

        for (ll j=x; j<=y; j++) a[j].pop_back();
        if (a[x].empty()) sum+=m; else sum = sum + m - a[x].back();
        if (a[y].empty()) sum+=m; else sum = sum + m - a[y].back();
    }

    ofstream out; out.open("giasach.out");
    out << sum << endl; out.close();

    return 0;
}
