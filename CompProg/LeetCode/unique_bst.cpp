#include<iostream>
#include<vector>
using namespace std;
class Solution {
public:
    int numTrees(int n) {
        int i,j;
        vector<int> d(1+n,0);
        d[0]=1;
        for(i=1;i<=n;i++){ // no. of elems
            for(j=0;j<i;j++) // no. of elems in left subtree
                d[i]+=d[i-1-j]*d[j];
        }
        return d[n];
    }
};
int main(){
    Solution s;
    s.numTrees(50);
}
