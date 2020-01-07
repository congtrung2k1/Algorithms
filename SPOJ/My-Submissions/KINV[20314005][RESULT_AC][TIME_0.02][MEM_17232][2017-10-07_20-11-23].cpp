#include <bits/stdc++.h>
#define du 1000000000
using namespace std;
typedef long long ll;

ll n,k, f[15][10005];

ll get(ll k, ll x)
{
    if (k==0) return 1;
    ll re = 0;
    while (x<=n)
    {
        re = (re + f[k][x]) % du;
        x += x & (-x);
    }
    return re;
}

void update(ll k, ll x, ll val)
{
    while (x>0)
    {
        f[k][x] = (f[k][x] + val) % du;
        x -= x & (-x);
    }
}

int main()
{
    cin >> n >> k;
    memset(f,0,sizeof(f));
    for (ll i = 1; i<=n; i++)
    {
        ll x;
        cin >> x;
        for (ll j = 1; j<=k; j++)
            update(j,x,get(j-1,x+1));
    }

    cout << get(k,1) << endl;
    return 0;
}
