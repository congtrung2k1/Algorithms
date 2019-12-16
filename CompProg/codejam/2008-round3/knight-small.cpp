/**
 * Algorithm:
 * Basic DP for the small test case
 */
#include <iostream>
#include <cstdlib>
#include<cstring>
using namespace std;

int H, W;
int R;
int dp[101][101]; // dp[i][j] ==ways to reach row i, col j
const int MOD = 10007;

void add( int r, int c, int i , int j){
    if (i >= 1 && j >= 1){
        dp[r][c] = (dp[r][c] + dp[i][j]) % MOD;
    }
}

int main(){
    int nu; cin >> nu; int casen=1;
    while(nu--){
        cin >> H >> W >> R;
        memset(dp,0,sizeof dp);
        for (int i= 0; i < R; i++){
            int a,b;
            cin >> a >> b;    
            dp[a][b] = -1;
        }
        dp[1][1] = 1;
        for (int i = 1;i <= H; i++){
            for (int j= 1; j <= W; j++){
                if (dp[i][j] == -1){dp[i][j]=0; continue;}
                add(i,j,i-2,j-1);
                add(i,j,i-1,j-2);
            }
        }
        cout <<"Case #" <<casen ++ << ": "<< dp[H][W]<< endl;
    }
}
