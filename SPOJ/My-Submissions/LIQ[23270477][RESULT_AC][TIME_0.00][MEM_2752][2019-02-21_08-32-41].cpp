#include <bits/stdc++.h>
using namespace std;

int len[1001], a[1001];

int main(){
    int n; cin >> n;
    for (int i = 1; i <= n; i++) cin >> a[i];

    len[1] = 1;
	int ans = 0;
	for (int i = 2; i <= n; i++) {
		len[i] = 1;
		for (int j = i - 1; j > 0; j--) {
			if (a[j] < a[i]) len[i] = max(len[i] , len[j] + 1);
			ans = max(ans , len[i]);
		}
	}

	cout << ans;

    return 0;
}