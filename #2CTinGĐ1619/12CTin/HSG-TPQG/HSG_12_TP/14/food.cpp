#include <bits/stdc++.h>
using namespace std;

#define ll long long

int n,h,p,c;
ll dp[101][50001];
	
int main() {
	ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
	freopen("input.inp","r",stdin);
	freopen("input.out","w",stdout);

	cin >> n >> h;
	for (int i = 1; i <= h; i++) dp[0][i] = 1000000000;
	
	for (int i = 1; i <= n; i++) {
		cin >> p >> c;

		for (int j = 1; j <= h; j++) {
			dp[i][j] = dp[i - 1][j];
			if (p <= j) dp[i][j] = min(dp[i][j] , c + dp[i][j - p]);
		}
	}

	cout << dp[n][h];
}