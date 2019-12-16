#include <iostream>
#include <string.h>
using namespace std;
#define ll long long

int k, x[22];
    
inline bool same(int n, int l) {
    int a = n, b = n - l, c = n - 2 * l;
    for (int i = 0; i < l; i++)
        if (x[a - i] != x[b - i] || x[b - i] != x[c - i]) return false;
    return true;
}

inline bool check(int l) {
    for (int i = 1; i <= l / 3; i++)
        if (same(l,i)) return false;
    return true;
}

ll tinh(int i, int u) {
    if (i > k) return 1;

    ll re = 0;
    x[i] = 0;
    if (check(i)) re += tinh(i + 1, 0);
    
    if (u == 0) {
        x[i] = 1;
        if (check(i)) re += tinh(i + 1, 1);
    }

    return re;
}

int main(){
    freopen("mumba.inp","r",stdin);
    freopen("mumba.out","w",stdout);

    cin >> k;
    if (k <= 16) {
        x[1] = 0;
        ll ans = tinh(2,0);
        x[1] = 1;
        ans += tinh(2,1);
        cout << ans << endl;
    }
}