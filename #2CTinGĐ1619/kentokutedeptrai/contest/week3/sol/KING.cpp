#include <bits/stdc++.h>

using namespace std;
typedef long long ll;

ll sx,sy,ex,ey,ans = -1;
map<string , bool> ok;

string doi(ll x, ll y)
{
    stringstream a; a << x;
    stringstream b; b << y;
    return a.str()+"-"+b.str();
}

void init()
{
    ifstream inp; inp.open("king.inp");

    ll n,x,u,v;
    inp >> sx >> sy >> ex >> ey >> n;
    for (ll i=1; i<=n ; i++)
    {
        inp >> x >> u >> v;
        for (ll j=u; j<=v; j++) ok[doi(x,j)] = true;
    }
    inp.close();
}

void out()
{
    ofstream out; out.open("king.out");
    out << ans;
    out.close();
}

void bfs()
{
    ll hang[8] = {-1,-1,-1,0,1,1, 1, 0};
    ll cot[8]  = {-1, 0, 1,1,1,0,-1,-1};
    long q[100000], w[100000], bac[100000];
    ll f = 0,l = 0,x,y,i;

    q[0] = sx; w[0] = sy;
    while (f<=l)
    {
        x = q[f]; y = w[f]; f++;
        for (ll i = 0; i<8; i++)
        {
            string s = doi(x+hang[i] , y+cot[i]);
            if (ok[s])
            {
                l++; q[l] = x+hang[i]; w[l] = y+cot[i]; bac[l] = bac[f-1]+1;
                ok.erase(s);
                if (x+hang[i] == ex && y+cot[i] == ey) {ans = bac[l]; exit;}
            }
        }
    }
}

int main()
{
    init();
    bfs();
    out();
    return 0;
}
