/**
 * Dynamic programming.
 */
#include<iostream>
#include<unordered_map>
using namespace std;

typedef unordered_map<int,int> mapt;

class Solution {
public:
    int numDecodings(string s) {
        mapt m;
        if(s=="")return 0;
        return find(m,s,0);
    }
    int find(mapt&m,const string&s,int a){
        pair<mapt::iterator,bool> ret=m.emplace(make_pair(a,-1));
        int& r = ret.first->second;
        if(!ret.second&&r>=0)
            return r;
        int ans=0;
        char c=s[a];
        if(c==0)return 1;
        if('1'<=c&&c<='9'){
            ans=find(m,s,a+1);
            if(a+1<s.size()&&(c=='1'||(c=='2'&&'0'<=s[a+1]&&s[a+1]<='6'))){
                ans+=find(m,s,a+2);
            }
        }
        return r=ans;
    }
};

int main(){
    Solution s;
    cout<<(s.numDecodings("126")==3)<<endl;
    cout<<(s.numDecodings("12")==2)<<endl;
    cout<<(s.numDecodings("1")==1)<<endl;
    cout<<(s.numDecodings("10")==1)<<endl;
    cout<<(s.numDecodings("1010")==1)<<endl;
    cout<<(s.numDecodings("1011")==2)<<endl;
    cout<<(s.numDecodings("101")==1)<<endl;
    cout<<(s.numDecodings("0")==0)<<endl;
    cout<<(s.numDecodings("")==0)<<endl;
}
