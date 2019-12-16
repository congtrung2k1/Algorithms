#include <bits/stdc++.h>

using namespace std;
typedef long long ll;

int main() {
    ifstream inp; inp.open("bai3.inp");

    ll n,t;
    inp >> n;
    pair <int, int> pa[n];
    for (int i = 0; i < n; i++)
    {
        ll x, v;
        inp >> x >> v;
        pa[i] = make_pair(x, v);
    }

    inp >> t;
    sort(pa, pa+n);
    stack <int> st;
    ll dem = 0;
    for (ll i = 0; i < n; i++)
        if (pa[i].second == 1) st.push(pa[i].first);
        else if (!st.empty())
             {
                ll x = st.top(), y = pa[i].first;
                if ((ll)(y-x)/2 <= t)
                {
                    dem += 2;
                    st.pop();
                }
             }

    ofstream out; out.open("bai3.out");
    out << n-dem << endl;
    out.close();
    return 0;
}
