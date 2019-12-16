#include <bits/stdc++.h>

using namespace std;
typedef long long ll;

ll n,m;
vector<ll> a;
ll add[30000],u[30000];

void push(ll x)
{
    ll l = 0, r = a.size();
    while (l<=r)
    {
        ll mid = (l+r) / 2;
        if (a[mid] <= x) l = mid + 1;
        else if (a[mid] > x) r = mid - 1;
    }
    if (l > a.size()) a.push_back(x); else a.insert(a.begin()+l,x);
}

int main()
{
    cin >> m >> n;
    for (ll i=1; i<=m; i++) cin >> add[i];
    for (ll i=0; i<n; i++) cin >> u[i];

    ll i = 0;
    a.push_back(add[1]);
    while (i < n)
    {
        for (ll j=a.size()+1; j<=u[i]; j++) push(add[j]);
        while (i<n && a.size() == u[i]) cout << a[i++] << endl;
    }

    return 0;
}