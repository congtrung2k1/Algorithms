/**
* Algorithm:
* Scan S from left to right, keeping track of the window endpoints. Advance
* the left endpoint whenever it is redundant.
*/
#include<iostream>
#include<string>
#include<vector>
using namespace std;

class Solution {
public:
    string minWindow(string S, string T) {
        vector<int> pos;
        int all[256]={0};
        int freq[256]={0};
        int i,j;
        for(i=0;i<T.size();i++)
            all[T[i]]++;
        int bestlen=S.size()+1,best1=-1,best2=-1,cur1=-1,cur2=0;
        int count=0;
        int posidx=0;
        for(i=0;i<S.size();i++){
            int ch=S[i];
            if(!all[ch])continue;
            cur2=i;
            if(cur1<0)cur1=cur2;
            pos.push_back(cur2);

            // have we seen this char before?
            if(freq[ch]++<all[ch])count++;

            // shrink the first endpoint whenever it is redundant.
            while(freq[S[cur1]]>all[S[cur1]]&&posidx+1<pos.size()){
                freq[S[cur1]]--;
                cur1=pos[++posidx];
            }
            int curlen=cur2-cur1+1;
            if(count==T.size()&&curlen<bestlen){
                best1=cur1;best2=cur2;bestlen=curlen;
            }
        }
        if(best2<0)return "";
        return S.substr(best1,bestlen);
    }
};

int main(){
    Solution s;
    string a,b;
    cin>>a>>b;
    cout<<s.minWindow(a,b)<<endl;
    return 0;
}
