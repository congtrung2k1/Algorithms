#include<vector>
#include<cstdlib>
#include<iostream>
using namespace std;
 struct TreeNode {
      int val;
      TreeNode *left;
      TreeNode *right;
      TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 };
struct state{
    int step=0;
    TreeNode*node;
};
class Solution {
public:
    vector<int> inorderTraversal(TreeNode *root) {
        vector<state> st;
        vector<int> ans;
        if(!root)return ans;
        state s; s.node=root;
        st.push_back(s);
        while(st.size()){
            state&cur=st.back();
            if(cur.step==0){
                cur.step=1;
                ans.push_back(cur.node->val);
                if(s.node=cur.node->left) {st.push_back(s);continue;}
            }
            if(cur.step==1){
                cur.step=2;
                if(s.node=cur.node->right) {st.push_back(s);continue;}
            }
            st.pop_back();
        }
        return ans;
    }
};
