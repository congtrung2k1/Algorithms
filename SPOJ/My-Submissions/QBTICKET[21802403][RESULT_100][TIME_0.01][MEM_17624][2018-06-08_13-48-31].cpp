#include <bits/stdc++.h>
using namespace std;
typedef long long ll;

ll l1,l2,l3,c1,c2,c3,n,s,f;
ll a[100010], dp[100010];

int main(){
    ios::sync_with_stdio(false); cin.tie(0);
    //freopen("input.inp","r",stdin);

    cin >> l1 >> l2 >> l3 >> c1 >> c2 >> c3;
    cin >> n >> s >> f;

    a[1] = 0;
    for (int i = 2; i <= n; i++) cin >> a[i];

    dp[s] = 0;
    for (int i = s + 1; i <= f; i++){
        dp[i] = 1e15;
        for (int j = i - 1; j >= s && a[i] - a[j] <= l3; j--){
            int tmp;
            if (a[i] - a[j] > l2) tmp = c3; else
            if (a[i] - a[j] > l1) tmp = c2; else tmp = c1;
            dp[i] = min(dp[i] , dp[j] + tmp);
        }
    }

    cout << dp[f];

    return 0;
}
