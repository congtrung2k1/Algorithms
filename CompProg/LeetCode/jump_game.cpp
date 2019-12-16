/**
 * Idea is to work backwards from the last index.
 * Keep track of the smallest index that can "jump" to the last index.
 * Check whether the current index can jump to this smallest index.
 */
class Solution {
public:
    bool canJump(int A[], int n) {
        int last=n-1,i,j;
        for(i=n-2;i>=0;i--){
            if(i+A[i]>=last)last=i;
        }
        return last<=0;
    }
};
