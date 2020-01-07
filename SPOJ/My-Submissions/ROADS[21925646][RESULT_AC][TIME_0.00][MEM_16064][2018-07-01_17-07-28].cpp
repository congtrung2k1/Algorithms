#include <bits/stdc++.h>
using namespace std;
#define ll long long
#define ii pair<ll, ll>
#define iii pair<ll, ii>
#define fi first
#define se second
#define oo 1e18

int main(){
    ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);

    int q; cin >> q;
    while (q--){
        ll n,k,m; cin >> k >> n >> m;
        vector<iii> a[1001];
        for (int i = 0; i < m; i++){
            ll u,v,l,c;
            cin >> u >> v >> l >> c;
            a[u].push_back(iii(v, ii(l,c)));
        }

        ll ans = -1;
        priority_queue<iii, vector<iii>, greater<iii>> heap;
        heap.push(iii(0,ii(1,0)));
        while (!heap.empty()){
            ll lu = heap.top().fi, u = heap.top().se.fi, cu = heap.top().se.se; heap.pop();
            if (cu > k) continue;
            if (u == n) {
                ans = lu;
                break;
            }

            for (iii tmp: a[u]){
                ll v = tmp.fi, l = tmp.se.fi, c = tmp.se.se;
                if (cu + c <= k) heap.push(iii(lu + l, ii(v, cu + c)));
            }
        }

        cout << ans << '\n';
    }

    return 0;
}
