#include <bits/stdc++.h>

using namespace std;
#define ll long long
typedef pair<ll,ll> ii;
ll n;
set<ii> s;
int main()
{
    freopen("tree.inp","r",stdin);
    freopen("tree.out","w",stdout);
    cin >> n;
    for(int i = 1,x;i<=n;i++)
        cin >> x,s.insert(ii(x,i));
    while(s.size() > 0){
        ii mmin = *s.begin();
        ii mmax = *s.rbegin();
        s.erase(mmin);
        s.erase(mmax);
        cout << mmin.second << " " << mmax.second << "\n";
        if(mmin.first > 1) s.insert(ii(mmin.first-1,mmin.second));
        if(mmax.first > 1) s.insert(ii(mmax.first-1,mmax.second));
    }
    return 0;
}
