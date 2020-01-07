#include <iostream>
#include <cstdio>

#define maxN 30005

using namespace std;
int a[maxN],n,h[maxN];

int main()
{
    //freopen("dp1.inp","r",stdin);
    //freopen("dp1.out","w",stdout);
    scanf("%d",&n);
    for (int i=1; i<=n; i++) scanf("%d",&a[i]);
    int cnt=1;
    h[1]=1;
    for (int i=2; i<=n; i++)
    {
        if (a[i]>a[h[cnt]]) h[++cnt]=i;
        else
        {
            int l=1,r=cnt,res=1;
            while (l<=r)
            {
                int mid=(l+r)>>1;
                if (a[h[mid]]>=a[i])
                {
                    res=mid;
                    r=mid-1;
                }
                else l=mid+1;
            }
            h[res]=i;
        }
    }
    cout<<cnt;
    return 0;
}
