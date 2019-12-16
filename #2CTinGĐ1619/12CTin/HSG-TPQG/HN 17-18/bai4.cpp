#include <bits/stdc++.h>

using namespace std;
typedef long long ll;

vector<ll> a[1000001];

ll dfs(ll u)
{
    ll s = 1;
    for (ll i = 0; i < a[u].size(); i++)
        s = (s * dfs(a[u][i])) % 1000000007;
    return s+1;
}

int main() {
    ifstream inp; inp.open("bai4.inp");

    ll n;
    inp >> n;
    for (ll i = 1; i < n; i++)
    {
        ll x;
        inp >> x;
        a[x].push_back(i);
    }
    inp.close();

    ofstream out; out.open("bai4.out");
    out << dfs(n) - 1 << endl;
    out.close();

    return 0;
}
