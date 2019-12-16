#include <bits/stdc++.h>
using namespace std;
#define ld long double

int n,m;

struct POINT {
	ld x,y;
	POINT(){ x = y = 0; }
	POINT(ld X, ld Y): x(X), y(Y) {}

	POINT operator + (const POINT& a) {return POINT(x + a.x, y + a.y);}
	POINT operator - (const POINT& a) {return POINT(x - a.x, y - a.y);}
	ld operator * (const POINT& a) {return x * a.y - y * a.x;}
	ld len() {return x * x + y * y;}
} a[10000], b[50000], hull[10000], A;

bool ccw(POINT a, POINT b, POINT c) {
	return (b - a) * (c - b) > 0;
}

bool cmp(POINT B, POINT C) {
	POINT u = B - A, v = C - A;
	return u * v > 0 || u * v == 0 && u.len() < v.len();
}

int main() {
	ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
	freopen("input.inp","r",stdin);
	freopen("input.out","w",stdout);

	cin >> n;
	for (int i = 0; i < n; i++) {
		ld u,v; cin >> u >> v;
		a[i] = POINT(u,v);
	}
	cin >> m;
	for (int i = 1; i <= m; i++) {
		ld u,v; cin >> u >> v;
		b[i] = POINT(u,v);
	}

	int c = 0;
	for (int i = 2; i < n; i++) 
		if (a[c].y > a[i].y || a[c].y == a[i].y && a[c].x > a[i].x) c = i;
	A = a[c]; a[c] = a[0]; a[0] = A;

	sort(a + 1, a + n, cmp);

	int s = 0; 
	for (int i = 0; i < n; i++){
		while (s > 1 && !ccw(hull[s - 2] , hull[s - 1], a[i])) s--;
		hull[s++] = a[i];
	}


}