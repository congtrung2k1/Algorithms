/**
Algorithm:
Brute force + Backtracking

A faster way might be to pre-generate all permutations
and test whether each one satisfies the constraints.

Gotchas:
- X seats apart means X-1 seats in between.
  */

#include<stdio.h>
#include<string.h>
#include <iostream>

using namespace std;

int pos[100]; // zero index pos of tennager i
int n;
typedef struct{
    int other;
    int atleast;
    int atmost;
} dd;

char used[10];
dd con[10][21]; // con[i] = constraints for teeager i
int ncon[10]; // ncon[i] = # cons for teen i

int cnt ;

void find (int idx){
    if (idx == n) { cnt++; return ; }
    int i,j;
    for (i=0; i < n;i++){
        if (used[i]  ) continue;
        int  p = ncon[i];
         bool sat =  true;

         // check each constraint
        for (j = 0; j < p; j++){
            int other = con[i][j].other;
            if (! used[other] ) continue;
            if (  idx -  pos[other] < con[i][j].atleast){
                    sat = false; break;}
            if ( idx - pos[other] > con[i][j].atmost){
                sat = false ; break;}
        }
        if (sat == false ) continue;
        pos[i] = idx;
        used[i]=1;find (idx+1);
            used[i] = 0;
    }
}
int main(){
    while (99){ int m;
        cin >> n >> m;
        int i,j;
        if (n+m == 0) break;
        memset ( ncon, 0, sizeof (ncon));
        for (i=0;i<m;i++){ int a,b,c;
            cin >> a >> b >> c;
            con[a][ncon[a]].other = b;
            con[a][ncon[a]].atleast = 0;
            con[a][ncon[a]].atmost = 0x7ffffff;

            con[b][ncon[b]].other = a;
            con[b][ncon[b]].atleast = 0;
            con[b][ncon[b]].atmost = 0x7ffffff;
            if (c < 0){  
                con[a][ncon[a]].atleast = -c;
                con[b][ncon[b]].atleast = -c;
            } else{
                con[a][ncon[a]].atmost = c;
                con[b][ncon[b]].atmost = c;
            }ncon[a] ++; ncon[b] ++;
        }
        cnt = 0;
        find ( 0);
        printf ("%d\n",cnt);
    }
}
