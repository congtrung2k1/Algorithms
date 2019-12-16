/*
LANG: C++
TASK: rockers
*/
#include<iostream>
#include<fstream>
#include<cstring>
#include<cstdlib>
using namespace std;

int dp[21][21][21];
char valid[21][21][21];
int n,t,m,lens[21];

// a==idx of last disk used
// b==no. of mins used in last disk
// c==idx of last song used
// returns max no. of songs that can be fit using remaining minutes and disks
int calc(int a, int b, int c){
    if(a==m)return 0;
    int&d=dp[a][b][c];
    if(valid[a][b][c])return d;
    int i,j,k,best=0;
    for(k=c+1;k<n;k++){
        int len=lens[k];
        if(b+len<=t)
            best=max(best,1+calc(a,b+len,k));
        if(a<m-1&&len<=t)
            best=max(best,1+calc(a+1,len,k));
    }
    valid[a][b][c]=1;
    return d=best;
}

int main(){
    ifstream in("rockers.in");
    ofstream out("rockers.out");
    int i,j,k;
    in>>n>>t>>m;
    for(i=0;i<n;i++)
        in>>lens[i];
    out<<calc(0,0,-1)<<endl;
    out.flush();out.close();
    return 0;
}
