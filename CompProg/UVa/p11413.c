/**
 * Algorithm:
 * Binary search on capacity
 *
 * A summary of the description if you're confused:
 * Basically find the min of max sum of the partition of a row of numbers
 * Eg: Given a row of integers 1,2,3,4 ... etc.
 * Partition them into groups : (1,2) (3,4, 5) , ... , (...) without any left over
 * Let k = max(sum of any of the group)
 * Find min(k) of all possible partitions
 *
 * Gotchas:
 * - Not all containers must be used. Some can be unused.
 *   This is implied by the fact that max(m) > max(n)
 * */

#include<stdlib.h>
#include<string.h>
#include<stdio.h>
int  v[1024],n,m;

// test whether limit is possible by trying to form a solution
// with the max <= limit
bool poss(int limit){
    int  cnt=1; // # of containers needed
    int  s=0;   // current run
    int i,j;
    for (i=0;i<n;i++){
        if(s+v[i]> limit ){ 
            s=v[i]; cnt++; 
            if (cnt > m ) return false;
        }
        else s+=v[i];
    }

    return true;
}

int main(){

    while(9){
        int k = scanf("%d%d",&n,&m);
        if (k!=2)break;
        int i,j;
        int l=0,r; // low and upp bounds
                   // low=max(v[i]), upp = sum(v[i])
        int sum = 0;
        for (i=0;i<n;i++){
            
            scanf("%d", & v[i]);
            sum+=v[i];
            if (v[i] > l) l = v[i];
        }

        r = sum;
        while (l<r){
            int mid =(l+r)/2;
            if (poss(mid)) r = mid;
            else l = mid+1;
        }
        printf("%d\n",r);
    }
}
