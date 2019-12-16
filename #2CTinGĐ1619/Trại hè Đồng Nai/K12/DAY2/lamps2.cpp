#include <bits/stdc++.h>
using namespace std;
#define nmax 3002

int n,T;
int a[nmax][nmax], pt[nmax][nmax];

int main(){
	ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
	freopen("lamps2.inp","r",stdin);
	freopen("lamps2.out","w",stdout);

	cin >> n >> T;
	for (int i = 1; i <= n; i++){
		int u,v; cin >> u >> v;
		a[u][v] = a[v][u] = 1;
	}
	for (int i = 1; i <= n; i++) a[i][i] = 1;

	while (T--){
		for (int i = 1; i <= n; i++)
			for (int j = 1; j <= n; j++) pt[i][j] = a[i][j];
		for (int x, i = 1; i <= n; i++) cin >> x, pt[i][0] = 1 - x;

		bool yes = false;
		for (int i = 1; i <= n; i++){
			int j = 1;
			for (; j <= n; j++) if (pt[i][j]) break;
			if (j > n)
				if (pt[i][0]) yes = true; else continue;
			if (yes) break;

			for (int z = 1; z <= n; z++) 
				if (z != i && pt[z][j])
					for (int k = 0; k <= n; k++) pt[z][k] ^= pt[i][k];			
		}

		if (yes) cout << "-1\n";
		else{
			int k = 0, ans[nmax];
			for (int i = 1; i <= n; i++)
				if (pt[i][0])
					for (int j = 1; j <= n; j++)
						if (pt[i][j]){
							ans[k++] = j;
							break;
						}
		
			cout << k << ' ';
			for (int i = 0; i < k; i++) cout << ans[i] << ' ';
			cout << "\n";
		}
	}
	
	return 0;
}