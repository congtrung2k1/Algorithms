#include <bits/stdc++.h>
using namespace std;
#define ll long long
#define nmax 5005
#define oo 1e20

struct ds{
    int n,m;
    ll A[35][35];
    ds() { memset(A,0,sizeof(A)); }
}def, ans;

char st,en;
ll k,base;
int hcn[24][2] = {{1,2},{1,4},{1,5},{2,1},{2,3},{2,6},{3,2},{3,4},{3,7},{4,1},{4,3},{4,8},{5,1},{5,6},{5,8},{6,2},{6,5},{6,7},{7,3},{7,6},{7,8},{8,4},{8,5},{8,7}};

ds operator * (const ds& a, const ds& b){
    ds c;
    c.n = a.n; c.m = b.m;
    for (int i = 0; i < a.n; i++)
        for (int j = 0; j < b.m; j++)
            for (int k = 0; k < a.m; k++)
                c.A[i][j] = (c.A[i][j] + a.A[i][k] * b.A[k][j]) % base;
    return c;
}

void init(){
    def.n = 24;
    def.m = 24;
    for (int i = 0; i < 24; i++)
        for (int j = 0; j < 24; j++)
            if (hcn[i][1] == hcn[j][0] && hcn[i][0] != hcn[j][1]) def.A[i][j] = 1;
}

ds tinh(ds a, ll k){
    if (k == 1) return a;
    ds tmp = tinh(a, k / 2);
    if (k % 2 == 0) return tmp * tmp;
    return tmp * tmp * a;
}

int main(){
    ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);

    cin >> st >> en >> k >> base;
    st = st - 'A' + 1;
    en = en - 'A' + 1;

    init();
    ans.n = 1; ans.m = 24;
    for (int i = 0; i < 24; i++) ans.A[0][i] = (hcn[i][0] == st);
    if (k > 1) ans = ans * tinh(def, k - 1);

    ll res = 0;
    for (int i = 0; i < 24; i++)
        if (hcn[i][1] == en) res = (res + ans.A[0][i]) % base;

    cout << res;
    return 0;
}
