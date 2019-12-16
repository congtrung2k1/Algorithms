/**
Algorithm:
Brute force

Gotchas:
- Min sum is zero because you can select an empty sub-rect. how lame...
*/
#include<iostream>
#include<string.h>
#include<stdio.h>
using namespace std;

char grid[76][76];
int n;

// double the rows so we can wrap around vertically
int cum[76*2][76]; // cum[i][j] = sum of row i from col 1 to j inclusive
int themax;

// returns sum of row r from column s to e inclusively
inline int calc(int r, int s, int e){
    return cum[r][e] - cum[r][s-1];
}

void doit(){
    int i,j;
    // calc cum sums for each row
    for (i=1;i<=n;i++){
        cum[i][0] =0;
        cum[i+n][0]=0;
        for (j=1; j<=n;j++){
            cum[i][j] = cum[i][j-1]+grid[i][j];
            cum[i+n][j] = cum[i][j];
        }
    }
    themax = -75*76*101;
    int k; int p;

    // brute force
    for (i=1;i<=n;i++){//for each row i
        for (j=1;j<=n;j++){// for each starting col j
            for (k=j;k<=n;k++){// ending at col k
                int sum =0;
                int invSum = 0; // "wrap-around" sum
                bool pp = j==1 && k==n;
                for (p=i; p<i+n;p++){//ending at row p
                    int y = calc(p,j,k);
                    sum += y;
                    if (sum>themax)themax=sum;
                    invSum+=cum[p][n]-y;
                    if (!pp&&invSum>themax)themax=invSum;
                }
            }
        }
    }
    printf("%d\n",themax<0?0:themax);
}

int main(){
    int nu;scanf ("%d",&nu);
    while (nu--){
        scanf("%d",&n);
        int i,j;
        for (i=1; i <=n;i++){
            for(j=1;j<=n;j++){
                int k;cin>> k;
                grid[i][j]=k;
            }
        }
        doit();
    }
}
