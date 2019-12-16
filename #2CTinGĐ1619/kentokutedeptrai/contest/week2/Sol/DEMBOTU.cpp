#include <bits/stdc++.h>

using namespace std;
typedef long long ll;

ll m,n,p,q,x,smin,smax;
ll a[10000], b[10000], c[20000];

void init()
{
    cin >> m >> n >> p >> q;
    for (ll i = 0; i<m; i++) cin >> a[i];
    for (ll i = 0; i<n; i++) cin >> b[i];
    x = -1;
    for (ll i = 0; i<m; i++)
        for (ll j = 0; j<n; j++)
        {
            x++;
            c[x] = a[i] + b[j];
        }
    x++;
    sort(c,c+x);
    for (ll i = 0; i<p; i++) cin >> a[i];
    for (ll i = 0; i<q; i++) cin >> b[i];
}

int main()
{
	init();

	ll dem = 0;
	for (ll i = 0; i<p; i++)
        for (ll j = 0; j<q; j++)
        {
            smin = lower_bound(c,c+x,a[i]+b[j]) - c;
            smax = upper_bound(c,c+x,a[i]+b[j]) - c;
            dem += smax - smin;
        }

	cout << dem << endl;
	return 0;
}