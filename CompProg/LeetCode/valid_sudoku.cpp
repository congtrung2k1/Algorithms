#include<vector>
using namespace std;
class Solution {
public:
    bool isValidSudoku(vector<vector<char> > &board) {
        int i,j;
        int sm[9]={0},cm[9]={0},rm[9]={0};
        for(i=0;i<9;i++){
            for(j=0;j<9;j++){
                if(board[i][j]=='.')continue;
                int d=board[i][j]-'1';
                int m=1<<d;
                int combined=(sm[(i/3)*3+(j/3)]|cm[j]|rm[i]);
                if(combined&m)return false;
                sm[(i/3)*3+(j/3)]|=m; cm[j]|=m; rm[i]|=m;
            }
        }
        return true;
    }
};
