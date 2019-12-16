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
                if(s.node=cur.node->left) {st.push_back(s);continue;}
            }
            if(cur.step==1){
                cur.step=2;
                ans.push_back(cur.node->val);
                if(s.node=cur.node->right) {st.push_back(s);continue;}
            }
            st.pop_back();
        }
        return ans;
    }
};
void check(TreeNode*root,const vector<int>&a){
    Solution s;
    cout<<(s.inorderTraversal(root)==a)<<endl;
}
int main(){
    TreeNode n1(0), n2(1), n3(2), n4(3);
    check(&n1,{0});
    n1.left=&n2;
    check(&n1,{1,0});
    n1.left=NULL; n1.right=&n2;
    check(&n1,{0,1});
    n1.left=&n3;
    check(&n1,{2,0,1});
    n2.left=&n4;
    check(&n1,{2,0,3,1});
    n2.left=NULL;
    n3.left=&n4;
    check(&n1,{3,2,0,1});
}
