#include <bits/stdc++.h>
using namespace std;
#define nmax 10001

int n,m,a,b, q[nmax], w[nmax], c[nmax], v[nmax];

int main(){
	ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
	freopen("sdc.inp","r",stdin);
	freopen("sdc.out","w",stdout);

	cin >> n >> m >> a >> b;
	for (int i = 1; i <= m; i++) cin >> q[i] >> w[i] >> c[i];

	bool yes = false;
	for (int i = 1; i <= n; i++) v[i] = a;
	int i = n - 1;
	while (i-- && !yes){
		for (int j = 1; j <= m; j++)
			if (v[w[j]] - v[q[j]] > c[j]) {
				v[q[j]] = v[w[j]] - c[j];
				if (v[q[j]] > b){
					yes = true;
					break;
				}
			}
	}
	
	if (yes) cout << "NO"; else
	{
		cout << "YES\n";
		for (int i = 1; i <= n; i++) cout << v[i] << ' ';
	}

	return 0;
}