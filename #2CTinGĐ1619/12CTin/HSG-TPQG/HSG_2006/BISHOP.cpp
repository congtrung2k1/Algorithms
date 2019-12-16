#include <bits/stdc++.h>
using namespace std;
typedef long long int ll;

queue<ll> qu,wu;
ll n,m,p,q,s,t, bac[201][201];
bool fre[201][201], blank[201][201];
ll hang[4]={-1,-1,1,1};
ll cot[4] ={-1, 1,1,-1};

int main()
{
    freopen("input.inp","r",stdin);
    freopen("output.out","w",stdout);

    cin >> n >> m >> p >> q >> s >>t;
    memset(blank,false,sizeof(blank));
    for (ll i = 0; i < m; i++)
    {
        ll u,v;
        cin >> u >> v;
        blank[u][v] = true;
    }

    memset(fre,true,sizeof(fre));
    qu.push(p); wu.push(q); bac[p][q] = 0; fre[p][q] = false;
    while (!qu.empty())
    {
        ll x = qu.front() , y = wu.front(); qu.pop(); wu.pop();
        for (ll i = 0; i<4; i++)
        {
            ll tmp = 1;
            while (x + tmp*hang[i] > 0 && x + tmp*hang[i] <= n && y + tmp*cot[i] > 0 && y + tmp*cot[i] <= n)
            {
                if (blank[x + tmp*hang[i]][y + tmp*cot[i]]) break;
                if (fre[x + tmp*hang[i]][y + tmp*cot[i]])
                    if (x + tmp*hang[i] == s && y + tmp*cot[i] == t)
                    {
                        cout << bac[x][y] + 1 << endl;
                        return 0;
                    }
                    else
                    {
                        qu.push(x + tmp*hang[i]); wu.push(y + tmp*cot[i]);
                        fre[x + tmp*hang[i]][y + tmp*cot[i]] = false;
                        bac[x + tmp*hang[i]][y + tmp*cot[i]] = bac[x][y] + 1;
                    }
                tmp++;
            }
        }
    }

    cout << -1 << endl;
    return 0;
}
