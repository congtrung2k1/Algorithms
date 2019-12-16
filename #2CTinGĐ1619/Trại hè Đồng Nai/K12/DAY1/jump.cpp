#include <bits/stdc++.h>
using namespace std;
#define ll long long

int n,k,m,lua[2000000],snt[2000000],f[1000005][105];
vector<ll> st;
ll calc(){
     ll res = 1;
     for(int i = 0;i<st.size();i++)
        for(int j = 1;j<=lua[st[i]];j++) res = (res * st[i]) % m;
    return res;
}
void pt1(ll x){
    while(x > 1){
        ll tmp = snt[x];
        ++lua[tmp];
        x /= tmp;
    }
}
void pt2(ll x){
    while(x > 1){
        ll tmp = snt[x];
        --lua[tmp];
        x /= tmp;
    }
}
ll trans(ll F){
    ll tu = k - F,mau = F + 1;
    pt2(mau);
    pt1(tu);
}
ll dp(ll i,ll K){
    if(f[i][K] != -1) return f[i][K];
    if(K == 0){
        if(i == 0) return 1; else
        return 0;
    }
    f[i][K] = (dp((i-1+n) % n,K-1) + dp((i+1)% n,K-1))%m;
    return f[i][K];
}
int main()
{
    for(int i = 1;i<=1000000;i++) snt[i] = i;
    for(int i = 2;i<=sqrt(1000000);i++)
        if(snt[i] == i)
            for(int j = 2;j<=1000000/i;j++) snt[i*j] = i;
    for(int i = 2;i<=1000000;i++) if(snt[i] == i) st.push_back(i);
    freopen("JUMP.inp","r",stdin);
    freopen("JUMP.out","w",stdout);
    memset(f,-1,sizeof f);
    ll res = 0;
    cin >> n >> k >> m;
    if(n <= 100){
        cout << dp(0,k) %m;
        return 0;
    }
    for(int i = 0;i<=k;i++){
        ll b = k - i;
        if(abs(i - b) % n == 0) res = (res + calc()) % m,trans(i); else trans(i);
    }
    cout << res % m;
}
