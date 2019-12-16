/**
 * Algorithm is amortised O(n).
 */
#include<iostream>
#include<vector>
using namespace std;
typedef pair<int,int> intpair;
class Solution {
public:
    int largestRectangleArea(vector<int> &height) {
        const int n=height.size();
        int i,j,ans=0,runcount=0,prev=-1,runheight=0;

        // keeps track of long running sequences.
        // st[i] = (height, starting index).
        // st[i].first <= st[j].first for all j >= i
        vector<intpair> st;

        // There is at most one push per iteration and we pop at most O(n) times
        // throughout the entire loop.
        for(i=0;i<n;i++){
            int cur=height[i];
            if(cur<=prev){
                runcount++;
                runheight=min(cur,runheight);
                // check whether we are "cutting" off any long running sequence.
                int index=-1;
                while(st.size()&&cur<st.back().first){
                    intpair&p=st.back();
                    index=p.second;
                    ans=max(ans,p.first*(i-p.second));
                    st.pop_back();
                }
                if(index>=0)
                    st.push_back(make_pair(cur,index));
            }else{
                // save the current sequence before we reset it.
                st.push_back(make_pair(runheight,i-runcount));
                runcount=1;
                runheight=cur;
            }
            ans=max(ans,runcount*runheight);
            prev=cur;
        }
        while(st.size()){
            intpair&p=st.back();
            ans=max(ans,p.first*(n-p.second));
            st.pop_back();
        }
        return ans;
    }
};
void check(const vector<int>&v, int a){
    Solution sn;
    cout<<(sn.largestRectangleArea(const_cast<vector<int>&>(v))==a)<<endl;
}
int main(){
    check({1},1);
    check({1,2},2);
    check({2,2},4);
    check({2,1,2},3);
    check({2,1,0},2);
    check({3,2,1,6,5,4},12);
    check({3,2,1,3,2,1},6);
    check({3,2,1,3,2,1,0},6);
    check({1,2,1,2},4);
    check({2,1,2,1},4);
    check({2,2,2,1},6);
    check({3,6,5,7,4,8,1,0},20);
    check({0},0);
}
