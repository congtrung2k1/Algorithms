
struct comp {
  bool operator() (const Interval&it,const Interval&it2) { return (it.start<it2.start);}
};
#include<algorithm>
using namespace std;
class Solution {
public:
    vector<Interval> merge(vector<Interval> &v) {
        const int n=v.size();
        if(!n)return v;
        sort(v.begin(),v.end(),comp());
        int i,j;
        for(i=1,j=0;i<n;i++){
            Interval cur=v[i],prev=v[j];
            if(cur.start<=prev.start){
                v[j]=cur;
                v[j].end=max(prev.end,cur.end);
            }else if(cur.start<=prev.end){
                v[j].end=max(prev.end,cur.end);
            }else v[++j]=cur;
        }
        v.resize(j+1);
        return v;
    }
};
