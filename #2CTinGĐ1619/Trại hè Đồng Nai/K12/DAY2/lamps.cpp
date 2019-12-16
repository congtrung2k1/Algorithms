#include <bits/stdc++.h>
using namespace std;
#define nmax 50

int n,T;
map<int,int> mp;
vector<int> a[nmax], ans;

void dp(int u, int val, int C){
    if (u == n / 2){
        mp[C] = val;
        return;
    }
    dp(u + 1, val, C);
    val |= (1 << u);
    C ^= (1 << u);
    for (int i = 0; i < a[u].size(); i++) C ^= (1 << a[u][i]);
    dp(u + 1, val, C);
}

void check(int u, int val, int C){
    if ((int)ans.size() > 0) return;
    if (u == n){
        C = ((1 << n) - 1) ^ C;
        if (mp.count(C)){
            for (int i = 0; i < n / 2; i++)
                if(mp[C] & (1 << i)) ans.push_back(i + 1);
            for (int i = n / 2; i < n; i++)
                if (val & (1 << i)) ans.push_back(i + 1);
        }
        return;
    }

    check(u + 1, val, C);
    val |= (1 << u);
    C ^= (1 << u);
    for (int i = 0; i < a[u].size(); i++) C ^= (1 << a[u][i]);
    check(u + 1, val, C);
}

int main(){
    ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
    freopen("lamps.inp","r",stdin);
    freopen("lamps.out","w",stdout);
    cin >> n >> T;
    for (int i = 1; i < n; i++){
        int u,v; cin >> u >> v;
        u--; v--;
        a[u].push_back(v);
        a[v].push_back(u);
    }
    while (T--){
        mp.clear();
        ans.clear();
        int cast = 0;
        for (int x, i = 0; i < n; i++){
            cin >> x;
            if (x > 0) cast |= (1 << i);
        }
        dp(0, 0, cast);
        check(n / 2, 0, 0);
        int k = (int)ans.size();
        if (k < 1) {
            cout << -1 << '\n';
        } 
        else {
            cout << k << '\n';
            for (int i = 0; i < k; i++) cout << ans[i] << ' ';
            cout << '\n';
        }
    }

    return 0;
}

