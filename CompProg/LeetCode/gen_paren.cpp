#include <vector>
#include<iostream>
using namespace std;
class Solution {
public:
    // recursive method to generate strings of nparens.
    void gen(vector<vector<string> >&r,
      const vector<size_t>&cc, string&prefix, int nparens){
        int i,j;
        vector<string>&v=r.back();
        if(nparens==0){
            v.emplace_back(prefix);
            return;
        }
        const size_t n=prefix.size();
        for(i=1;i<=min(r.size()-2, (size_t)nparens);i++){
            for(j=0;j<cc[i];j++){
                prefix.append(r[i][j]);
                gen(r,cc,prefix,nparens-i);
                prefix.resize(n);
            }
        }
    }
    vector<string> generateParenthesis(int n) {
        // r[i] is vector of possible strings for i parens.
        vector<vector<string> > r={{""}};
        // cc[i] is no. of possible strings for i parens that are
        // of the form (...x...) (entirely enclosed).
        vector<size_t> cc={0};
        int i,j,k,m;
        string s;
        for(i=1;i<=n;i++){ // i is no. of parens
            r.emplace_back();
            vector<string> &cur=r.back(),&prev=r[i-1];
            // enclose each possible string of (i-1) parens.
            for(j=0;j<prev.size();j++){
                s.assign(1,'(');
                s.append(prev[j]);
                s.append(1,')');
                cur.emplace_back(s);
            }
            cc.push_back(cur.size());
            s.clear();
            gen(r,cc,s,i);
        }
        return r.back();
    }
};
int main(){
    Solution s;
    int i,j;
    for(j=2;j<=5;j++){
        cout<<j<<": "<<endl;
        vector<string>v=s.generateParenthesis(j);
        for(i=0;i<v.size();i++){
            cout<<v[i]<<endl;
        }
        cout<<"------------"<<endl;
    }
}
