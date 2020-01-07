#include <bits/stdc++.h>
using namespace std;
typedef long long int ll;

ll n,p,it[4*51000], a[51000], f[51000];

void build(ll i, ll l, ll r)
{
    if (l==r)
    {
        it[i] = f[l];
        return;
    }
    ll m = (l+r)/2;
    build(2*i, l, m); build(2*i+1, m+1, r);
    it[i] = max(it[2*i] , it[2*i+1]);
}

int find(ll i, ll l, ll r, ll x, ll u)
{
    while (l<r)
    {
        if (it[2*i+1] >= x)
        {
            l = (l+r)/2 + 1;
            i = 2*i+1;
        }
        else if (it[2*i] >= x && u <= (l+r)/2)
        {
            r = (l+r) / 2;
            i = 2*i;
        }
        else return -1;
    }
    return l;
}

int main()
{
	cin >> n >> p;
    f[0] = 0;
    for (ll i = 1; i <= n; i++)
    {
        cin >> a[i];
        f[i] = f[i-1] + a[i];
    }
    build(1,1,n);

    ll leng = -1;
    for (ll i = 0; i < n; i++)
        leng = max(leng, find(1,1,n, f[i]+p, i+1)-i);

    cout << leng << endl;
    return 0;
}
