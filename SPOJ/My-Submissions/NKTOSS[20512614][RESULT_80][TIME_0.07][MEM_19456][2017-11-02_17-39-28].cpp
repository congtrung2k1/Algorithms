#include <iostream>
#include <cstdio>

#define maxN 10005

using namespace std;
string F[maxN]; int n,k;

string add(string a,string b)
{
    while (a.length()<b.length()) a='0'+a;
    while (a.length()>b.length()) b='0'+b;
    int carry=0;
    for (int i=a.length()-1; i>=0; i--)
    {
        carry+=a[i]+b[i]-96;
        a[i]=(char)(carry%10+'0');
        carry/=10;
    }
    if (carry>0) a='1'+a;
    return a;
}

string sub(string a,string b)
{
    while (a.length()<b.length()) a='0'+a;
    while (a.length()>b.length()) b='0'+b;
    int borrow=0;
    for (int i=a.length()-1; i>=0; i--)
    {
        borrow=10+a[i]-b[i]-borrow;
        a[i]=(char)(borrow%10+'0');
        borrow=1-borrow/10;
    }
    while (a.length()>1 && a[0]=='0') a.erase(0,1);
    return a;
}

int main()
{
    //freopen("dp3.inp","r",stdin);
    //freopen("dp3.out","w",stdout);
    scanf("%d%d",&n,&k);
    for (int i=0; i<=k-1; i++) F[i]="0";
    F[k]="1";
    string tmp="1";
    for (int i=k+1; i<=n; i++)
    {
        F[i]=sub(add(add(F[i-1],F[i-1]),tmp),F[i-k-1]);
        tmp=add(tmp,tmp);
    }
    cout<<F[n];
    return 0;
}
