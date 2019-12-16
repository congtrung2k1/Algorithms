#include<vector>
using namespace std;
class Solution {
public:
    vector<vector<int> > generate(int numRows) {

        vector<vector<int> > rows;
        if(!numRows)return rows;
        rows.emplace_back();
        rows[0].push_back(1);
        int i,j;
        for(i=1;i<numRows;i++){
            rows.emplace_back();
            vector<int>&cur=rows.back(),&prev=rows[i-1];
            cur.push_back(1);
            for(j=0;j<prev.size()-1;j++)
                cur.push_back(prev[j]+prev[j+1]);
            cur.push_back(1);
        }
        return rows;
    }
};
