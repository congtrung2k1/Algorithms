#include <bits/stdc++.h>
using namespace std;
#define ll long double
#define base 1e-16

int n;
int a[100010], v[100010];

ll tp(ll time){
    ll smin = a[0] + time * v[0];
    ll smax = a[0] + time * v[0];
    for (int i = 1; i < n; i++)
        smin = min(smin, a[i] + time * v[i]),
        smax = max(smax, a[i] + time * v[i]);
    return (smax - smin) / 2;
}

int main(){
    ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);

    cin >> n;
    for (int i = 0; i < n; i++) cin >> a[i];
    for (int i = 0; i < n; i++) cin >> v[i];

    ll l,r;
    for (l = 0, r = 1e9 + 1; l <= r - base;){
        ll m1 = l + (r - l) / 3, m2 = r - (r - l) / 3;
        ll re1 = tp(m1), re2 = tp(m2);
        if (re1 <= re2) r = m2; else l = m1;
    }

    ll ans = tp(l);
    int nm;
    if (ans == 0) nm = 0; else nm = log10(ans) + 1;
    nm += 3;
    cout.precision(nm);
    cout << ans;

    return 0;
}