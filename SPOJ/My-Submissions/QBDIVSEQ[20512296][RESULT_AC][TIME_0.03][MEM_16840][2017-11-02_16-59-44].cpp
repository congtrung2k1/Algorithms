#include <iostream>
#include <cstdio>

#define maxN 100005

using namespace std;
int n,a[maxN],h[maxN];

int main()
{
    //freopen("QBDIVSEQ.inp","r",stdin);
    //freopen("QBDIVSEQ.out","w",stdout);
    scanf("%d",&n);
    for (int i=1; i<=n; i++) scanf("%d",&a[i]);
    int cnt=1;
    h[1]=1;
    for (int i=2; i<=n; i++)
    {
        if (a[i]<a[h[cnt]]) h[++cnt]=i;
        else
        {
            int l=1,r=cnt,res=1;
            while (l<=r)
            {
                int mid=(l+r)>>1;
                if (a[h[mid]]<=a[i])
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
