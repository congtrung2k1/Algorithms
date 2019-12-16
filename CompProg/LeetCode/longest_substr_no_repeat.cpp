#include<cstring>
#include<iostream>
using namespace std;
class Solution {
public:
    int lengthOfLongestSubstring(const string& s) {
        int idx[256]; // indices of each char.
        memset(idx,-1,sizeof idx);
        int i,j,best=0,start=0;
        for(i=0;i<s.size();i++){
            const unsigned char c=(unsigned char)s[i];
            j=idx[c];
            idx[c]=i;
            if(start<=j){
                start=j+1;
            }
            best=max(best,i-start+1);
        }
        return best;
    }
};
