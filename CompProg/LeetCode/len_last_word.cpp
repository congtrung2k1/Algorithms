#include<cctype>
using namespace std;
class Solution {
public:
    int lengthOfLastWord(const char *s) {
        if(!s)return 0;
        const char*cur=s;
        int lastlen=0;
        while(*cur){
            for(;isspace(*cur);cur++);
            int curlen=0;
            for(;*cur&&!isspace(*cur);cur++,curlen++);
            lastlen=curlen;
            for(;isspace(*cur);cur++);
        }
        return lastlen;
    }
};