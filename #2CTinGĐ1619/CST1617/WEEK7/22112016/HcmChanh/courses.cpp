#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <cmath>
#include <cstring>
#include <algorithm>
using namespace std;
const int N = (int)1e5 + 7;
int n;
string a[N];
bool check(string a, string b)
{
    int l = min(a.size(), b.size());
    for(int i = 0; i < l; i++)
    if(a[i] != b[i]) return false;
    return true;
}
void solve()
{
    cin >> n;
    for(int i = 0; i < n; i++) cin >> a[i];
    sort(a, a + n);
    int rs = 1;
    for(int i = 1; i < n; i++)
    if(!check(a[i], a[i - 1]))
    {
        rs++;
    }
    cout << rs;
}
int main()
{
    freopen("courses.inp", "r", stdin);
    freopen("courses.out", "w", stdout);
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    int T;
    cin >> T;
    while(T--)
    {
        solve();
        cout << "\n";
    }
    return 0;
}
