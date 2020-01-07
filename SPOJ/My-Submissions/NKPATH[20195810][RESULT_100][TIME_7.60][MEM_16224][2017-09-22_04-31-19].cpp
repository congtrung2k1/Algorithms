#include <bits/stdc++.h>
using namespace std;
typedef long long int ll;

ll m,n,d, a[101][101], f[101][101];
ll base = 1000000000;

ll gcd(ll a, ll b)
{
    return b==0 ? a : gcd(b, a%b);
}

int main()
{
	cin >> m >> n;
    for (ll i = 1; i <= m; i++)
        for (ll j = 1; j <= n; j++) cin >> a[i][j];

    for (ll i = 1; i <= m; i++) f[i][1] = 1;
    for (ll i = 1; i <= m; i++)
        for (ll j = 1; j < n; j++)
        {
            for (ll x = i-1; x > 0; x--)
                for (ll y = j; y > 0; y--)
                    if (gcd(a[i][j] , a[x][y]) == 1) continue; else f[i][j] = (f[i][j] + f[x][y]) % base;
            for (ll y = j-1; y > 0; y--)
                if (gcd(a[i][j] , a[i][y]) == 1) continue; else f[i][j] = (f[i][j] + f[i][y]) % base;
        }

    ll ans = 0;
    for (ll i = 1; i <= m; i++)
        for (ll x = i; x > 0; x--)
            for (ll y = n-1; y > 0; y--)
                if (gcd(a[i][n] , a[x][y]) == 1) continue; else ans = (ans + f[x][y]) % base;

    cout << ans << endl;
    return 0;
}
