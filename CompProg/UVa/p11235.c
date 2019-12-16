/**
 * Algorithm:
 * Range minimum query using sparse table
 *
 * Runtime : O(N log N) for building the table
 * O(1) for each query
 *
 * Gotchas:
 * - You can rebase the list of numbers by adding 100000 to each one
 */
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int f[100002][19]; // f[i][j] = max freq of block starting at i and of 
                   // length 2^j
int st[200003]; // st[i] = start pos of value i
int en[200003]; // en[i] = end pos of value i
int n[100003];  // the list of numbers
int N;

inline int max(int a, int b ) {return a<b?b:a;}
inline int min (int a, int b){ return a<b? a : b; }
inline int rebase(int v){ return v + 100000; }

// returns the largest i such that 2^i <= k
// This is O(1) runtime
int intlog(int k){
    int i=0,j;
    if (k >= (1<<14)){
        i = 14;
    }
    else if (k >= (1<<10)){
        i = 10; 
    }
    else if (k >= (1<<5)){
        i = 5; 
    }
    for (;; i++){
        if ((1<<i) == k) return i;
        if ((1<<i) > k) return i-1;
    }
}

// Query
int qu (int s1, int e2){
    int k=  intlog(e2-s1+1);

    // Get the 2 intervals that can cover [s1,e2]
    // Note these two intervals always overlap

    // end of first interval
    int e1 = s1 + (1<<k)-1;

    // start of second interval
    int s2 = e2 - (1<<k) + 1;

    // Compensate for overlapping as well as to
    // find possible merging of the first interval
    // and second interval since they might share a
    // comon boundary value
    int vv1 = n[s2];
    int vv2 = n[e1];
    int vvl1 = min(en[vv1], e2) -  max(st[vv1], s1) + 1;
    int vvl2 = min(en[vv2], e2) -  max(st[vv2], s1) + 1;

    return max(max(vvl1, vvl2), max(f[s1][k], f[s2][k]));
}

void doit(){
    int i,j;
    // Build the lookup table
    for (i = 0; i < N; i++){
        f[i][0] = 1;
    }
    for (i=1; (1<<i) <= N; i++){
        for (j = 0; j+(1<<i) <= N; j++){ 
            // This is almost similar except that we build a 2^i
            // interval based on two 2^(i-1) intervals that don't overlap
            int k = i-1;
            int s1 = j;
            int e2 = j + (1<<i)-1;
            int e1 = s1 + (1<<k)-1;
            int s2 = e2 - (1<<k) + 1;
            int vv1 = n[s2];
            int vv2 = n[e1];
            int vvl1 = min(en[vv1], e2) -  max(st[vv1], s1) + 1;
            int vvl2 = min(en[vv2], e2) -  max(st[vv2], s1) + 1;
            f[j][i]= max(max(vvl1, vvl2), max(f[s1][k], f[s2][k]));
        }
    }
}

char out[100000*8];
int outidx;

int main()
{
    int q;
    while (9){
       int y= scanf("%d", &N);if (! N) break;
       scanf("%d",&q);
        int i,j;
        int prev=rebase(100001);
        for (i=0;i<N;i++){ int p;
            scanf("%d", &p); p =rebase(p);
            n[i] = p;
            if ( prev !=p ){ en[prev] = i-1; st[p] = i;}
            prev = p;
        }
        en[ n[N-1] ] = N-1;
        doit();
        outidx=0;
        for (i=0;i<q;i++){ int a,b;
            scanf("%d%d", &a, &b);
            outidx+=sprintf(&out[outidx], "%d\n", qu(a-1,b-1));
        }
        fwrite(out, 1, outidx,  stdout);
    }
}

