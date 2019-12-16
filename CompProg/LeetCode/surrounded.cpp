/**
 * O's at the boundary are definitely not surrounded. So use flood fill using
 * DFS at the boundary.
 */
#include<iostream>
#include<vector>
#include<queue>
using namespace std;

class Solution {
public:
    void fill(vector<vector<char> >&board, int r, int c){
        if(board[r][c]!='O')return;
        int rows=board.size();
        board[r][c]='.';
        #define check(r,c) \
            if(0<=r&&r<rows&&0<=c&&c<board[r].size()){ \
                fill(board,r,c); \
            }
        check(r,c-1);
        check(r,c+1);
        check(r+1,c);
        check(r-1,c);

    }
    void solve(vector<vector<char>> &board) {
        int i,j;
        int rows=board.size();
        for(i=0;i<rows;i++){
            fill(board,i,0);
            fill(board,i,board[i].size()-1);
        }
        for(i=rows?board[0].size():-1;i>=0;i--){
            fill(board,0,i);
        }
        for(i=rows?board[rows-1].size():-1;i>=0;i--){
            fill(board,rows-1,i);
        }
        for(i=0;i<rows;i++)
            for(j=0;j<board[i].size();j++)
                if(board[i][j]=='.')
                    board[i][j]='O';
                else
                    board[i][j]='X';
    }
};

int main(){
    Solution s;
    vector<vector<char> > board=  {
        {'X', 'O', 'X', 'O', 'X', 'O'},
        {'O', 'X', 'O', 'X', 'O', 'X'},
        {'X', 'O', 'X', 'O', 'X', 'O'},
        {'O', 'X', 'O', 'X', 'O', 'X'},
    };
    s.solve(board);
    int i,j;
    for(i=0;i<board.size();i++){
        for(j=0;j<board[i].size();j++)
            cout<<board[i][j];
        cout<<endl;
    }

}
