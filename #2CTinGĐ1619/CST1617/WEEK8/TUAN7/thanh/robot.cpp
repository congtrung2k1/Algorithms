#include <iostream>
#include <cstdio>
#include <string>

using namespace std;

#define maxN 105
#define maxK 10

string str;
const short int dx[4] = {-1,0,1,0}, dy[4] = {0,1,0,-1};
short int n,m,k;
char ma[maxN][maxN];
bool Free[maxN][maxN][4][maxK],can[maxN][maxN][4][maxK];
void nhap()
{
    cin >> n >> m >> k;
    for (int i=1; i<=n; i++)
        for (int j=1; j<=m; j++)
            cin >> ma[i][j];
    getline(cin,str);
    getline(cin,str);
    for (int i=1; i<=n; i++) {ma[i][0] = '#'; ma[i][m+1] = '#';}
    for (int i=1; i<=m; i++) {ma[0][i] = '#'; ma[n+1][i] = '#';}
}

short int turn(short int h, char c)
{
    if (c == 'L') {h--; if (h < 0) h=3;}
    else {h++; if (h>3) h=0;}
    return h;
}

void DFS(short int ui,short int uj,short int h,short int lenh)
{
    Free[ui][uj][h][lenh] = false;
    int vi=ui,vj=uj,h2=h,lenh2;
    lenh2 = lenh+1; if (lenh2 >= k) lenh2 = 0;
    if (ma[ui][uj] == 'E') {can[ui][uj][h][lenh] = true; return;}
    if (str[lenh] == 'F')
        {vi = ui+dx[h]; vj = uj+dy[h];}
        else h2=turn(h,str[lenh]);
    if (ma[vi][vj] == '#') {vi = ui; vj = uj;}
    if (Free[vi][vj][h2][lenh2])
        DFS(vi,vj,h2,lenh2);
    can[ui][uj][h][lenh] = can[vi][vj][h2][lenh2];
}

void xuli()
{
    for (int i=1; i<=n; i++)
        for (int j=1; j<=m; j++)
            for (int q=0; q<4; q++)
                for (int t=0; t<k; t++) Free[i][j][q][t] = true;
    int res = 0,trong = 0;
    for (int i=1; i<=n; i++)
        for (int j=1; j<=m; j++)
            if (ma[i][j] != '#')
            {
                if (Free[i][j][0][0]) DFS(i,j,0,0);
                res+=can[i][j][0][0];
                trong++;
            }
    if (res==trong) cout << "YES"; else cout << res;
}
int main()
{
    freopen("robot.inp","r",stdin);
    freopen("robot.out","w",stdout);
    nhap();
    xuli();
    return 0;
}
