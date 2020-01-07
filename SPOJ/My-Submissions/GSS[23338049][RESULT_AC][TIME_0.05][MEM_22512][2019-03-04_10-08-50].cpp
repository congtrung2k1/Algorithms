#include <bits/stdc++.h>
using namespace std;
#define ll long long
#define oo -100000000001

struct type{
    ll ans, left, right, sum;
} it[4 * 50001];

int n,q,u,v, a[50001];

type cal(const type& q, const type& w) {
    type re;
    re.sum = q.sum + w.sum;
    re.left = max(q.left , q.sum + w.left);
    re.right = max(q.right + w.sum , w.right);
    re.ans = max(q.ans , max(w.ans , (q.right + w.left)));
    return re;
}

void build(int i, int l, int r) {
    if (l == r) {
        it[i].ans = a[l];
        it[i].left = a[l];
        it[i].right = a[l];
        it[i].sum = a[l];
        return;
    }

    int m = (l + r) / 2;
    build(2 * i, l, m);
    build(2 * i + 1, m + 1, r);
    it[i] = cal(it[2 * i] , it[2 * i + 1]);
}

type get(int i, int l, int r) {
    if (v < l || r < u) return {oo, oo, oo, 0LL};
    if (u <= l && r <= v) return it[i];

    int m = (l + r) / 2;
    return cal( get(2 * i, l, m) , get(2 * i + 1, m + 1, r) );
}

int main() {
    ios_base::sync_with_stdio(false); cin.tie(0); cout.tie(0);

    cin >> n;
    for (int i = 1; i <= n; i++) cin >> a[i];
    build(1,1,n);

    cin >> q;
    for (int i = 1; i <= q; i++) {
        cin >> u >> v;
        cout << get(1,1,n).ans << '\n';
    }
}