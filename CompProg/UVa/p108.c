/**
 * Algorithm:
 * Brute force
 *
 */
#include<iostream>
#include<string.h>
#include<stdio.h>
using namespace std;
char  grid[102][102]; // one based
int n;
int cum[102][102]; // cum sum of rows

inline int  get(int r, int i,int j){ // i<j
    return cum[r][j] - cum[r][i-1];
}

void doit(){

    int i,j,k;
    for (i = 1; i <= n;i++){
        cum[i][0] = 0;
        for (j=1; j <=n;j++){
            cum[i][j]  = cum[i][j-1] + grid[i][j];
        }
    }
    int maxsum = 0x80000000;
for (int p = 1; p<=n;p++)
    for (i=1; i <= n;i++){
        for (j = i; j <= n;j++){
            int sum = 0;
            for (k = p; k <=n;k++){
                sum += get(k, i,j);
                if (sum > maxsum) maxsum = sum;
            } 
        }
    }
printf("%d\n",maxsum);
}


int main(){
     while (9){
      scanf("%d", &n);
      int i,j;
      for (i = 1 ; i <=n;i++)
          for (j = 1; j<=n;j++) { int p ; cin >> p ; grid[i][j] = p;}
     doit(); break;}
}


