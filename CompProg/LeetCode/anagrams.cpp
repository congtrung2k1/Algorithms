/**
 * Use a map to keep track of each anagram.
 * N=number of strings, M=average number of chars in each string.
 * the code is a little bit long, but this uses O(N) space assuming
 * unordered_map uses space linear to the number of keys.
 * Space complexity excludes the space needed for the solution.
 * Runtime is O(M*N) as each char is processed.
 */
#include <iostream>
#include<unordered_map>
#include<vector>
using namespace std;
struct key{
    int freq[26];
    int hash;
    bool operator==(const key&k2)const{
        int i,j;
        if(k2.hash!=hash)return false;
        for(i=0;i<26;i++)
            if(freq[i]!=k2.freq[i])return false;
        return true;
    }
};
namespace std{
    template<> struct hash<key> {
        size_t operator()(const key&k)const {
            return k.hash;
        }
    };
};
typedef unordered_map<key,int> mapt;
class Solution {
    public:
    key calc(const string&s){
        key k={0};
        int i,j;
        for(char c : s){
            k.freq[c-'a']++;
        }
        for(i=0;i<26;i++){
            k.hash ^= k.freq[i];
        }
        return k;
    }
    vector<string> anagrams(vector<string> &strs) {
         int i,j;
         vector<string> r;
         mapt map;
         for(i=0;i<strs.size();i++){
             key k=calc(strs[i]);
             pair<mapt::iterator,bool> p=map.emplace(make_pair(k,i));
             if(!p.second){//already inserted
                 r.emplace_back(strs[i]);
                 int&idx=(p.first)->second;
                 if(idx>=0){
                    r.emplace_back(strs[idx]);
                    idx = -1;
                 }
             }
         }
         return r;
    }
};
int main() {
	Solution s;
	vector<string>v1 = {"dog", "god", "cat", "tac" , "rye" , "aye"};
	vector<string> v  = s.anagrams(v1);
	for(int i=0;i<v.size();i++)
		cout<<v[i]<<endl;
	return 0;
}
