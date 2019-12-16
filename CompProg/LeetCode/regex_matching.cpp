/**
 * Dynamic programming.
 */
#include<iostream>
#include<string>
#include<cstring>
using namespace std;

char dp[900][900];

class Solution{
public:
    bool isMatch(const char*s, const char*p){
        memset(dp,-1,sizeof dp);
        return match(s,p,0,0);
    }
    bool match(const char*s, const char*p, int a, int b){
        char & c = (dp[a][b]);
        if (c!=-1)return c==1;

        if(p[b] && p[b+1]){
            if(p[b+1]=='*'){
                char m = p[b];
                bool curmatch=(s[a]==m&&m!='.')||(s[a]&&m=='.');
                return c=(curmatch && match(s,p,a+1,b)) || match(s,p,a,b+2);
            }
        }

        char ch = p[b];
        switch(ch){
        case '.':
            return c=s[a] && match(s,p,a+1,b+1);
        case 0:
            return c=s[a]==0;
        default:
            return c=s[a]==ch && match(s,p,a+1,b+1);
        }
    }
};

int main(){
    Solution s;
    cout<<!s.isMatch("aa","a")<<endl;
    cout<<s.isMatch("aa","aa")<<endl;
    cout<<!s.isMatch("aaa","a")<<endl;
    cout<<s.isMatch("aa",".*")<<endl;
    cout<<s.isMatch("aa","a*")<<endl;
    cout<<s.isMatch("ab",".*")<<endl;
    cout<<s.isMatch("aab","a*b")<<endl;
    cout<<s.isMatch("aab","c*a*b")<<endl;
    cout<<!s.isMatch("ab",".*c")<<endl;
}
