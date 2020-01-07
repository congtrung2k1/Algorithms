/* Ternary Search */
#include <iostream>
#include <iomanip>
#include <cmath>
#define esp 1e-16
#define maxn 100100
using namespace std;
long double l,r,m1,m2;
int a[maxn];
int v[maxn];
int n;

long double get(long double time)
{
    long double ll = a[1]+v[1]*time;
    long double rr = a[1]+v[1]*time;
    for (int i=2; i<=n; i++)
    {
        ll = min(ll,a[i]+v[i]*time);
        rr = max(rr,a[i]+v[i]*time);
    }
    return ((rr-ll)/2);
}

int main()
{
    ios::sync_with_stdio(false);
    cin>>n;
    for (int i=1; i<=n; i++) cin>>a[i];
    for (int i=1; i<=n; i++) cin>>v[i];
    l = 0;
    r = 1e9 + 1;

    while (l<=r-esp)
    {
        m1 = l + (r-l)/3;
        m2 = r - (r-l)/3;
        long double res1 = get(m1);
        long double res2 = get(m2);
        if (res1<=res2) r = m2;
        else
            l = m1;
    }
    long double res = get(l);
    int nm;
    if (res==0) nm = 0;
    else
        nm = log10(res)+1;
    nm+=3;
    cout.precision(nm);
    cout<<res;
    return 0;
}
