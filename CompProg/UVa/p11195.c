/**
 * Algorithm:
 * Brute force backtracking + bitmasks
 *
 * Bitmasks really help...
 * I used an array based approach at first but it timed out.
 *
 * */

#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int board[20];
int cnt;
int n;

// r is the zero-based row index
// col is the column mask -- ones means occupied
// d1 is the topleft - bottomright mask -- ones mean occupied
// d2 is the topright-bottomleft mask -- ones mean occupied
void find(int r, int col, int d1, int d2)
{
    if (r==n){ cnt++; return; }

    // Notice the elegance :) ...

    d1 >>= 1;
    d2 <<= 1;
    int m = board[r] & (~(col | d1 | d2)); 

    while (m){
        //get least significant 1 bit
        int c = m & (-m);

        find(r+1, col|c, d1|c, d2|c);

        // remove that bit
        m ^= c;
    }
}

int main(){int cc=1;
while (1){
    scanf("%d", &n);
    if (!n) break;
    int i,j;
    for(i=0;i<n;i++){
        char s[90];
        scanf("%s", s);
        board[i]=0;
        for (j=0;j < n;j++){
            if (s[j]!='*')board[i] |= (1 << j);
        }
    }
    cnt = 0;
    find(0, 0, 0, 0);
    printf("Case %d: %d\n",cc,cnt);cc++;
}
}

