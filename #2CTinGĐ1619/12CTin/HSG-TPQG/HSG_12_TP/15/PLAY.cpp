#include <iostream>
#include <stdio.h>
#include <string.h>
using namespace std;
#define nmax 10001

int n,K,m, mau[105], cnt[105], dp[105][105][105];

int tinh(int l, int r, int k) {
    if (l > r) return 0;
    if (dp[l][r][k] != -1) return dp[l][r][k];
    if (l == r) return (cnt[r] + k) < K ? K - cnt[r] - k : 0;

    int re = tinh(l, r - 1, 0) + tinh(r,r,k);
    for (int i = l; i < r; i++)
        if (mau[i] == mau[r])
            re = min(re, tinh(l, i, k + cnt[r]) + tinh(i + 1, r - 1, 0));
    return dp[l][r][k] = re;
}

int main() {
    freopen("play.inp","r",stdin);
    freopen("play.out","w",stdout);

    cin >> n >> K;
    mau[0] = 0;
    for (int i = 1; i <= n; i++) {
        int x; cin >> x;
        if (x != mau[m]) mau[++m] = x, cnt[m] = 1; else cnt[m]++;
    }

    memset(dp,-1,sizeof(dp));
    cout << tinh(1,m,0);
}