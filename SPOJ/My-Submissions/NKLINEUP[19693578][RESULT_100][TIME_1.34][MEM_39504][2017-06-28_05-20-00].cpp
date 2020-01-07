#include <bits/stdc++.h>
using namespace std;

typedef long long ll;

ll n,m,l,r;
ll A[1000000], vma[1000000], vmi[1000000];

void build(ll i, ll l, ll r){
    if (l==r){
        vma[i] = A[l];
        vmi[i] = A[l];
    }
    else
    {
        ll mid = (l+r) / 2;
        build(2*i, l, mid);
        build(2*i+1, mid+1, r);
        vma[i] = max(vma[2*i], vma[2*i+1]);
        vmi[i] = min(vmi[2*i], vmi[2*i+1]);
    }
}

ll query(ll i, ll u, ll v){
    if (v < l || r < u) return -LLONG_MAX;
    if (l <= u && v <= r) return vma[i];

    ll mid = (u+v) / 2;
    ll tinh = max(query(2*i,u,mid) , query(2*i+1, mid+1, v));
    return tinh;
}

ll query2(ll i, ll u, ll v){
    if (v < l || r < u) return LLONG_MAX;
    if (l <= u && v <= r) return vmi[i];

    ll mid = (u+v) / 2;
    ll tinh = min(query2(2*i,u,mid) , query2(2*i+1, mid+1, v));
    return tinh;
}

int main(){
    cin >> n >> m;
    for (ll i=1; i<=n; i++) cin >> A[i];

    build(1,1,n);

    for (ll i=1; i<=m; i++)
    {
        cin >> l >> r;
        cout << query(1,1,n) - query2(1,1,n) << endl;
    }

    return 0;
}