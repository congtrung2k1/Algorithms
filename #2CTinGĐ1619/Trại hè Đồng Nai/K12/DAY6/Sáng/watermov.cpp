#include <bits/stdc++.h>
using namespace std;
#define ll long long

const int nmax = 1e6 + 1;

struct POINT{
	int x; ll y;
	inline POINT operator - (const POINT& a) const { return {x - a.x, y - a.y}; }
	inline ll operator * (const POINT& a) const { return x * a.y - y * a.x; }
} a[nmax], hull[nmax];

inline int read(){
	char c;
	for (c = getchar(); c < '0' || c > '9'; c = getchar());
	int re = c - '0';
	for (c = getchar(); c >= '0' && c <= '9'; c = getchar()) re = re * 10 + c - '0';
	return re;
}

inline void write(ll x){
	if (x > 9) write(x / 10);
	putchar(x % 10 + '0');
}

inline bool ccw(const POINT& a, const POINT& b, const POINT& c){
	return (b - a) * (c - b) > 0;
}

inline ll tinh(const POINT& a, const POINT& b, const POINT& c){
	return -((b - a) * (c - b));
}

int main(){
	ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
	freopen("watermov.inp","r",stdin);
	freopen("watermov.out","w",stdout);

	int n = read();
	a[0] = {0, 0};
	for (int i = 1; i <= n; i++) a[i] = {i, a[i - 1].y + read()};

	ll ans = 0;
	int cnt = 0;
	for (int i = 0; i <= n; i++){
		while (cnt >= 2 && !ccw(hull[cnt - 1], hull[cnt], a[i])){
			ans += tinh(hull[cnt - 1], hull[cnt], a[i]);
			cnt--;
		}
		hull[++cnt] = a[i];
	}

	write(ans / 2);
	putchar('.');
	write((ans & 1 ? 5 : 0));

	return 0;
}