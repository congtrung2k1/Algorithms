/**
 * Dynamic programming.
 */
#include<vector>
#include<limits>
using namespace std;
class Solution {
public:
    int minimumTotal(vector<vector<int> > &triangle) {
        const int n=triangle.size();
        if(!n)return 0;
        const int inf=numeric_limits<int>::max();
        vector<int> v(n,inf);
        v[0]=0;
        int i,j;
        for(i=0;i<n;i++){
            int prev=inf;
            for(j=0;j<=i;j++){
                int m=min(prev,v[j]);
                prev=v[j];
                v[j]=m+triangle[i][j];
            }
        }
        int ans=v[0];
        for(i=1;i<n;i++)
            ans=min(ans,v[i]);
        return ans;
    }
};
