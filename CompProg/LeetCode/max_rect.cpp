/**
 * Same algorithm as the "max rectangle in histogram" problem.
 * Keep track of the "column run" for each column and apply that algorithm
 * to each row. "Column run" is the number of contiguous 1's.
 */
#include<vector>
#include<iostream>
using namespace std;
struct run{
    int index, value;
    run(int index_, int value_): index(index_), value(value_){}
};
class Solution {
public:
    int maximalRectangle(vector<vector<char> > &matrix) {
        if(!matrix.size())return 0;
        const int nRows = matrix.size(), nCols = matrix[0].size();
        vector<run> seqs;
        vector<int> colRuns(nCols,0);
        int i,j,ans=0;
        for(i=0;i<nRows;i++){
            seqs.assign(1,run(0,-1)); // sentinel value
            for(j=0;j<nCols;j++){
                int ch=matrix[i][j]-'0';
                int cur = colRuns[j] = (colRuns[j] & -ch)+ch; // increment by 1 if ch is 1, else set to 0.
                int idx=j;
                while(seqs.back().value>=cur){
                    run& r = seqs.back();
                    ans=max(ans,r.value*(j-r.index));
                    idx=r.index;
                    seqs.pop_back();
                }
                seqs.push_back(run(idx,cur));
            }
            while(seqs.size()>1){
                run& r = seqs.back();
                ans=max(ans,r.value*(nCols-r.index));
                seqs.pop_back();
            }
        }
        return ans;
    }
};

vector<char> make(const char*s){
    vector<char> v;
    for(int i=0;s[i];i++)
        v.push_back(s[i]);
    return v;
}

int main(){
    Solution s;
    vector<vector<char> > m= {make("01"), make("01")};
    int k = s.maximalRectangle(m);
    cout<<(k==2)<<endl;
    m= {make("001"), make("101"), make("101")};
    k = s.maximalRectangle(m);
    cout<<(k==3)<<endl;
    m= {make("1")};
    k = s.maximalRectangle(m);
    cout<<(k==1)<<endl;
    m= {make("1"),make("1")};
    k = s.maximalRectangle(m);
    cout<<(k==2)<<endl;
    m= {make("011"), make("111"), make("101")};
    k = s.maximalRectangle(m);
    cout<<(k==4)<<endl;
    m={make("01101"),make("11010"),make("01110"),make("11110"),make("11111"),make("00000")};

    k = s.maximalRectangle(m);
    cout<<(k==9)<<endl;
}
