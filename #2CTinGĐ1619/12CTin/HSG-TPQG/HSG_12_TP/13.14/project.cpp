#include <bits/stdc++.h>
using namespace std;
#define nmax 1001

int n,m,h,l;
int a[nmax][nmax], ngang[nmax][nmax], doc[nmax][nmax], dp[nmax][nmax];;

int main(){
	ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
	freopen("project.inp","r",stdin);
	freopen("project.out","w",stdout);

	cin >> n >> m >> h >> l;

	for (int i = 1; i <= n; i++)
		for (int j = 1; j <= m; j++) {
			cin >> a[i][j];
			if (h - l <= a[i][j] && a[i][j] <= h + l)
				a[i][j] = 1,
				doc[i][j] = doc[i - 1][j] + 1,
				ngang[i][j] = ngang[i][j - 1] + 1;
			else
				a[i][j] = 0,
				doc[i][j] = ngang[i][j] = 0;
		}	

	for (int i = 1; i <= m; i++) dp[1][i] = a[1][i] + dp[1][i - 1];
	for (int i = 1; i <= n; i++) dp[i][1] = a[i][1] + dp[i - 1][1];
	for (int i = 2; i <= n; i++)
		for (int j = 2; j <= m; j++)
			if (a[i][j]) {
				dp[i][j] = 1;
				if (a[i - 1][j - 1] && a[i - 1][j] && a[i][j - 1]) 
					dp[i][j] = max(dp[i][j], dp[i][j - 1] + dp[i - 1][j] - dp[i - 1][j - 1] + 1);
				if (a[i - 1][j]) 
					dp[i][j] = max(dp[i][j], doc[i][j]);
				if (a[i][j - 1])
					dp[i][j] = max(dp[i][j], ngang[i][j]);
			}

	ll ans = 0;
	for (int i = 1; i <= n; i++)
		for (int j = 1; j <= m; j++) ans = max(ans, dp[i][j]);
	cout << ans;

	return 0;
}