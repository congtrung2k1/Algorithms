/**
 * Idea is to swap each positive integer you encounter to its "rightful" place
 * at index (x-1) where x is the integer.  Something like bucket sort.
 * It's O(n) because you visit each integer at most twice in 2 different loop
 * iterations.
 */
#include<iostream>
using namespace std;
class Solution {
public:
    int firstMissingPositive(int A[], int n) {
        int i,j;
        for(i=0;i<n;i++){
            int cur=A[i];
            // if in place or non-pos or out of bounds, skip.
            if(cur==i+1||cur<=0||cur>n)continue;
            swap(A[i],A[cur-1]);
            // if not the same, then reprocess it.
            if(A[i]!=A[cur-1])
                i--;
        }

        for(i=0;i<n;i++)
            if(A[i]!=i+1)
                return i+1;
        return n+1;
    }
};
