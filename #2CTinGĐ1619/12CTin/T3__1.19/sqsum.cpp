#include <bits/stdc++.h>
using namespace std;

int main() {
	ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
	freopen("sqsum.inp","r",stdin);
	freopen("sqsum.out","w",stdout);

	int ans; cin >> ans;
	int n = ans / 10;
	int cs[11] = {0};
	for (int i = 1; i <= 10; i++) cs[i] = cs[i-1] + i;

	for (int i = 0; i <= n; i++)
		for (int j = 1; j <= 10; j++)
			for (int k = 0; k <= 10 - j; k++)
				if (ans == (cs[j + k] - cs[j - 1]) * (k + 1) + (k + 1) * (i + k + i) * (k + 1) * 10 / 2)
				{
					cout << i * 10 + j;
					return 0;
				}
}