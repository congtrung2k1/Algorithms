/**
 * DP.
 */
#include<vector>
#include<string>
#include<unordered_set>
using namespace std;
class Solution {
public:
    bool wordBreak(string s, unordered_set<string> &dict) {
        // dp[i] == whether s[i..] is breakable.
        vector<bool> dp(1+s.size(),false);
        dp[s.size()]=true; // true for empty string
        int i,j;
        string word;
        for(i=s.size()-1;i>=0;i--){
            word.clear();
            for(j=i;j<s.size();j++){
                word.append(1,s[j]);
                if(dict.find(word)==dict.end())continue;
                if(dp[j+1]){dp[i]=true;break;}
            }
        }
        return dp[0];
    }
};
