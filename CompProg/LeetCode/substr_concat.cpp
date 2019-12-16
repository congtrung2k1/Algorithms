/**
 * Pretty straightforward O(|S|*|L|) solution.
 * Tricky part is L may contain duplicate words and so need to keep
 * track of frequency.
 */
#include<iostream>
#include<vector>
#include<unordered_map>
using namespace std;
struct meta{
    int idx,freq=0;
};
typedef unordered_map<string,meta> strmap;
class Solution {
public:
    vector<int> findSubstring(string S, vector<string> &L) {
        vector<int> ans;
        vector<int> used;
        strmap words;
        if(!L.size())return ans;
        int i,j,k;
        const int wsize=L[0].size();
         int wordcount=0;
        for(i=0;i<L.size();i++){
            meta m;
            pair<strmap::iterator,bool>p=words.emplace(make_pair(L[i],m));
            if(p.second)((p.first)->second).idx=wordcount++;
            ((p.first)->second).freq++;
        }
        string w;
        for(i=0;i<S.size()-wsize*L.size()+1;i++){
            used.assign(wordcount, 0);
            int count=0;            
            for(j=i;j<S.size()-wsize+1;j+=wsize){
                w.clear();
                w.append(S,j,wsize);
                strmap::iterator it=words.find(w);
                if(it==words.end())break;
                meta&m=it->second;
                if(used[m.idx]>=m.freq)break;
                if(++used[m.idx]==m.freq){
                    if(++count==wordcount){ans.push_back(i);break;}
                }
            }
        }
        return ans;
    }
};