//Nguyen Cong Chanh
//12A1 - THPT Nguyen Huu Tien
#include <bits/stdc++.h>
#define ii pair<int, int>
#define ll long long
using namespace std;
const int N = (int)5007;
const ll inf = (ll)5e10;
int n, k, a[4][N], s[4][N];
ll f[4][N][2], sum[4][N];
void init()
{
    freopen("zig.inp", "r", stdin);
    freopen("zig.out", "w", stdout);
    scanf("%d%d", &n, &k);
    for(int i = 0; i < 2; i++)
    {
        for(int j = 0; j < n; j++)
        {
            scanf("%d", &a[i][j]);
            f[i][j][0] = f[i][j][1] = -inf;
            if(j == 0) sum[i][j] = a[i][j]; else
                sum[i][j] = sum[i][j - 1] + (ll)a[i][j];
        }
    }
}
ll get(int row, int i, int j)
{
    if(i == 0) return sum[row][j];
    return sum[row][j] - sum[row][i - 1];
}
void solve()
{
    init();
    f[0][0][0] = a[0][0];
    s[0][0] = 1;
    f[1][0][1] = f[0][0][0] + a[1][0];
    f[1][0][0] = f[1][0][1];
    s[1][0] = 0;
    for(int i = 1; i < n; i++)
    {
        if(s[0][i - 1] < k)
        {
            f[0][i][0] = f[0][i - 1][0] + (ll)a[0][i];
            s[0][i] = s[0][i - 1] + 1;
        }
        if(s[1][i - 1] < k)
        {
            f[1][i][0] = f[1][i - 1][0] + (ll)a[1][i];
            s[1][i] = s[1][i - 1] + 1;
        }
        for(int j = i - 1; (i - j) < k && j > 0; j--)
        {
            if(f[0][j][1] + get(0, j + 1, i) > f[0][i][0])
            {
                f[0][i][0] = f[0][j][1] + get(0, j + 1, i);
                s[0][i] = i - j + 1;
            }
            if(f[1][j][1] + get(1, j + 1, i) > f[1][i][0])
            {
                f[1][i][0] = f[1][j][1] + get(1, j + 1, i);
                s[1][i] = i - j + 1;
            }
        }
        f[0][i][1] = f[1][i][0] + (ll)a[0][i];
        f[1][i][1] = f[0][i][0] + (ll)a[1][i];
    }
    printf("%lld\n", max(f[1][n - 1][0], f[1][n - 1][1]));
}
int main()
{
    solve();
    return 0;
}
