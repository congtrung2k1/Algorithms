/**
 * Algorithm:
 * Simple DP
 */

#include<stdlib.h>
#include<stdio.h>
#include<string.h>
#include <iostream>
using namespace std;

const int AND=1;

struct node{
    int canChange;
    int gate;
    int val;
};

node nodes[10002];
int m,n;
char has[10002][2];
int dp[10002][2];
int v;
int find(int nidx, int want){

if (has[nidx][want] ) return dp[nidx][want];


    node & cur = nodes[nidx];
    int left = 2*nidx+1; 
    int right = left+1;
    if (left >= m) {
        if (want == cur.val) return 0;
        return -1;
    }

    int mm = 99999999;
    
    for (int lv = 0; lv <=1;lv++){
        int s1 = find(left, lv);
        if (s1 < 0)  continue;
        for (int rv = 0; rv<=1; rv++){
            int s2 = find(right, rv);
            if(s2 <0)continue;
            for (int g = 0; g <= 1; g++){
                if (!cur.canChange && g != cur.gate) continue;
                int result = (g== AND? lv&rv : (rv|lv));
                if (result != want) continue;
                
                mm = min(mm, s1+s2+ (cur.canChange && cur.gate != g));
            }
        }
    }

    has[nidx][want] = 1;
    return dp[nidx][want]=mm >= 9999999 ? -1 : mm;
}

int main(){
    int nu;  cin >> nu;int casen=1;
    while (nu--){
        cin >> m>>v;
        int idx = 0;
        for (int i =0; i < (m-1)/2;i++){
            cin >> nodes[idx].gate >> nodes[idx].canChange;
            nodes[idx].val = -1; idx++;
        }
        for (int i = 0; i < (m+1)/2;i++){
            cin >> nodes[idx].val; idx++;
        }
memset(has,0,sizeof has);
    if (find(0,v) >=0)
        printf("Case #%d: %d\n", casen++, find(0, v));
     else
        printf("Case #%d: IMPOSSIBLE\n", casen++);
    }
}
