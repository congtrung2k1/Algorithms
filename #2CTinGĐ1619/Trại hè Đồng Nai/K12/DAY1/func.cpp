#include <bits/stdc++.h>
using namespace std;
#define ll long long

ll k,r,p,q,m;

struct note{
    ll A[2][2];
};

ll nhan(ll a, ll b){
    if (b <= 0) return 0;
    ll t = nhan(a, b / 2);
    if (b & 1) return (t * 2 + a) % m; return (t * 2) % m;
}

note operator * (const note& a, const note& b){
    note c;
    for (int i = 0; i < 2; i++)
        for (int j = 0; j < 2; j++){
            c.A[i][j] = 0;
            for (int k = 0; k < 2; k++)
                c.A[i][j] = (c.A[i][j] + nhan(a.A[i][k], b.A[k][j])) % m;
        }
    return c;
}

note mul(note a, ll k){
    if (k <= 1) return a;
    note t = mul(a, k / 2);
    if (k & 1) return t * t * a; return t * t;
}

ll gcd(ll a, ll b){ return (b == 0) ? a : gcd(b, a % b); }

int main(){
    ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
    freopen("func.inp","r",stdin);
    freopen("func.out","w",stdout);

    while (cin >> k >> r >> p >> q >> m){
        ll t = gcd(p,q);
        p /= t; q /= t;
        if (k == 1){
            cout << p << ' ' << q << '\n';
            continue;
        }

        note def; def.A[0][0] = 0; def.A[0][1] = 1; def.A[1][0] = 1; def.A[1][1] = r;
        note ans = mul(def, k-1);
        cout << (nhan(p, ans.A[0][0]) + nhan(q, ans.A[1][0])) % m << ' ' << (nhan(p, ans.A[0][1]) + nhan(q, ans.A[1][1])) % m << '\n';
    }

    return 0;
}
