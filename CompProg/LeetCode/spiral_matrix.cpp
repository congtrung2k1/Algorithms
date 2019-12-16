#include<iostream>
#include<vector>
using namespace std;
class Solution {
public:
    vector<int> spiralOrder(vector<vector<int> > &matrix) {
        vector<int> ans;
        if(!matrix.size())return ans;
        int i,j,c=0;
        const int m=matrix.size(),n=matrix[0].size();
        for(i=0;ans.size()<m*n;i++){
            for(j=i;j<n-i;j++) ans.push_back(matrix[i][j]);
            for(j=i+1;j<m-i;j++) ans.push_back(matrix[j][n-i-1]);
            if(m-i-1!=i)for(j=n-2-i;j>=i;j--) ans.push_back(matrix[m-i-1][j]);
            if(n-i-1!=i)for(j=m-2-i;j>=1+i;j--) ans.push_back(matrix[j][i]);
        }
        return ans;
    }
};
void check(const vector<vector<int> > &matrix, const vector<int>&a){
    Solution s;
    int i,j;
    vector<int> ans=s.spiralOrder(const_cast<vector<vector<int> > &>(matrix));
    cout<<(a==ans)<<endl;
}
int main(){
    check({{1, 2, 3, 4}, {8, 7, 6, 5}}, {1, 2, 3, 4, 5, 6, 7, 8});
    check({{1, 2, 3, 4}, {10, 11, 12, 5}, {9, 8, 7, 6}}, {1, 2, 3, 4, 5, 6, 7, 8,9,10,11,12});
    check({{1}, {2}}, {1, 2});
    check({{1, 2}, {6, 3}, {5, 4}}, {1, 2, 3, 4, 5, 6});
    check({{1, 2}},{1,2});
    check({{1}},{1});
    check({{1, 2}, {3, 4}},{1,2,4,3});
    check({{1, 2, 3}, {4, 5, 6}, {7, 8, 9}},{1,2,3,6,9,8,7,4,5});
    check({{1, 2, 3, 4}, {5, 6, 7, 8}, {9, 10, 11, 12}, {13, 14, 15, 16}},{1,2,3,4,8,12,16,15,14,13,9,5,6,7,11,10});
    
}