/**
Algorithm:
DP


*/
#include<iostream>
#include<stdlib.h>
#include<string.h>
#include<stdio.h>

int f[300]; // freq
int cum[300];// cum[i+1] = f[i] + f[i-1] + .. f[0]
int n;
int cache[252][252]; // cache[i][j] is lowest cost for tree i..j

using namespace std;
inline int get(int i, int j){
    return cum[j+1] - cum[i];
}

int find(int i, int j){
    if (cache[i][j]) return cache[i][j];

        if (i==j)return 0;

    int min = find(i+1,j)+get(i+1,j);
    int k;
    int cost = find(i,j-1)+get(i,j-1);
    if (cost<min)min=cost;

    for (k = i+1; k < j;k++){
        int cost =(find(i,k-1)+get(i,k-1));
        cost +=  (find(k+1,j)+get(k+1,j));
        if (cost<min)min=cost;
    }
    return cache[i][j]=min;
}


int main(){
    while(cin>>n){
        int i,j;
        cum[0] = 0;
        for (i=0;i<n;i++){
            cin>>f[i];
            cum[i+1] = cum[i]+f[i];
        }
        memset(cache,0,sizeof(cache));
        for (i=1; i<n;i++){
            cache[i-1][i] = f[i] < f[i-1] ? f[i] : f[i-1];
        }
        cout<<find(0,n-1)<<endl;
    }
}

