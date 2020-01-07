#include <bits/stdc++.h>
using namespace std;
#define ll long long
#define eps 1e-16
#define nmax 10010

int n;
int def[8] = {0,1,2,4,5,8,9,10,};
ll a[4][nmax], dp[7][nmax];

bool check(int i, int j){
    for (int k = 0; k < 4; k++)
        if (def[i] >> k & def[j] >> k) return false;
    return true;
}

int main(){
    ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);

    cin >> n;
    for (int i = 0; i < 4; i++)
        for (int j = 0; j < n; j++) cin >> a[i][j];

    for (int i = 0; i < 8; i++){
        dp[i][0] = 0;
        for (int k = 0; k < 4; k++)
            if (def[i] >> k & 1) dp[i][0] += a[k][0];
    }

    for (int i = 1; i < n; i++)
        for (int j = 0; j < 8; j++){
            dp[j][i] = LLONG_MIN;
            ll sum = 0;
            for (int k = 0; k < 4; k++) sum += (def[j] >> k & 1) * a[k][i];

            for (int jj = 0; jj < 8; jj++)
                if (check(j,jj)) dp[j][i] = max(dp[j][i], dp[jj][i-1] + sum);
        }

    ll ans = LLONG_MIN;
    for (int i = 0; i < 8; i++) ans = max(ans, dp[i][n-1]);

    ll tmp = LLONG_MIN;
    for (int i = 0; i < n; i++)
        for (int j = 0; j < 4; j++) tmp = max(tmp, a[j][i]);
    if (tmp <= 0) { cout << tmp; return 0; }

    cout << ans;

    return 0;
}
