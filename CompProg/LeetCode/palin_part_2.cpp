/**
 * Dynamic programming.
 */
#include<iostream>
#include<vector>
using namespace std;
class Solution {
public:
    int minCut(string s) {
        const int n=s.size();
        if(n==0)return 0;
        // dp[i+1] == min cuts for s[0..i].
        // Idea is to split the string into 2 parts, with the latter part
        // being a palindrome, and make use of the solution to the
        // subproblem defined by the first part.
        // The trick is to solve the problem while testing for the
        // palindrome property at the same time.
        vector<int> dp(n+1,n);
        dp[0]=-1; // sentinel
        int i,j;
        for(i=0;i<n;i++){
            // odd palindrome
            for(j=0;i-j>=0&&i+j<n&&s[i-j]==s[i+j];j++)
                dp[i+j+1]=min(dp[i+j+1],1+dp[i-j]);

            // even palindrome
            for(j=0;i-j>=0&&i+j+1<n&&s[i-j]==s[i+j+1];j++)
                dp[i+j+2]=min(dp[i+j+2],1+dp[i-j]);
        }
        return dp[n];
    }
};
int main(){
    Solution s;
    cout<<(s.minCut("")==0)<<endl;
    cout<<(s.minCut("a")==0)<<endl;
    cout<<(s.minCut("aa")==0)<<endl;
    cout<<(s.minCut("ab")==1)<<endl;
    cout<<(s.minCut("aba")==0)<<endl;
    cout<<(s.minCut("abb")==1)<<endl;
    cout<<(s.minCut("abhello")==5)<<endl;
    cout<<(s.minCut("bebebbe")==1)<<endl;
    cout<<(s.minCut("fifgbeajcacehiicccfecbfhhgfiiecdcjjffbghdidbhbdbfbfjccgbbdcjheccfbhafehieabbdfeigbiaggchaeghaijfbjhi")==75)<<endl;
    cout<<(s.minCut("aaaabbaaaaaaaaaa")==1)<<endl;

}
