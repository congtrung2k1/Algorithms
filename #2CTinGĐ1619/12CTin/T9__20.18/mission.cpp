#include <bits/stdc++.h>
using namespace std;
#define ll unsigned long long
#define nmax 100001

int n;
ll dp[nmax], bit[nmax];

struct type{
    int x,y;
    ll c;
    bool operator < (const type& a) {
        return (x < a.x) || (x == a.x && y < a.y);
    }
} a[nmax];

inline ll get(int i) {
    ll re = 0; 
    for (; i >= 0; i = (i & (i + 1)) - 1) re = max(re, bit[i]);
    return re;
}

inline void update(int i, ll val) {
    for (; i <= nmax; i = i | (i + 1)) bit[i] = max(bit[i], val); 
}

int main(){
    freopen("mission.inp","r",stdin);
    freopen("mission.out","w",stdout);

    cin >> n;
    for (int i = 1; i <= n; i++) cin >> a[i].x >> a[i].y >> a[i].c;
    sort(a + 1, a + n + 1);
    
    vector<int> c;
    for (int i = 1; i <= n; i++)
        c.push_back(a[i].x),
        c.push_back(a[i].y);
    sort(c.begin(), c.end());

    ll ans = 0;
    for (int i = 1; i <= n; i++) {
        int p = lower_bound(c.begin(), c.end(), a[i].x - 1) - c.begin() + 1;
        if (c[p - 1] >= a[i].x) p--;
        dp[i] = a[i].c + get(p);
        ans = max(ans, dp[i]);
        p = lower_bound(c.begin(), c.end(), a[i].y) - c.begin() + 1;
        update(p, dp[i]);
    }

    cout << ans;

    return 0;
}