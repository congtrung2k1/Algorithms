#include <bits/stdc++.h>
using namespace std;
#define ll unsigned long long
#define nmax 1000010
#define MOD 1000000007

int n;
ll a[nmax];

int main(){
    freopen("attack.inp","r",stdin);
    freopen("attack.out","w",stdout);

    cin >> n;
    for (int i = 1; i <= n; i++) cin >> a[i];
    sort(a + 1, a + n + 1);
    
    ll res = 0, x = a[1];
    for (int i = 2; i <= n; i++) 
        res += ((1LL << (i - 1)) - 1) * a[i] - x,
        x = 2 * x + a[i];
    cout << res;

    return 0;
}