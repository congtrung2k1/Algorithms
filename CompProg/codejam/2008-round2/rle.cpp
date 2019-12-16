/**
 * Algorithm:
 * Model the permutation as a Hamilton cycle
 */
#include<iostream>
#include<string.h>
#include<cstdio>
using namespace std;

string str;
int k;
int w[17][17][17]; // w[t][i][j] == weight of edge i->j where t is last

int dp[1<<16][17]; // dp[i][j] == length of path starting from j
                   // visiting every node in i, and ending at t

char has[1<<16][17];

// nodes : bitmask of nodes to visited, including x
// x : current node
// t : last node
int find(int nodes, int x, int t){
    if (has[nodes][x])return dp[nodes][x];
    
    // at last node?
    if (nodes == 1<<x){
        has[nodes][x]=1;
        return dp[nodes][x] = w[t][x][t];
    }

    int mm = 0x7fffffff;
    int nodes2 = nodes ^ (1<<x);
    for (int i = 0; i < k; i++){
        int bit = nodes2 &(1<<i);
        if (!bit) continue;
        mm = min(mm, w[t][x][i] + find(nodes2, i, t));
    }

    has[nodes][x]=1;
    return dp[nodes][x] = mm;
}

// r and c zero based
inline char get(int r, int c){
    return str[r*k + c];
}

int main(){
    int nu; cin >>nu; int casen=1;
    while(nu--){
        cin >> k;
        cin >> str;
        int rows = str.length()/k;
        int i,j,t;
        
        for (i=0; i < k;i++){
            for (j=0;j < k;j++){
                if(i==j) continue;
                int count1 = 0;
                int count2 = 0;
                for (int r = 0;r<rows;r++){
                        if(get(r, i) != get(r,j)) count1++;
                }
                for(int r = 0;r < rows-1; r++)
                        if (get(r,i) != get(r+1,j))count2++;
                
                for (t = 0;t < k; t++)
                    w[t][i][j] = count1;
                
                w[i][i][j] = count2;
            }
        }

        int mm = 0x7fffffff;
        for (t = 0; t < k;t++){
            memset(has,0,sizeof has);
            mm=min(mm, find((1<<k)-1, t, t));
        }
        printf("Case #%d: %d\n", casen++, mm+1);
    }
}
