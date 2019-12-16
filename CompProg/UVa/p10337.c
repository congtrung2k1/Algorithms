/**
 * Algorithm:
 * DP
 *
 * This problem's description sucks.
 Say if the input is 
 
 1 1 1 1
 1 1 1 1
 1 1 1 1
 1 1 1 1
 1 1 1 1
 1 1 1 1
 1 1 1 1
 1 1 1 1
 1 9 9 1
 1 -9 -9 1
 
 Let row 0 be the bottommost (altitude 0) (1 -9 -9 1)
 Let column 0 be the left most column
 
 To get to column 1, row 1, you need to fly from column 0, row 0
 This is a climb and you face a wind of 1. So fuel needed is 60-1 = 59
 To get to column2, row 1, (stay on altitude) the fuel needed is 30-9 = 21
 To get to column 3, row 1, (stay) the fuel needed is 30-9 = 21
 To get to column 4, row 0, (landing), fuel needed is 20-1=19
 Total = 59+21+21+19 = 120
 
 Note column4 is non-existent
 
 you are not allowed to go down to altitude 0, except at starting and landing.
 
 Hope this helps!*
 *
 */
#include<iostream>
#include<string.h>

using namespace std;

#define INF 0x7ff00000

char grid[1010][11];
int x;
int f[1010][11];

inline int min(int a, int b){ 
    if (a>=INF && b>=INF) return INF;
    if (a>=INF ) return b;
    if (b>=INF) return a;
    return a<b ? a:b;
}

int doit(){
    int i,j;
    f[0][0]=0;
    for (i=1;i<x;i++){
        for(j=1; j<9;j++){
            f[i][j] = min(
                        30-(int)grid[i-1][j]+f[i-1][j],
                        min(20-(int)grid[i-1][j+1]+f[i-1][j+1]
                            , 60-(int)grid[i-1][j-1]+f[i-1][j-1])
                    );
        }
        f[i][9] = min(30-(int)grid[i-1][9]+f[i-1][9],
                     60-(int)grid[i-1][8]+f[i-1][8]);
    }
i=x;
        f[i][0]=min(20-(int)grid[i-1][1]+f[i-1][1],INF);
    return f[x][0];
}

int main(){
int nu;
    cin>>nu;while(nu--){
        cin>>x; x/=100;
        int i,j;
        for (i=9;i>=0;i--){
            for (j=0;j<x;j++){
                int k; cin>>k;
                grid[j][i] = k;
                f[j][i]=INF;
            }
            f[j][i] = INF;
        }
        cout<<doit()<<endl<<endl;
    }
}
