/**
 * Dynamic programming. Tricky part is to avoid having a component with
 * leading zeroes.
 */
#include<iostream>
#include<vector>
#include<unordered_map>
#include<cstdlib>
using namespace std;
typedef pair<int,int> intpair;
typedef unordered_map<intpair,vector<string>*> mapt;
namespace std{
    template<>
    struct hash<intpair>{
        inline size_t operator()(const intpair&p)const{
            return p.first^p.second;
        };
    };
};
class Solution {
public:
    bool valid(const string&s, int a, int b){
        if(b==a)return true;
        if(s[a]=='0')return false;
        if(b-a+1==2)return true;
        int n = (s[a]-'0')*100 + (s[a+1]-'0')*10 + s[a+2]-'0';
        return b-a+1==3 && n<=255;
    }
    // returns the list of valid strings starting at idx,
    // and contains exactly n components
    vector<string>* find(const string&s,mapt&m, int idx, int n){
        pair<mapt::iterator,bool> p = m.emplace(make_pair(make_pair(idx,n),(vector<string>*)NULL));

        if(!p.second)return (p.first)->second;
        int i,j;
        if(n==1){
            i=s.size()-1;
            if(idx<=i&&valid(s,idx,i)){
                vector<string>*list=(p.first)->second=new vector<string>();
                list->emplace_back(s,idx,i-idx+1);
                return list;
            }
            return NULL;
        }
        vector<string>*list=(p.first)->second=new vector<string>();
        for(i=idx;i<min((int)s.size(),idx+3);i++){
            if(!valid(s,idx,i))continue;
            vector<string>*list2=find(s,m,i+1,n-1);
            if(!list2||!list2->size())continue;
            string comp(s,idx,i-idx+1);
            comp.append(1,'.');
            int len=comp.size();
            for(j=0;j<list2->size();j++){
                comp.resize(len);
                comp.append((*list2)[j]);
                list->emplace_back(comp);
            }
        }
        return list;
    }
    vector<string> restoreIpAddresses(string s) {
        mapt m;
        vector<string> *list=find(s,m,0,4);
        // warning: mem not freed.
        return *list;
    }
};
void check(const string&s){
    int i,j;
    Solution sol;
    string s2(s);
    vector<string>list=sol.restoreIpAddresses(s2);
    for(i=0;i<list.size();i++){
        cout<<list[i]<<endl;
    }
    cout<<endl;
}
int main(){
    Solution s;
    check("25525511135");
    check("010010");
}
