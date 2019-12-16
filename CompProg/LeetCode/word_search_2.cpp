/**
 * Builds a trie for all words and then do a DFS on each board position using the trie.
 * The trie allows checking of valid words in O(1) time (as we do DFS).
 * Building of trie takes O(WL) where W is the word count and L is the average word length.
 *
 */
#include<unordered_set>
#include<vector>
#include<string>
using namespace std;

struct node{
    int children[26]={0};
    bool end=false;
};

class Solution {
public:
     void find(vector<node>&tree,vector<vector<char>>& board, unordered_set<string>&found,string&buf, int cur, int r, int c, int idx){
        node&nd = tree[cur];
        if (nd.end){
            found.insert(buf);
        }
        if (r < 0 || c < 0 || r >= board.size() || c >= board[0].size()||board[r][c]==0)
            return;
        char ch=board[r][c];
        int cidx = ch-'a';
        int next = nd.children[cidx];
        if (next==0)
            return;
        buf.append(1,ch);
        int bufSize=buf.size();
        board[r][c]=0;
        find(tree,board,found,buf,next,r+1,c,idx+1);
        buf.resize(bufSize);
        find(tree,board,found,buf,next,r-1,c,idx+1);
        buf.resize(bufSize);
        find(tree,board,found,buf,next,r,c+1,idx+1);
        buf.resize(bufSize);
        find(tree,board,found,buf,next,r,c-1,idx+1);
        buf.resize(bufSize-1);
        board[r][c]=ch;
    }
    void insert(vector<node>&tree,int cur,const string&word, int idx){
        if(idx==word.size()){
            tree[cur].end=true;
            return;
        }
        int c=word[idx]-'a';
        int next=tree[cur].children[c];

        if (next==0){
            tree[cur].children[c]= next=tree.size();
            tree.emplace_back();
        }

        insert(tree,next, word, idx+1);
    }
    vector<string> findWords(vector<vector<char>>& board, vector<string>& words) {
        size_t n=words.size();
        size_t rows=board.size();
        if(rows==0)
            return vector<string>();
        size_t cols=board[0].size();
        unordered_set<string> found;
        vector<node> tree(1);
        for (vector<string>::const_iterator it=words.begin(); it!=words.end(); it++){
            const string&word=*it;
            insert(tree,0,word,0);
        }
        int i,j;
        string buf;
        for(i=0;i<cols;i++)
            for(j=0;j<rows;j++){
                find(tree,board,found,buf,0,j,i,0);
            }
        return vector<string>(found.begin(), found.end());
    }
};

