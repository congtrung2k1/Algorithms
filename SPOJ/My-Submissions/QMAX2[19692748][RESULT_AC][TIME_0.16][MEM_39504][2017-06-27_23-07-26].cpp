#include <bits/stdc++.h>
using namespace std;

typedef long long ll;

ll n,m;
ll A[1000000], it[1000000], lp[1000000];



void update(ll i, ll l, ll r, ll u, ll v, ll k){
    if (l>r) return;

    if (lp[i] != 0){
        it[i] += lp[i];
        // k là lá
        if (l!=r) {
            lp[2*i] += lp[i];
            lp[2*i+1] += lp[i];
        }
        lp[i] = 0;
    }

    if (r < u || v < l) return;

    if (u <= l && r <= v){
        it[i] += k;
        if (l!=r) {
            lp[2 * i] += k;
            lp[2 * i + 1] += k;
        }
        return;
    }

    ll mid = (l+r) / 2;
    update(2*i , l , mid , u , v , k);
    update(2*i+1, mid+1 , r , u , v , k);

    it[i] = max(it[2*i] , it[2*i+1]);
}

ll query(ll i, ll l, ll r, ll u, ll v){
    if (l>r) return 0;

    if (lp[i] != 0){
        it[i] += lp[i];
        if (l!=r){
            lp[2*i] += lp[i];
            lp[2*i+1] += lp[i];
        }
        lp[i] = 0;
    }

    if (r < u || v < l) return 0;
    if (u <= l && r <= v) return it[i];

    ll mid = (l+r) / 2;
    ll tinh = max(query(2*i, l, mid, u, v) , query(2*i+1, mid+1, r, u, v));
    return tinh;
}

int main(){
    cin >> n >> m;

    for (int i=0; i<m; i++) {
        int u, v;
        cin >> u;
        if (u) {
            cin >> u >> v;
            cout << query(1,1,n,u,v) << endl;
        } else {
            ll k;
            cin >> u >> v >> k;
            update(1, 1, n, u, v, k);
        }
    }

    return 0;
}