#include <bits/stdc++.h>
using namespace std;
#define nmax 11000

vector<int> a[nmax];
int dp[nmax][4], ans[nmax];

void dfs(int u, int la) {
    dp[u][1] = 1;
    dp[u][2] = 2;
    dp[u][3] = 3;
    for (int v: a[u])
        if (v != la) {
            dfs(v,u);
            dp[u][1] += min(dp[v][2], dp[v][3]);
            dp[u][2] += min(dp[v][1], dp[v][3]);
            dp[u][3] += min(dp[v][1], dp[v][2]);
        }

}

void trace(int u, int la, int k) {
    ans[u] = k;
    for (int v: a[u]) 
        if (v != la)
            for (int i = 1; i <= 3; i++)
                if (i != k && dp[v][i] <= dp[v][6 - k - i]) {
                    trace(v,u,i);
                    break;
                }
}

int main(){
	ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
	
	int n; cin >> n;
    for (int u,v,i = 1; i < n; i++) {
        cin >> u >> v;
        a[u].push_back(v);
        a[v].push_back(u);
      }

    dfs(1,0);
    cout << min(dp[1][1], min(dp[1][2], dp[1][3])) << '\n';

    if (dp[1][1] <= dp[1][2] && dp[1][1] <= dp[1][3]) trace(1,0,1); 
    else 
    if (dp[1][2] <= dp[1][3]) trace(1,0,2); 
    else 
    trace(1,0,3);

    for (int i = 1; i <= n; i++) cout << ans[i] << '\n';

	return 0;
}