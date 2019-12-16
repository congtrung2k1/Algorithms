#include<iostream>
using namespace std;
class Solution {
public:
    int maxSubArray(int A[], int n) {
        int ans=A[0],i,j,sum=0;
        for(i=0;i<n;i++){
            sum+=A[i];
            ans=max(sum,ans);
            if(sum<0)sum=0;
        }
        return ans;
    }
};
