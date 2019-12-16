class Solution {
public:
    string longestCommonPrefix(vector<string> &strs) {
        int i,j;
        if(!strs.size())return "";
        for(i=0;i<strs[0].size();i++){
            char c=strs[0][i];
            for(j=1;j<strs.size()&&i<strs[j].size()&&strs[j][i]==c;j++);
            if(j!=strs.size()) break;
        }
        return strs[0].substr(0,i);
    }
};