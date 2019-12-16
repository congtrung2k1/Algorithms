//
//  main.cpp
//  Fibonacci Queries
//
//  Created by Ngô Hùng Minh Triết  on 11/22/16.
//  Copyright © 2016 Ngô Hùng Minh Triết . All rights reserved.
//

#include <fstream>
#include <algorithm>
#define maxN 10010
#define ii pair<int,int>
#define iii pair<int,ii>
#define iiii pair <int,iii>
#define fi first
#define se second


using namespace std;

ifstream cin ("region.inp");
ofstream cout("region.out");

int n,m,r,N;
ii a[maxN];
bool Region[maxN],taken[maxN],already[maxN],visited[maxN];

bool check(int MaxSc)
{
    int tmp=0;
    for(int i=1; i<=r; i++) taken[i]=already[i],visited[i]=false;
    for(int i=1; i<=N; i++)
        if (a[i].fi >= MaxSc)
        {
            tmp++;
            taken[a[i].se]=true;
            visited[i]=true;
        }
    for(int i=1; i<=N; i++)
    {
        if (Region[a[i].se]==true && taken[a[i].se]==false && visited[i]==false)
        {
            tmp++;
            visited[i]=true;
            taken[a[i].se]=true;
        }
    }
    return (tmp<=m);
}

int main()
{
    cin>>n>>m>>r;
    for(int i=1; i<=n; i++)
    {
        int id,reg,sc,meg;
        cin>>id>>reg>>sc>>meg;
        Region[reg]=true;
        if (meg==1)
        {
            m--;
            already[reg]=true;
        }
        else
        {
            ++N;
            a[N].fi=sc;
            a[N].se=reg;
        }
    }
    sort(a+1,a+N+1);
    int res;
    int Left=1,Right=long(1e9);
    while (Left<=Right)
    {
        int mid = (Left+Right)/2;
        if (check(mid)==true)
        {
            res=mid;
            Right=mid-1;
        }
        else Left=mid+1;
    }
    cout<<res;
    return 0;
}
