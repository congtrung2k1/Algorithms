#include <bits/stdc++.h>
using namespace std;
#define ll unsigned long long

ll x,n,m,k;

ll nhan(ll a, ll b){
    if (b == 0) return 0;
    ll t = nhan(a, b / 2);
    if (b & 1) return (2 * t + a) % m; else return (2 * t) % m;
}

ll mul(ll b){
    if (b == 0) return 1;
    ll t = mul(b/2);
    if (b & 1) return ((nhan(t,t) % m) * 10) % m;
    return nhan(t,t) % m;
}

int main(){
    freopen("digit.inp","r",stdin);
    freopen("digit.out","w",stdout);

    cin >> n >> m >> k;
    cout << (nhan(n % m, mul(k-1)) % m) * 10 / m;

    return 0;
}

