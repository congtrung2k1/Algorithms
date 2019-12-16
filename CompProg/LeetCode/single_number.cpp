/**
 * XOR all numbers in the array.
 */
class Solution {
public:
    int singleNumber(int A[], int n) {
        int i,j,s=0;
        for(i=0;i<n;i++)
            s^=A[i];
        return s;
    }
};
