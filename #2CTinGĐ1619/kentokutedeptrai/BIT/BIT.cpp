#include <bits/stdc++.h>
using namespace std;
typedef long long ll;

ll n, q, bit[10000], a[1000];

void update(ll val, ll index)
{
    while (index <= n)
    {
        bit[index] += val;
        index += index & (-index);
    }
}

int sum(ll i)
{
    ll ans = 0;
    while (i)
    {
        ans += bit[i];
        i -= i & (-i);
    }
    return ans;
}

int main()
{
    cin >> n;
    for (ll i = 0; i < n; i++) cin >> a[i];
    bit[0] = 0;
    for (ll i = 1; i <=n; i++) update(a[i-1],i);

    //Update a[i] = x
    cin >> q;
    while (q)
    {
        q--;
        ll i,x;
        cin >> i >> x;
        update(x-a[i], i+1);
        a[i] = x;
    }

    //Sum u -> v
    cin >> q;
    while (q)
    {
        q--;
        ll u,v;
        cin >> u >> v;
        cout << sum(v+1) - sum(u) << endl;
    }

    return 0;
}
