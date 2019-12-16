#include <bits/stdc++.h>
using namespace std;
#define nmax 200001

int n,h; 
long long a[nmax], s[nmax];

int main(){
	ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
	freopen("increasing.inp","r",stdin);
	freopen("increasing.out","w",stdout);

	cin >> n >> h;
	for (int i = 1; i <= n; i++) cin >> a[i];
	for (int i = 1; i <= n; i++) s[i] = s[i-1] + a[i];

	long long smax = -1;
	for (int i = n, j = n; i && j;){
		while (a[j] > h && j >= h) j--;
		i = min(i,j);
		while (i && a[i] <= h-j+i && j-i+1 <= h) i--;
		if (j - i + 1 > h) smax = max(smax, s[j] - s[i]);
		j--;
	}

	if (smax == -1) cout << -1; else cout << 1LL * h * (h + 1) / 2 - smax;

	return 0;
}