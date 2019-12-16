#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <cmath>
#include <cstring>
#include <algorithm>
using namespace std;
const int N = (int)1e5 + 7;
struct Student
{
    int id, reg, sc, med;
};
bool has[N];
int n, m, r, lo, hi;
Student a[N];
vector<Student> na;
void init()
{
    freopen("region.inp", "r", stdin);
    freopen("region.out", "w", stdout);
    scanf("%d%d%d", &n, &m, &r);
    for(int i = 1; i <= r; i++) has[i] = true;
    for(int i = 1; i <= n; i++)
    {
        scanf("%d%d%d%d", &a[i].id, &a[i].reg, &a[i].sc, & a[i].med);
        has[a[i].reg] = false;
    }
    for(int i = 1; i <= n; i++)
    {
        if(a[i].med == 1)
        {
            has[a[i].reg] = true;
            m--;
        }else
        {
            na.push_back(a[i]);
            hi = max(hi, a[i].sc);
        }
    }
}
int check(int u)
{
    bool has1[N];
    for(int i = 1; i <= r; i++) has1[i] = has[i];
    int rs = 0;
    for(int i = 0; i < (int)na.size(); i++)
    {
        if(na[i].sc >= u)
        {
            rs++;
            has1[na[i].reg] = true;
        }
    }
    for(int i = 1; i <= r; i++)
    if(has1[i] == false) rs++;
    if(rs > m) return 1;
    if(rs == m) return 0;
    if(rs < m) return -1;
}
void solve()
{
    init();
    lo = 0;
    hi ++;
    int mid = (lo + hi) / 2;
    while(mid != lo && mid != hi)
    {
        int x = check(mid);
        if(x == 1) lo = mid; else hi = mid;
        mid = (lo + hi) / 2;
    }
    for(int i = lo; i <= hi; i++)
    if(check(i) == 0)
    {
        printf("%d", i);
        return;
    }
}
int main()
{
    solve();
    return 0;
}
