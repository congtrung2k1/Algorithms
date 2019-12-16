/**
 * Dynamic programming.
 */
#include<iostream>
using namespace std;
class Solution {
public:
    int longestValidParentheses(string s) {
        // dp[i] = longest length of valid substring ending at i
        int*dp=new int[s.size()]();
        int i,j,ans=0;
        for(i=1;i<s.size();i++){
            char c=s[i];
            if(c!=')')continue;
            int k=dp[i-1];
            j=i-1-k;
            // account for any nested structure
            if(j>=0&&s[j]=='('){
                ans=max(ans,dp[i]=k+2);
                // append length of adjacent valid substring
                if(--j>=0)
                    ans=max(ans,dp[i]+=dp[j]);
            }
        }
        delete[]dp;
        return ans;
    }
};
int main(){
    Solution s;
    cout<<(s.longestValidParentheses("")==0)<<endl;
    cout<<(s.longestValidParentheses("(")==0)<<endl;
    cout<<(s.longestValidParentheses(")")==0)<<endl;
    cout<<(s.longestValidParentheses("))")==0)<<endl;
    cout<<(s.longestValidParentheses(")(")==0)<<endl;
    cout<<(s.longestValidParentheses("(()")==2)<<endl;
    cout<<(s.longestValidParentheses("(()()")==4)<<endl;
    cout<<(s.longestValidParentheses("(()())")==6)<<endl;
    cout<<(s.longestValidParentheses("(()()(")==4)<<endl;
    cout<<(s.longestValidParentheses("(())")==4)<<endl;
    cout<<(s.longestValidParentheses(")()")==2)<<endl;
    cout<<(s.longestValidParentheses(")())")==2)<<endl;
    cout<<(s.longestValidParentheses(")()()")==4)<<endl;
    cout<<(s.longestValidParentheses(")()()(")==4)<<endl;
    cout<<(s.longestValidParentheses(")()(())")==6)<<endl;
    cout<<(s.longestValidParentheses(")()(())()")==8)<<endl;
    cout<<(s.longestValidParentheses("(()))")==4)<<endl;
    cout<<(s.longestValidParentheses("(()")==2)<<endl;
    cout<<(s.longestValidParentheses("((())")==4)<<endl;
    cout<<(s.longestValidParentheses("()(")==2)<<endl;
    cout<<(s.longestValidParentheses("((()(")==2)<<endl;
    cout<<(s.longestValidParentheses("((()()")==4)<<endl;
    cout<<(s.longestValidParentheses("((()(()")==2)<<endl;
    cout<<(s.longestValidParentheses("()()))))()()(")==4)<<endl;
}
