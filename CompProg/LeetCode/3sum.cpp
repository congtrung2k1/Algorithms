/**
 * Algorithm is O(n^2) without using extra space except to store the solution.
 */
#include<iostream>
#include<vector>
#include<algorithm>
using namespace std;

struct comp{
    inline bool operator()(const int&a, const int&b)const{
        return a<b;
    }
};

class Solution {
public:
    vector<vector<int> > threeSum(vector<int> &num) {
        sort(num.begin(),num.end(),comp());
        vector<vector<int> > ans;
        int i,j,prev1;
        const int n=num.size();
        for(i=0;i<n;prev1=num[i],i++){
            int a=num[i];
            // skip duplicates to avoid duplicate triplets.
            if(i&&a==prev1)continue;
            // below is essentially the O(n) method for 2sum,
            // with duplicate detection.
            int i1=i+1,i2=n-1,prev2,prev3=num[i2]+1;
            while(i1<i2){
                int b=num[i1],c=num[i2],sum=a+b+c;
                if(sum>0)i2--;
                else if(sum<0)i1++;
                else {
                    if (b!=prev2||c!=prev3){
                        ans.emplace_back();
                        ans.back()={a,b,c};
                    }
                    i1++;
                }
                prev2=b;
                prev3=c;
            }
        }
        return ans;
    }
};

int main(){
    Solution s;
    vector<int> num={-1,-1,-1,-2,2,0,0,0,1,2,-1,1,2,-1,-4};
    int i,j,k;
    vector<vector<int> > ans=s.threeSum(num);
    for(i=0;i<ans.size();i++){
        for(j=0;j<ans[i].size();j++)
            cout<<ans[i][j]<<" ";
        cout<<endl;
    }
}
