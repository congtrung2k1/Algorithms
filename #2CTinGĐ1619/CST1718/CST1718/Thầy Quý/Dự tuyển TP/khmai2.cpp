#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;
#define ll long long
    
int n;
ll m, a[44], ans;
vector<ll> dq1, dq2;

void dequy(int i, int k, ll c) {
    if (i > k) {
        if (k == n / 2) dq1.push_back(c); else dq2.push_back(c);
        return;
    }

    dequy(i + 1, k, c);
    if (a[i] + c <= m) dequy(i + 1, k, c + a[i]);
}

int bns(ll x) {
    int re;
    for (int l = 0, r = (int)dq2.size() - 1; l <= r;) {
        int m = (l + r) / 2;
        if (dq2[m] <= x) re = m, l = m + 1; else r = m - 1;
    }
    return re;
}

int main(){
    freopen("khmai.inp","r",stdin);
    freopen("khmai.out","w",stdout);

    cin >> n >> m;
    for (int i = 1; i <= n; i++) cin >> a[i];
    dequy(1, n / 2, 0);
    dequy(n / 2 + 1, n, 0);

    sort(dq1.begin(), dq1.end());
    sort(dq2.begin(), dq2.end());
    for (ll x: dq1) {
        int p = bns(m - x);
        ans += 1LL * (p + 1);
    }
    cout << ans;
}