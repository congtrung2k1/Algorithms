#include<vector>
using namespace std;
class Solution {
public:
    void setZeroes(vector<vector<int> > &matrix) {
        if(!matrix.size())return;
        int i,j;
        const int rows=matrix.size(),cols=matrix[0].size();
        // matrix[0][0]==0 is ambiguous as it can indicate either the first
        // row, column or both is to be zeroed. Hence we need 2 flags to keep
        // track.
        bool firstrowzero=false, firstcolzero=false;
        for(i=0;i<rows;i++)
            for(j=0;j<cols;j++)
                if(!matrix[i][j]){
                    matrix[i][0]=matrix[0][j]=0;
                    firstrowzero=firstrowzero||i==0;
                    firstcolzero=firstcolzero||j==0;
                }
        for(i=1;i<rows;i++)
            if(!matrix[i][0])
                matrix[i].assign(cols,0);
        for(i=1;i<cols;i++)
            if(!matrix[0][i]) {
                for(j=0;j<rows;j++)
                    matrix[j][i]=0;
            }
        if(firstrowzero)
            matrix[0].assign(cols,0);
        if(firstcolzero)
            for(j=0;j<rows;j++)
                matrix[j][0]=0;
    }
};
