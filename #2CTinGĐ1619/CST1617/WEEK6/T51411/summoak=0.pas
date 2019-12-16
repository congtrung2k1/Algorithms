#include<iostream>
#include<algorithm>
using namespace std;

const int maxn=1001;
const int maxk=51;
const int minf=-1e9;
int n,k;
int a[maxn];
int f[maxn][maxk];

void Init()
{
    cin>>n>>k;
    for(int i=1;i<=n;i++)
    {
        cin>>a[i];
        a[i]%=k;
    }
}

int Mod(int x, int j)
{
    if(x>j)
        return j+k-x;
    else
        return j-x;
}

void Solve()
{
    for(int i=1;i<=k;i++)    f[0][i]=minf;
    f[0][0]=0;
    for(int i=1;i<=n;i++)
        for (int j=0;j<k;j++)
            f[i][j]=max(f[i-1][j],f[i-1][Mod(a[i],j)]+1);
    cout<<f[n][0];
}

int main()
{
    Init();
    Solve();
}