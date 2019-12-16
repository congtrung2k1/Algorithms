#include <iostream>
#include <stdio.h>
#include <algorithm>
using namespace	std;
#define ll long long

struct type{
	int luong, chua;
} a[1000001];

bool cmp(type a, type b){
	return a.chua < b.chua;
}

int n;
ll sum;

int main() {
	ios_base::sync_with_stdio(false); cin.tie(0); cout.tie(0);
	freopen("water.inp","r",stdin);
	freopen("water.out","w",stdout);

	cin >> n;
	for (int i = 1; i <= n; i++) {
		ll x,k; cin >> x >> k;
		a[i].luong = x;
		a[i].chua = k;
		sum += x;
	}
	sort(a + 1, a + n + 1, cmp);

	int i = 1;
	for ( ; i <= n; i++)
		if (sum >= a[i].chua) sum -= a[i].chua; else break;	

	cout << n - i + 1;
}