#include <bits/stdc++.h>
using namespace std;

int n, a[100010], b[100010];

int main(){
    cin >> n;
    for (int i = 1; i <= n; i++) cin >> a[i];
    for (int i = 1; i <= n; i++) cin >> b[i];
    sort(b + 1, b + n + 1);

    int ans = 2e9 + 5;
    for (int i = 1; i <= n; i++){
        int x = lower_bound(b + 1, b + n + 1, -a[i]) - b;
        if (x > n) x = n;
        ans = min( ans , abs(b[x] + a[i]) );
        if (x > 1)
            ans = min(ans , abs(b[x - 1] + a[i]) );
    }

    cout << ans;
    return 0;
}
