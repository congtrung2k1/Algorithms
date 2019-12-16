/**
 * Dynamic programming.
 */
#include<iostream>
#include<string>
#include<vector>
#include<unordered_map>
#include<unordered_set>
using namespace std;

typedef unordered_map<int,vector<string>* > mapt;

class Solution {
public:
    // returns all valid combinations for s[idx..]
    vector<string>* find(unordered_set<string> &dict, mapt&m, string&s, int idx){
        if (idx==s.size())return NULL;
        mapt::iterator it=m.find(idx);
        int i,j;
        if(it!=m.end())
            return (it->second);
        string word;
        vector<string>*list=new vector<string>();
        m.emplace(make_pair(idx,(list)));
        for(i=idx;i<s.size();i++){
            word.append(1,s[i]);
            if(dict.find(word)==dict.end())continue;
            vector<string>* list2=find(dict,m,s,i+1);
            if(list2==NULL){
                list->push_back(word);
                continue;
            }
            int len=word.size();
            word.append(1, ' ');
            for(j=0;j<list2->size();j++){
                word.resize(1+len);
                word.append((*list2)[j]);
                list->push_back(word);
            }
            word.resize(len);
        }
        return list;
    }

    vector<string> wordBreak(string s, unordered_set<string> &dict) {
        mapt m;
        vector<string>*list=find(dict,m,s,0);
        if(list==NULL)return vector<string>();
        vector<string> ans(*list);
        // warning: memory is not freed for m.
        return ans;
    }
};
unordered_set<string> dict={"hello","cat","cats","sand","dog","and"};

void check(const string&st){
    cout<<st<<":"<<endl;
    Solution s;
    vector<string>ans=s.wordBreak(st,dict);
    int i,j;
    for(i=0;i<ans.size();i++)
        cout<<"\t\""<<ans[i]<<'"'<<endl;
    cout<<endl;
}
int main(){
    check("hellocatsanddog");
    check("catsanddog");
    check("cat");
    check("cats");
    check("catsand");
    check("");
    check("c");
}
