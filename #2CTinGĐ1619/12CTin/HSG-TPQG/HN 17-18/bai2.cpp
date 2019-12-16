#include <bits/stdc++.h>
using namespace std;
typedef long long ll;

int main()
{
    ll n,m,a[100000],b[100000];

    ifstream inp;    inp.open("bai2.inp");
    inp >> m >> n;
    for (ll i=0; i<m; i++) inp >> a[i];
    for (ll i=0; i<n; i++) inp >> b[i];
    sort(a, a+m); sort(b, b+n);

    ll dem = 0, i = 0, j = lower_bound(a, a+m, b[0]) - a;
    bool fre[100000]; memset(fre, true, sizeof(fre));
    for (ll k = 0; k<n; k++)
    {
        while (i<m && !fre[i]) i++;
        while (j<m && (!fre[j] || a[j]<=b[k])) j++;
        if (a[i] < b[k] && i < m && j < m)
        {
                fre[i] = false;
                fre[j] = false;
                dem++;
        }
    }

    ofstream out;    out.open("bai2.out");
    out << dem << endl;

    return 0;
}