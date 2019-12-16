#include <bits/stdc++.h>
using namespace std;
#define nmax 100001

int main(){
	ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
	freopen("rcua.inp","r",stdin);
	freopen("rcua.out","w",stdout);

	int n; cin >> n;
	int a[nmax];
	for (int i = 1; i <= n; i++) cin >> a[i];

	int m = n;
	for (int i = 1; i <= m - 2; i++)
		if (!(a[i] < a[i + 1] && a[i + 1] > a[i + 2]) && !(a[i] > a[i + 1] && a[i + 1] < a[i + 2])) 
			n--;

	if (n == 1)
		if (m == 1) 
			cout << 0;
		else 
			cout << n - 1;
	else 
	if (n == 2)
		if (m == 2)
			if (a[0] != a[1]) 
				cout << 0; 
			else 
				cout << 1;
		else
		cout << m - 2;
	else
	cout << m - n;
      
	return 0;
}