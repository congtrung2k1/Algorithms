#include <bits/stdc++.h>
using namespace std;
#define ll long long
#define nmax 100001

int n;

struct POINT{
    ll x,y;
    POINT() { x = y = 0; }
    POINT(ll x, ll y): x(x), y(y) {}

    POINT operator +(const POINT& a) { return POINT(x + a.x, y + a.y); }
    POINT operator -(const POINT& a) { return POINT(x - a.x, y - a.y); }
    ll operator *(const POINT& a) { return x * a.y - y * a.x; }
    ll operator %(const POINT& a) { return x * a.x + y * a.y; }

    ll len(){ return x*x + y*y; }
} a[nmax], save[nmax], A;

bool ccw(POINT a, POINT b, POINT c){
    return (b - a) * (c - b) > 0;
}

bool cmp(POINT B, POINT C){
    POINT u = B - A, v = C - A;
    ll tmp =  u * v;
    return tmp > 0 || tmp == 0 && u.len() < v.len();
}

int main(){
    ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
    freopen("convexhull.inp","r",stdin);
    freopen("convexhull.out","w",stdout);

    cin >> n;
    for (int i = 0; i < n; i++){
        ll u,v; cin >> u >> v;
        a[i] = POINT(u,v);
    }

    int c = 0;
    for (int i = 1; i < n; i++)
        if (a[c].y > a[i].y || (a[c].y == a[i].y && a[c].x > a[i].x)) c = i;
    A = a[c]; a[c] = a[0]; a[0] = A;

    sort(a + 1, a + n, cmp);

    int m = 0;
    for (int i = 0; i < n; i++){
        while (m >= 2 && !ccw(save[m - 2], save[m - 1], a[i])) --m;
        save[m++] = a[i];
    }

    ll sum = 0; save[m] = save[0];
    for (int i = 0; i < m; i++) sum += save[i] * save[i + 1];
    cout << m << '\n';
    cout << abs(sum) / 2 << '.' << (sum % 2 == 0 ? 0 : 5) << "\n";
    for (int i = 0; i < m; i++) cout << save[i].x << " " << save[i].y << "\n";

    return 0;
}
