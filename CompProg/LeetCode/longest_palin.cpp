#include<string>
#include<vector>
using namespace std;
class Solution {
public:
    string longestPalindrome(string s) {
        if(!s.size())return "";
        int i,j,ans=1,bestidx=0;
        const int n=s.size();
        for(i=0;i<n;i++){
            for(j=0;i-j>=0&&i+j<n&&s[i-j]==s[i+j];j++){
                if(2*j+1>ans){
                    ans=2*j+1;
                    bestidx=i-j;
                }
            }
            for(j=0;i-j>=0&&i+j+1<n&&s[i-j]==s[i+j+1];j++){
                if(2*j+2>ans){
                    ans=2*j+2;
                    bestidx=i-j;
                }
            }
        }
        return s.substr(bestidx,ans);
    }
};
