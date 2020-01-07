#include <iostream>
#include <cstdio>

#define FOR(i,a,b) for(int i = (a); i <= (b); i++)
#define FORD(i,a,b) for(int i = (a); i >= (b); i--)
#define REP(i,a) for(int i = 0; i < (a); i++)
#define sz(a) (int)a.size()

using namespace std;

const int maxN = 1e4+5;
const int maxS = 20; // 1 << 4

int n, a[5][maxN], f[maxN][maxS];

int getBit(int x, int k)
{
    return (x >> k) & 1;
}

bool check2(int x)
{
    FOR(k,0,2) if (getBit(x,k) == 1 && getBit(x,k+1) == 1) return false;
    return true;
}

bool check(int x, int y)
{
    FOR(k,0,3) if (getBit(x,k) == 1 && getBit(y,k) == 1) return false;
    return true;
}

int main()
{
        //freopen("DP5.INP","r",stdin);
        //freopen("DP5.OUT","w",stdout);
    scanf("%d",&n);
    bool neg = true;
    int res = -1e9;
    FOR(i,0,3) FOR(j,1,n)
    {
        scanf("%d",&a[i][j]);
        if (a[i][j] >= 0) neg = false;
        res = max(res, a[i][j]);
    }

    if (neg)
    {
        cout << res;
        return 0;
    }

    FOR(i,1,n) FOR(j,0,15) f[i][j] = -1e9;
    res = 0;
    FOR(i,1,n)
    {
        FOR(curS,0,15)
        {
            if (!check2(curS)) continue;
            int tmp = 0;
            FOR(k,0,3) if (getBit(curS,k)) tmp += a[k][i];
            FOR(preS,0,15)
            {
                if (!check2(preS)) continue;
                if (!check(curS,preS)) continue;
                f[i][curS] = max(f[i][curS], f[i-1][preS]+tmp);
            }
        }
    }
    FOR(i,1,n) FOR(st,0,15) if (f[i][st] != 0) res = max(res, f[i][st]);
    cout << res;
    return 0;
}
