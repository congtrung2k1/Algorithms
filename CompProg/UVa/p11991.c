/**
 * Algorithm:
 * Simple 2D dynamic array
 * */
#include<vector>
#include<string.h>
#include<stdio.h>
#include<iostream>
using namespace std;

#define list vector<int>
//index[i] gives lst index for int i
list lsts[100002];
int ind[1000001];
int n,m;

int main()
{
    while(9){
        int k = scanf("%d%d", &n ,&m);
        if (k!=2)break;
        int i,j;int v; int u=0;
        for (i=0;i<n;i++){
            cin >> v;
            int  lstidx =ind[v];
            list*lst;
            if (lstidx == 0){
                lst = &lsts[ ind[v] = ++u]; 
            }
            else lst = &lsts[ lstidx];

            lst->push_back(i+1);
        }

        for (i=0;i<m;i++){
            int k,va;
            cin>> k>>va;
            if (! ind[va]) cout << ("0\n");
            else { k--;
                list &lst =lsts[ind[va]];
                cout <<(int) ( k<lst.size() ? lst[k] : 0 ) <<endl;
            }
        }

        memset(ind,0,sizeof(ind));
        for (i=1;i<=u;i++){ lsts[i].clear(); }
    }    
}



