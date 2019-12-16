/**
 * Algorithm: See comments below. Runtime is O(n).
 */
#include<iostream>
#include<vector>
#include<limits>
using namespace std;
class Solution {
public:
    int candy(vector<int> &ratings) {
        int i,j,k,sum=0,prevcount;
        const int n=ratings.size();
        for(i=0;i<n;){
            int prev=numeric_limits<int>::max();
            // find longest non-increasing sequence starting at i.
            for(j=i;j<n&&ratings[j]<=prev;j++)
                prev=ratings[j];
            int count=1;
            // assign count for each elem in the current sequence.
            prev=ratings[j-1];
            for(k=j-1;k>=i;k--){
                int cur=ratings[k];
                if(cur>prev)count++;
                else count=1;
                sum+=count;
                prev=cur;
            }            
            // fix the count for the first elem in this sequence if need be.
            if(i&&ratings[i]>ratings[i-1]&&count<=prevcount){
                sum+=prevcount+1-count;
                if(i+1==j){prevcount++;}
                else prevcount=1;                
            }
            else prevcount=1;
            i=j;
        }
        return sum;
    }
};
void check(vector<int>&r,int ans){
    Solution s;
    cout<<(s.candy(r)==ans)<<endl<<endl;
}
int main(){
    vector<int> v1={-1}; check(v1, 1);
    vector<int> v2={10};check(v2, 1);
    vector<int> v3={2,2,2};check(v3, 3);
    vector<int> v4={2,2,3};check(v4, 4);
    vector<int> v5={2,3,2};check(v5, 4);
    vector<int> v6={2,3,3};check(v6, 4);
    vector<int> v7={3,2,2};check(v7, 4);
    vector<int> v8={3,2,3};check(v8, 5);
    vector<int> v9={3,3,2};check(v9, 4);
    vector<int> v10={3,3,3};check(v10, 3);
    vector<int> v11={5,4,3,3,2,2,5};    check(v11, 3+2+1+2+1+1+2);
    vector<int> v12={5,4,3,3,2,2,5,5};  check(v12, 3+2+1+2+1+1+2+1);
    vector<int> v13={5,4,3,3,2,2,5,4};  check(v13, 3+2+1+2+1+1+2+1);
    vector<int> v14={5,4,3,3,2,2,5,4,4};check(v14, 3+2+1+2+1+1+2+1+1);
    vector<int> v15={5,4,3,3,2,2,5,4,3};check(v15, 3+2+1+2+1+1+3+2+1);
    vector<int> v16={1,3,5};check(v16, 1+2+3);
    vector<int> v17={1,3,5,4};check(v17, 1+2+3+1);
}

