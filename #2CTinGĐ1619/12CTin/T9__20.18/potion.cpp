#include <bits/stdc++.h>
using namespace std;
#define ll long long
#define nmax 100010

int m;
ll n,a[nmax];

bool f(ll x) {
    ll re = 0;
    for (int i = 1; i <= m; i++) {
        re += 1LL * (a[i] / x);
        if (re > n) return true;
    }
    if (re < n) return false;
    return true;
}

int main(){
    ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
    freopen("potion.inp","r",stdin);
    freopen("potion.out","w",stdout);

    cin >> n >> m;
    ll smax = 0;
    for (int i = 1; i <= m; i++) cin >> a[i], a[i] *= 1000000, smax = max(smax, a[i]);

    ll ans = 0;
    for (ll l = 0, r = smax; l <= r; ) {
        ll m = (r + l) / 2;
        if (f(m)) ans = m, l = m + 1; else r = m - 1;
    }

    printf("%.6lf", 1.0 * ans / 1000000);

    return 0;
}
