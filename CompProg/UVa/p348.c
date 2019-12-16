/*
Algorithm:
DP

*/
#include<iostream>
#include<string.h>
#include<stdio.h>

using namespace std;
typedef long long ll;

int rows[20];
int cols[20];
int n;
char str[12][12][90]; // output string for i..j
int  len[12][12]; // length of str[i][j]
ll f[12][12]; // cache

 ll find(  int a, int b){ // a,b inclusive
    int i,j;

    if (a==b){
        
        return 0; 
    }
    if (f[a][b]) return f[a][b];
    ll min = (ll)1 << 62;
    int minidx = 0;
    for (i=a; i < b;i++){
        ll m = find(a, i);
        ll m2 = find(i+1,b);
        ll m3 = rows[a] * cols[i] * cols[b];
        ll total = m+m2+m3;
        if (total <min){ minidx=i;min=total;}

    }
    str[a][b][0]='(';
    i=minidx;
    strcpy(&str[a][b][1], &str[a][i][0]);
    int p = len[a][i]+1;
    str[a][b][p++] = ' ';
    str[a][b][p++] = 'x';
    str[a][b][p++] = ' ';
    strcpy(&str[a][b][p], &str[i+1][b][0]);
    p+= len[i+1][b];
    str[a][b][p++] = ')';
    str[a][b][p]=0;
    f[a][b] = min;
    len[a][b]=p;
    return min;
}
int cc=1;
int main(){
    int i,j;
    for (i=0;i<=10;i++){
    
            sprintf( & str[i][i][0], "A%d", i+1);
            len[i][i] = 1 + ( i+1 >= 10 ? 2:1 );
    }
    while (9){
        cin>>n;
        if (n==0) break;
        memset( f, 0, sizeof(f));
        
        for (i=0;i<n;i++){ int r,c;
            cin >> r >> c;
            rows[i] = r; cols[i] = c;
        }
        ll min = find (0,n-1);
        printf ("Case %d: %s\n",cc++, str[0][n-1]);
    }
}

