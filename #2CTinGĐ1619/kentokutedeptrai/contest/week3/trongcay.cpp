#include <bits/stdc++bits/stdc++.h>
using namespace std;
typedef long long ll;

map<string, ll> canh,sl;

string doi(ll x, ll y)
{
    stringstream a; a << x;
    stringstream b; b << y;
    return a.str()+"-"+b.str();
}

void init()
{
    ifstream inp; inp.open("C:\\Users\\Administrator\\Desktop\\New folder\\trongcay.inp")
    inp >> n >> m;
    for (ll i = 0; i<m; i++)
    {
        ll u,v,g;
        inp >> u >> v >> g;
        string s = doi(u,v);
        if (canh[m].empty() || canh[m] > g)
        {
            canh[m] = g;
            sl[m] = 1;
        }
        else if (g=canh[m]) sl[m]++;
    }
    inp.close();
}

int main()
{
    init();







}
