#include <bits/stdc++.h>

using namespace std;
#define ll long long

ll u,v;
vector<ll> res,r2;
ll setBit(ll x,ll k){
    x |= (1LL << k - 1);
    return x;
}
int main()
{
    freopen("sheldon.inp","r",stdin);
    freopen("sheldon.out","w",stdout);
    cin >> u >> v;
    for(int i = 1;i < 64;i++){
        for(int j = 0;j < 64;j++){
            ll x = 0;
            ll k = 0;

            while(k < 64){
                k += j + 1;
                for(int J = k;J <= k + i - 1;J++) x = setBit(x,J);
                res.push_back(x);
            }
            x = 0, k = 1;
            while(k < 64){
                for(int J = k;J <= k + i - 1;J++) x = setBit(x,J);
                k += j + 1;
                res.push_back(x);
            }
        }
    }
    sort(res.begin(),res.end());
    while(res[0] < 0) res.erase(res.begin());
    for(int i = 0;i < res.size();i++){
        ll j = i;
        while(res[j] == res[j + 1] && j < res.size()) j++;
        i = j;
        r2.push_back(res[i]);
    }
    ll l = upper_bound(r2.begin(),r2.end(),u) - r2.begin();
    ll r = lower_bound(r2.begin(),r2.end(),v) - r2.begin();
    if(r2[r] > v) r--;
    if(r2[l] < u) l++;
    if(r2[l - 1] >= u) l--;
    if(r2[r + 1] <= v) r++;

    cout << r - l + 1;

}
