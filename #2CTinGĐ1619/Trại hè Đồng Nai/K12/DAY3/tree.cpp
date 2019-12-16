#include <bits/stdc++.h>
using namespace std;
#define ii pair<int, int>
#define fi first
#define se second
#define nmax 100001

int main(){
    ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
    freopen("tree.inp","r",stdin);
    freopen("tree.out","w",stdout);

    int n, d[nmax]; cin >> n;
    vector<ii> a;
    for (int i = 1; i <= n; i++) cin >> d[i], a.push_back(ii(d[i],i));
    sort(a.begin(), a.end());

    int i = 0, j = 1;
    for (; i < j; i++){
        while (a[j].fi == 1 && j < n) j++;
        if (j == n) break;
        a[j].fi--;
        cout << a[i].se << ' ' << a[j].se << '\n';
    }
    cout << a[i].se << ' ' << a[j-1].se;

    return 0;
}
