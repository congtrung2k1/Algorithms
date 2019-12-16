#include <bits/stdc++.h>
using namespace std;

int n, h, qu[10001], a[10001], b[10001], bac[10001];
bool fre[10001];

int tinh(int u, int v, int x, int z) {
	return 1000.0 >= sqrt(1.0 * (u - x) * (u - x) + 1.0 * (v - z) * (v - z));
}

int main() {
	ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
	freopen("jump.inp","r",stdin);
	freopen("jump.out","w",stdout);

	cin >> h >> n;
	for (int i = 1; i <= n; i++) cin >> a[i] >> b[i];

	int fi = 0, se = -1;
	for (int i = 1; i <= n; i++) if (b[i] <= 1000) qu[++se] = i, bac[i] = 1, fre[i] = true;

	while (fi <= se) { 
		int u = a[qu[fi]], v = b[qu[fi]], note = bac[qu[fi]] + 1;

		for (int j = 1; j <= n; j++) 
			if (qu[fi] != j && !fre[j]) {
				if (tinh(u,v,a[j],b[j])) qu[++se] = j, bac[j] = note, fre[j] = true;				
				if (tinh(u,v,u,h)) {
					cout << note - 1; 
					return 0;
				} 
			}

		fi++;
	}
}