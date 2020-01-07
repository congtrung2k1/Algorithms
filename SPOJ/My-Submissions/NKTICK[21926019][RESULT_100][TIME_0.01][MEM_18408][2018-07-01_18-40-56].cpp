#include <bits/stdc++.h>
using namespace std;
#define ll long long
#define ii pair<ll, ll>
#define iii pair<ll, ii>
#define fi first
#define se second
#define oo 1e18
#define nmax 60001

int n, t[nmax], r[nmax];
ll dp[nmax][2][2];

int main(){
    ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);

    cin >> n;
    for (int i = 0; i < n; i++) cin >> t[i];
    for (int i = 0; i < n - 1; i++) cin >> r[i];

    dp[0][1][0] = t[0];
    dp[0][1][1] = r[0];
    dp[0][0][0] = oo; dp[0][0][1] = oo;
    for (int i = 1; i < n; i++){
        dp[i][1][1] = min(dp[i-1][1][0], dp[i-1][0][0]) + r[i],
        dp[i][1][0] = min(dp[i-1][1][0], dp[i-1][0][0]) + t[i],
        dp[i][0][0] = dp[i-1][1][1];
    }

    ll ans = dp[n-1][1][0];
    ans = min(ans, dp[n-1][0][0]);

    cout << ans;
    return 0;
}
