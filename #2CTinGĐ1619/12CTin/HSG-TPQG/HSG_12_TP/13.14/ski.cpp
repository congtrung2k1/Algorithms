#include <bits/stdc++.h>
using namespace std;
#define ii pair<int, int>
#define iii pair<ii, int>
#define fi first
#define se second

int t,s,n;
iii a[101];
int g[101], dp[10001][101];

int main(){
	ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
	freopen("ski.inp","r",stdin);
	freopen("ski.out","w",stdout);

	cin >> t >> s >> n;
	for (int i = 1; i <= s; i++) {
            cin >> a[i].fi.fi >> a[i].fi.se >> a[i].se;
            a[i].fi.fi += a[i].fi.se;
      }

      for (int i = 1; i <= 100; i++) g[i] = t + 1;
	for (int i = 1; i <= n; i++) {
            int c,d; cin >> c >> d;
            g[c] = min(g[c], d);
      }
      for (int i = 2; i <= 100; i++) g[i] = min(g[i], g[i - 1]);

      sort(a + 1, a + s + 1);
      for (int i = 1; i <= s; i++) {
            a[i].fi.fi -= a[i].fi.se;
            a[i].fi.se += a[i].fi.fi;
      }

      for (int i = 1; i <= t; i++) {
            dp[i][0] = i / g[1];
            for (int j = 1; j <= s && a[j].fi.se <= i; j++) {
                  dp[i][j] = dp[i][j - 1];

                  int k = 0;
                  for (int l = 0, r = s; l <= r;) {
                        int m = (l + r) / 2;
                        if (a[m].fi.se < a[j].fi.fi)
                              k = m, 
                              l = m + 1;
                        else 
                              r = m - 1;
                  }

                  dp[i][j] = max(dp[i][j], dp[a[j].fi.fi][k] + (i - a[j].fi.se) / g[a[j].se]);
            }
      }

      cout << dp[t][s];	

	return 0;
}