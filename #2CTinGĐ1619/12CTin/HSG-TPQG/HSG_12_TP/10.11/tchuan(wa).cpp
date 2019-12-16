#include <bits/stdc++.h>
using namespace std;
#define ll long long

int n;
ll dp[42][4];

ll tinh(int i, int la) {
	if (dp[i][la] != -1) return dp[i][la];
	if (i > n) return 1;

	ll re = 0;
	for (int j = 1; j <= 3; j++)
		if (j != la)
			re += tinh(i + 1, j);
	dp[i][la] = re;
	return re;
}

int main(){
	ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
	freopen("tchuan.inp","r",stdin);
	freopen("tchuan.out","w",stdout);

	cin >> n;
	memset(dp,-1,sizeof(dp));
	cout << tinh(1, 0);
      
	return 0;
}