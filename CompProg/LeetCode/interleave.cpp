/**
 * Dynamic programming.
 */
#include<iostream>
#include<vector>
#include<unordered_map>
using namespace std;
typedef pair<int,int> intpair;
typedef unordered_map<intpair,int> mapt;
namespace std{
    template<> struct hash<intpair>{
        inline size_t operator()(const intpair&s)const{
            return s.first^s.second;
        }
    };
};
class Solution {
public:
    bool isInterleave(mapt&m,string&s1,string&s2,string&s3, int a, int b){
        int c = a+b;
        if(c==s3.size()&&a==s1.size()&&b==s2.size())return true;
        pair<mapt::iterator,int> p=m.emplace(make_pair(make_pair(a,b),-1));
        int&ans=(p.first)->second;
        if(!p.second && ans>=0)return ans==1;
        
        if(a<s1.size() && s1[a]==s3[c] && isInterleave(m,s1,s2,s3,a+1,b))
            return ans=1;
        if(b<s2.size() && s2[b]==s3[c] && isInterleave(m,s1,s2,s3,a,b+1))
            return ans=1;
        return ans=0;
    }
    
    bool isInterleave(string s1, string s2, string s3) {
        mapt m;
        return isInterleave(m,s1,s2,s3,0,0);
    }
};
int main(){
    Solution s;
    cout<<(s.isInterleave("aabcc","dbbca","aadbbcbcac"))<<endl;
    cout<<(!s.isInterleave("aabcc","dbbca","aadbbbaccc"))<<endl;
    cout<<(s.isInterleave("","",""))<<endl;
    cout<<(s.isInterleave("a","","a"))<<endl;
    cout<<(s.isInterleave("","a","a"))<<endl;
    cout<<(!s.isInterleave("a","","ab"))<<endl;
    cout<<(!s.isInterleave("","b","ab"))<<endl;
    cout<<(s.isInterleave("a","b","ab"))<<endl;
    cout<<(!s.isInterleave("a","b","a"))<<endl;
    cout<<(s.isInterleave("ab","ac","abac"))<<endl;
    cout<<(s.isInterleave("ab","ac","aabc"))<<endl;
    
}