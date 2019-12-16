/**
 * Backtracking using bitmasks to keep track of the used numbers.
 */
#include<vector>
using namespace std;
class Solution {
public:
    bool solve(vector<vector<char> > &board, int r, int c, int rm[9], int cm[9], int sm[9]){
        int i,j;
        for(i=r,j=c;i<9;i++, j=0){
            for(;j<9;j++){
                char ch=board[i][j];
                if(ch!='.')continue;
                for(int k=1;k<=9;k++){
                    int m=1<<(k);
                    if((rm[i]&m)||(cm[j]&m)||(sm[(i/3)*3+(j/3)]&m))continue;
                    board[i][j]=k+'0';
                    rm[i]|=m; cm[j]|=m; sm[(i/3)*3+(j/3)]|=m;
                    if(solve(board,i,j+1,rm,cm,sm))return true;
                    rm[i]^=m; cm[j]^=m; sm[(i/3)*3+(j/3)]^=m;
                    board[i][j]=ch;
                }
                return false;
            }
        }
        return true;
    }
    void solveSudoku(vector<vector<char> > &board) {
        int rm[9]={0}, cm[9]={0}, sm[9]={0};
        int i,j;
        for(i=0;i<9;i++)
            for(j=0;j<9;j++){
                char c=board[i][j];
                if(c=='.')continue;
                int m=1<<(c-'0');
                rm[i]|=m; cm[j]|=m; sm[(i/3)*3+(j/3)]|=m;
            }
        solve(board,0,0,rm,cm,sm);
    }
};
