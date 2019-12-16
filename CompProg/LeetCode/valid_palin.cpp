#include<cctype>
#include<cstring>
class Solution {
public:
    
    bool isPalindrome(string s) {
        int i,j;        
        for(i=j=0;i<s.size();i++){
            char c=tolower(s[i]);
            if(!isalnum(c))continue;
            s[j++]=c;
        }
        for(i=0;i<j/2;i++)
            if(s[i]!=s[j-i-1]) return false;
        return true;
    }
};