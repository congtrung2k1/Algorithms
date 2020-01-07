#include <bits/stdc++.h>
using namespace std;
#define nmax 100010

int n,m, it[4 * nmax];
bool lz[4 * nmax];

void update(int i, int u, int v, int l, int r){
    if (lz[i]){
        lz[i] = false;
        it[i] = v - u + 1 - it[i];
        if (u < v) lz[2 * i] = !lz[2 * i],
                   lz[2 * i + 1] = !lz[2 * i + 1];
    }

    if (r < u || v < l) return;
    if (l <= u && v <= r){
        it[i] = v - u + 1 - it[i];
        if (u < v) lz[2 * i] = !lz[2 * i],
                   lz[2 * i + 1] = !lz[2 * i + 1];
        return;
    }
    int mid = (u + v) / 2;
    update(2 * i, u, mid, l, r);
    update(2 * i + 1, mid + 1, v, l, r);
    it[i] = it[2 * i] + it[2 * i + 1];
}

int dem(int i, int u, int v, int l, int r){
    if (lz[i]){
        lz[i] = false;
        it[i] = v - u + 1 - it[i];
        if (u < v) lz[2 * i] = !lz[2 * i],
                   lz[2 * i + 1] = !lz[2 * i + 1];
    }

    if (r < u || v < l) return 0;
    if (l <= u && v <= r) return it[i];
    int mid = (u + v) / 2;
    return dem(2 * i, u, mid, l, r) + dem(2 * i + 1, mid + 1, v, l, r);
}

int main(){
    cin >> n >> m;
    while (m--){
        int x,l,r; cin >> x >> l >> r;
        if (x) cout << dem(1,1,n,l,r) << '\n'; else update(1,1,n,l,r);
    }

    return 0;
}