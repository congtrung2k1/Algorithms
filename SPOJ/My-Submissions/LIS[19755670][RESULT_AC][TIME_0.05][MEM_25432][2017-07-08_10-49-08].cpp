#include <bits/stdc++.h>
using namespace std;

typedef long long ll;

ll A[300001], B[300001], C[300001], t[300001],n,maxx;

void qsort(ll l, ll r)
{
    ll i = l, j = r, mid = B[(int) (l + r) / 2];
    do
    {
        while (B[i] < mid) i++;
        while (B[j] > mid) j--;

        if (i<=j) {
            ll t = B[i]; B[i] = B[j]; B[j] = t;
               t = C[i]; C[i] = C[j]; C[j] = t;
            i++; j--;
        }
    }while (i<=j);
    if (l < j) qsort(l,j);
    if (i < r) qsort(i,r);
}

ll get(ll x)
{
    if (x==0) return 0;
    ll re=0;
    while (x>0)
    {
        re = max(re,t[x]);
        x -= x & (-x);
    }
    return re;
}

void update(ll x, ll val)
{
    while (x<=n)
    {
        t[x] = max(t[x],val);
        x += x & (-x);
    }
    return;
}

int main(){
    cin >> n;
    for (ll i=1; i<=n; i++)
    {
        cin >> B[i];
        C[i] = i;
    }

    qsort(1,n);

    ll dem = 1; A[C[1]] = dem;
    for (ll i = 2; i<=n; i++)
    {
        if (B[i-1] < B[i]) dem++;
        A[C[i]] = dem;
    }

    dem = 0;
    for (ll i=1; i<=n; i++)
    {
        maxx = get(A[i] - 1) + 1;
        update(A[i], maxx);
        dem = max(dem,maxx);
    }

    cout << dem << endl;
    return 0;
}