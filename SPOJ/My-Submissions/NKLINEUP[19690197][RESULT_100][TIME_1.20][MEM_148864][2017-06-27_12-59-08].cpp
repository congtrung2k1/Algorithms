#include <bits/stdc++.h>

using namespace std;

typedef long long ll;

ll n,m,l,r;
ll A[1000000], vma[1000000*4], vmi[1000000*4], tr[1000000*4], ph[1000000*4];

void build(ll i, ll l, ll r){
    tr[i] = l; ph[i] = r;

    if (l==r) {vma[i] = A[l]; vmi[i] = A[l];}
    else{
            ll mid = (l+r)/2;
            build(2*i,l,mid); build(2*i+1,mid+1,r);
            vma[i] = max(vma[2*i], vma[2*i+1]);
            vmi[i] = min(vmi[2*i], vmi[2*i+1]);
        }
}

ll query(ll i){
    if (ph[i] < l || r < tr[i]) return LLONG_MIN;
    if (l <= tr[i] && ph[i] <= r) return vma[i];

    ll tinh = max(query(2*i), query(2*i+1));
    return tinh;
}

ll query2(ll i){
    if (ph[i] < l || r < tr[i]) return LLONG_MAX;
    if (l <= tr[i] && ph[i] <= r) return vmi[i];

    ll tinh = min(query2(2*i), query2(2*i+1));
    return tinh;
}

int main(){
    ios::sync_with_stdio(false);
    cin.tie(0);

    cin >> n >> m;
    for (int i=1; i<=n; i++) cin >> A[i];

    build(1,1,n);

    while (m>0){
        --m;
        cin >> l >> r;
        cout << query(1) - query2(1) << endl;
    }

    return 0;
}