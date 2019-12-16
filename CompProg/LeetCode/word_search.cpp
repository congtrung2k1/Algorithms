/**
 * Perform DFS at each cell, and keeping track which cell has been used or not.
 * DFS is implemented iteratively, just for fun.
 */
#include<iostream>
#include<vector>
using namespace std;

struct state{
    int r,c,idx,step=0;
    char saved=0;
};

class Solution {
public:
    bool find(vector<state>&st,vector<vector<char> > &board,const string&word,  int r,int c){     
        st.clear();
        state first;
        first.r=r;
        first.c=c;
        first.idx=0;
        st.push_back(first);
        bool solved=false;
        while(st.size()){
            state&nd=st.back();            
            if(nd.step==0){
                if(board[nd.r][nd.c]!=word[nd.idx]){st.pop_back();continue;} 
                if(nd.idx==word.size()-1){solved= true;} 
                nd.saved=board[nd.r][nd.c];
                board[nd.r][nd.c]=0;
            }
            
            if(!solved){
                #define check(s,r1,c1) \
                    if(s==nd.step){ \
                        nd.step++; \
                        if(0<=r1&&r1<board.size()&&0<=c1&&c1<board[0].size()){ \
                            state n;n.r=r1;n.c=c1;n.idx=nd.idx+1;\
                            st.push_back(n);continue; \
                        }\
                    }
                check(0,nd.r+1,nd.c);
                check(1,nd.r,nd.c+1);
                check(2,nd.r-1,nd.c);            
                check(3,nd.r,nd.c-1);
            }
            board[nd.r][nd.c]=nd.saved;
            st.pop_back();
        }
        return solved;
    }
    bool exist(vector<vector<char> > &board, string word) {
        vector<state> q;
        int i,j;
        for(i=0;i<board.size();i++){
            for(j=0;j<board[i].size();j++){
                if(find(q,board,word,i,j)){return true;}
            }
        }
        return false;
    }
};
vector<char> get(const char*s){
    int i,j;
    vector<char> v;
    for(i=0;s[i];i++)
        v.push_back(s[i]);
    return v;
}
int main(){

    Solution s;
    vector<vector<char>> board={
        {get("ABCE")},
        {get("SFCS")},
        {get("ADEE")}
    };
    cout<<(s.exist(board,"ABCCED"))<<endl;
    cout<<(s.exist(board,"SEE"))<<endl;
    cout<<(s.exist(board,"EEDA"))<<endl;
    cout<<(!s.exist(board,"ABCD"))<<endl;
    cout<<(!s.exist(board,"ABCDEFGHIJKLMNOPQRSTUVWXYZ"))<<endl;
    cout<<(s.exist(board,"ABCESEEDASFC"))<<endl;
    
    board={
        {get("A")}
    };
    cout<<(s.exist(board,"A"))<<endl;
}