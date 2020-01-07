#include <bits/stdc++.h>
using namespace std;

vector<int> b;
int n, a[30001], bit[30001];

int get(int x) {
    int re = 0;
    for ( ; x >= 0; x = (x & (x + 1)) - 1) re = max(re, bit[x]);
    return re;
}
void update(int x, int t) {
    for ( ; x <= 30000; x = x | (x + 1)) bit[x] = max(bit[x], t);
}

int main() {
    ios_base::sync_with_stdio(false); cin.tie(0); cout.tie(0);

    cin >> n;
    for (int i = 1; i <= n; i++) {
        cin >> a[i];
        b.push_back(a[i]);
    }
    sort(b.begin(), b.end());

    int ans = 0;
    for (int i = 1; i <= n; i++) {
        int k = lower_bound(b.begin(), b.end(), a[i]) - b.begin();
        int m = get(k - 1) + 1;
        ans = max(ans, m);
        update(k, m);
    }

    cout << ans;
}