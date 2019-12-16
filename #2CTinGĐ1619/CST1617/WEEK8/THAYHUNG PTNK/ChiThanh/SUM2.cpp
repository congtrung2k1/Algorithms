#include <iostream>
#include <cstdio>

using namespace std;

#define maxN 100005
#define maxC 2000000000

int a[maxN];
int L,U,sum,res,n;

void xuli()
{
    int l,r;
    for (int i=1; i<=L; i++)
        sum += a[i];
    l=1; r=L;
    res = -maxC;
    for (int i=1; i<=n; i++)
    {
        if (r-l+1 >= U)
        {
            sum -= a[l];
            l++;
        }
        r++; sum+=a[r];
        if (r-l+1 <= U && r-l+1 >= L) res=max(res,sum);
        while (r-l+1 >= L && (sum < 0 || a[l] < 0)) {sum-=a[l]; l++;}
    }
    cout << res;
}

int main()
{
    ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
    freopen("sum2.inp","r",stdin);
    freopen("sum2.out","w",stdout);
    cin >> n >> L >> U;
    for (int i=1; i<=n; i++)
        cin >> a[i];
    xuli();
    return 0;
}
