/**
 * Uses backtracking to brute force all possible solutions.
 * Fills 1 queen at a time from first column to last.
 * Uses arrays to keep track of occupied rows, diagonal 1 and diagonal 2 so collision can be detected in O(1) time.
 * Runtime is O(n^n) which could be reduced to O(n!) if we use linked lists to keep track of leftover possibilities so we
 * don't have to iterate over impossible slots.
 */
#include<vector>
using namespace std;
class Solution {
public:
    int find(int n, int left, int c, int r, vector<int>&rows,vector<int>&d1,vector<int>&d2){
        if (left == 0)
            return 1;
        int i=c,j,sum=0;
        for (j=r; j<n; j++){
            if (rows[j] || d1[i+j] || d2[n-1+i-j])
                continue;
            rows[j]=d1[i+j]=d2[n-1+i-j]=1;
            sum += find(n, left-1, i+1, 0,rows,d1,d2 );
            rows[j]=d1[i+j]=d2[n-1+i-j]=0;
        }
        return sum;
    }
    int totalNQueens(int n) {
        vector<int>  rows(n),d1(2*n-1),d2(2*n-1);
        int i,j;
        return find(n,n,0,0,rows,d1,d2);
    }
};





