#include <iostream>
#include <stdio.h>
#include <algorithm>
#include <vector>
using namespace	std;
#define ll long long

struct type{
	int fi,se,stt;
} a[1001];

bool cmp(type a, type b){
	return a.fi < b.fi || a.fi == b.fi && a.se < b.se;
}

int l[1001], trace[1001], ans, n;

int main() {
	ios_base::sync_with_stdio(false); cin.tie(0); cout.tie(0);
	freopen("doangoi.inp","r",stdin);
	freopen("doangoi.out","w",stdout);

	cin >> n;
	for (int x,k,i = 1; i <= n; i++) {
		cin >> x >> k;
		a[i].fi = x; 
		a[i].se = k;
		a[i].stt = i;
	}
	sort(a + 1, a + n + 1, cmp);

	l[1] = a[1].se - a[1].fi;
	ans = l[1];
	trace[1] = -1;
	int x = 1;
	for (int i = 2; i <= n; i++) {
		l[i] = a[i].se - a[i].fi;
		trace[i] = -1;

		for (int j = i - 1; j >= 0; j--) {
			if (a[j].se == a[i].fi) {
				int t = l[j] + a[i].se - a[j].se;
				if (t >= l[i]) {
					l[i] = t;
					trace[i] = j;
				}
			}

			if (ans <= l[i]) {
				ans = l[i];
				x = i;
			}
		}
	}

	vector<int> luu;
	while (x != -1) {
		luu.push_back(a[x].stt);
		x = trace[x];
	}

	cout << ans << '\n';
	for (int i = luu.size() - 1; i >= 0; i--) cout << luu[i] << '\n';
}