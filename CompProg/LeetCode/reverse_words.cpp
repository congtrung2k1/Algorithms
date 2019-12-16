#include<iostream>
#include<string>
#include<cstring>
using namespace std;

class Solution {
public:
    void reverseWords(string &s) {
        string ans;
        int i=s.size(),j,n=0;
        while(1){
            for(i--;i>=0&&isspace(s[i]);i--);
            if(i<0)break;
            ans.append(n,' ');
            int end=i;
            for(;i>0&&!isspace(s[i-1]);i--);
            ans.append(s,i,end-i+1);
            n=1;

        }
        s=ans;
    }
};

int main(){
    string s = "the sky is blue";
    Solution ss;
    ss.reverseWords(s);
    cout<<("blue is sky the"==s)<<endl;
    s = " hello world there ";
    ss.reverseWords(s);
    cout<<("there world hello"==s)<<endl;
    s = " a  b  c ";
    ss.reverseWords(s);
    cout<<(s=="c b a")<<endl;
}
