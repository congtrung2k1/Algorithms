#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cmath>
#include <algorithm>
#define ll long long
using namespace std;
const int N = (int)1e5 + 7;
int n, a[N];
ll sum[N];
bool cmp(int a, int b)
{
    return a > b;
}
void init()
{
    freopen("volley.inp", "r", stdin);
    freopen("volley.out", "w", stdout);
    scanf("%d", &n);
    sum[0] = 0;
    for(int i = 1; i <= n; i++)
    {
        scanf("%d", &a[i]);
    }
    sort(a + 1, a + n + 1, cmp);
    for(int i = 1; i <= n; i++)
        sum[i] = sum[i - 1] + a[i];
}
int abs(int x)
{
    if(x > 0) return x;
    return -x;
}
int cal(int p, int q)
{
    ll s1, s2;
    s1 = s2 = 0;
    int i = 0;
    while(i < n)
    {
        if(n - i < p)
        {
            s1 += sum[n] - sum[i];
            i = n;
        }else
        {
            s1 += sum[i + p] - sum[i];
            i += p;
        }
        if(n - i < q)
        {
            s2 += sum[n] - sum[i];
            i = n;
        }else
        {
            s2 += sum[i + q] - sum[i];
            i += q;
        }
    }
    return abs(s1 - s2);
}
void solve()
{
    init();
    int mp = n / 2, mq = n - mp, rs, rs1, rs2;
    rs = (int)2e9 + 7;
    cal(1, 4);
    for(int p = 1; p <= mp; p++)
    {
        for(int q = p; q <= mq; q++)
        {
            if(abs(cal(p, q)) < rs)
            {
                rs = abs(cal(p, q));
                rs1 = p;
                rs2 = q;
            }
        }
    }
    printf("%d %d", rs1, rs2);
}
int main()
{
    solve();
    return 0;
}
