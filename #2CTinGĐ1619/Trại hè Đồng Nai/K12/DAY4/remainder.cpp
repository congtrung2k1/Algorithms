#include <bits/stdc++.h>
using namespace std;
#define ll unsigned long long

ll t,x,n,m;

ll mul(ll x, ll y){
	x %= m; y %= m;
	ll q = (long double) x * y / m;
	ll r = (x * y - q * m) % m;
	if (r < 0) r += m;
	return r;
}

ll mu(ll k, ll n){
	if (n == 1) return 1;
	if (n & 1) 
		return (1 + mul(k, mu(k, n - 1))) % m;
	else 
		return mul(k + 1, mu(mul(k, k), n / 2));
}

int main(){
	ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
	freopen("remainder.inp","r",stdin);
	freopen("remainder.out","w",stdout);

	cin >> t;
	while (t--){
		cin >> x >> n >> m;

		ll k = 1; 
		for (ll temp = x; temp > 0; temp /= 10) k = (ll)k * 10UL % (ll)m;
		cout << mul(x, mu(k, n)) << "\n";
	}

	return 0;
}