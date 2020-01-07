#include <bits/stdc++.h>
using namespace std;
#define nMax 30010

pair<int, int> p[nMax];
int n, ans, a[nMax], bit[nMax];

int get(int x){
    int re = 0;
    if (x == 0) return 0;
    for (; x; x -= x & -x) re = max(re , bit[x]);
    return re;
}
void update(int x, int t){
    for (; x <= n; x += x & -x) bit[x] = max(bit[x] , t);
}

int main(){
    ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
    //freopen("input.inp","r",stdin);

    cin >> n;
    for (int i = 1; i <= n; i++) cin >> p[i].first , p[i].second = i;
    sort(p + 1, p + n + 1);

    int d = 1; a[p[1].second] = 1;
    for (int i = 2; i <= n; i++){
        if (p[i].first != p[i-1].first) d++;
        a[p[i].second] = d;
    }

    for (int i = 1; i <= n; i++){
        int t = get(a[i] - 1) + 1;
        ans = max(ans , t);
        update(a[i] , t);
    }

    cout << ans;

    return 0;
}
