#include <bits/stdc++.h>
using namespace std;
#define nMax 60000

int it[4 * nMax];

void update(int i, int l, int r, int x){
    if (l > r || x < l || x > r) return;
    if (l == r){
        it[i]++;
        return;
    }

    int m = (l + r) >> 1;
    update(2 * i, l, m, x);
    update(2 * i + 1, m + 1, r, x);
    it[i] = it[2 * i] + it[2 * i + 1];
}

int get(int i, int u, int v, int l, int r){
    if (l > r) return 0;
    if (r < u || v < l) return 0;
    if (u <= l && r <= v) return it[i];

    int m = (l + r) >> 1;
    return get(2 * i, u, v, l, m) + get(2 * i + 1, u, v, m + 1, r);
}

int main(){
    int n,ans = 0; cin >> n;
    for (int i = 0; i < n; i++){
        int x; cin >> x;
        ans += get(1, x + 1, nMax, 1, nMax);
        update(1, 1, nMax, x);
    }

    cout << ans;
    return 0;
}
