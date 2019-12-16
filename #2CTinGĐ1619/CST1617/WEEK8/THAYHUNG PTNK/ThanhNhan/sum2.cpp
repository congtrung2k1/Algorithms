#include <iostream>
#include <cstdio>
#include <deque>

#define maxN 100005

using namespace std;
deque<int> deq; int n,L,U,a[maxN];

int main()
{
    int res=-long(1e9)-5,sum=0;
    //ios::sync_with_stdio(0); cin.tie(0); cout.tie(0);
    freopen("sum2.inp","r",stdin);
    freopen("sum2.out","w",stdout);
    scanf("%d%d%d",&n,&L,&U);
    for (int i=1; i<=n; i++) scanf("%d",&a[i]);
    for (int i=1; i<=n; i++)
    {
        if (deq.size()>=U)
        {
            sum-=deq.front();
            deq.pop_front();
        }
        deq.push_back(a[i]);
        sum+=a[i];
        if (deq.size()>=L && deq.size()<=U) res=max(res,sum);
        while (!deq.empty() && (deq.front()<0 || sum<0) && deq.size()>=L)
        {
            sum-=deq.front();
            deq.pop_front();
        }
    }
    cout<<res;
    return 0;
}
