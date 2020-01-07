#include <bits/stdc++.h>
using namespace std;
typedef long long ll;

ll du = 1000000007;

int main()
{
    ll n, a[100005];
    cin >> n;
    for (ll i = 1; i<=n; i++) cin >> a[i];
    sort(a, a+n);
    a[0] = 0; a[n+1] = a[n];

    ll ans = 1, i = 0;
    while (i<=n)
    {
        ll j = i + 1, d = 0;
        while (j <= n && a[i+1] == a[j]) {d++; j++;};

        if (d==1) ans = (ans * (a[j-1]-a[i]) % du) % du;
        else
        {
            ll tmp = a[j-1]-a[i];
            while (d)
            {
                ans = (ans * (tmp % du)) % du;
                tmp--; d--;
            }
        }
        if (j>n) break;
        i = j-1;
    }

    cout << ans << endl;
    return 0;
}
