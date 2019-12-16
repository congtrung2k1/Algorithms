#include <iostream>
#include <cstdio>
#include <algorithm>

#define maxN 100005

using namespace std;
int test,n; string a[maxN]; //char a[maxN][25];

bool check(string a,string b)
{
    int tmp=min(a.length(),b.length());
    for (int i=0; i<tmp; i++) if (a[i]!=b[i]) return false;
    return true;
}

int main()
{
    freopen("courses.inp","r",stdin);
    freopen("courses.out","w",stdout);
    scanf("%d",&test);
    while (test--)
    {
        scanf("%d\n",&n);
        //for (int i=1; i<=n; i++) scanf("%s",a[i]);
        for (int i=1; i<=n; i++) getline(cin,a[i]);
        sort(a+1,a+n+1);
        //for (int i=1; i<=n; i++) cout<<a[i]<<'\n';
        string now=a[n];
        int res=1;
        for (int i=n-1; i>0; i--) if (!check(a[i],now))
        {
            res++;
            now=a[i];
        }
        printf("%d\n",res);
    }
    return 0;
}
