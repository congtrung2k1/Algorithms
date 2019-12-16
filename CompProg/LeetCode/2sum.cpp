#include<vector>
#include<unordered_map>
using namespace std;

typedef unordered_map<int,int> mapt;

class Solution {
public:
    vector<int> twoSum(vector<int> &numbers, int target) {
        mapt freqm,idxm;
        int i,j;
        for(i=0;i<numbers.size();i++){
            freqm[numbers[i]]++;
            idxm[numbers[i]]=i;
        }

        for(i=0;i<numbers.size();i++){
            int cur=numbers[i];
            int d=target-cur;
            mapt::iterator it=freqm.find(d);
            if(it!=freqm.end()&&((d==cur&&it->second>=2)||d!=cur)){
                int a=i;
                int b=idxm[d];
                if(d==cur&&b==i){
                    for(b=0;numbers[b]!=d||b==i;b++);
                }
                vector<int> v={min(a,b)+1,max(a,b)+1};
                return v;
            }
        }
        return vector<int>(); // should never reach here
    }
};
