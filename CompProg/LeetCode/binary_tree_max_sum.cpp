/**
 * Dynamic programming.
 */

#include<iostream>
#include<vector>
#include<unordered_map>
using namespace std;
struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};

typedef unordered_map<TreeNode*,int> mapt;

// returns the sum of the max path starting at cur, and ending
// at a leaf node.
int findpath(mapt&m,TreeNode*cur){
    pair<mapt::iterator,bool>p=m.emplace(make_pair(cur,0));
    int&ans=(p.first)->second;
    if(!p.second)return ans;
    if(cur->left)ans=max(ans,findpath(m,cur->left));
    if(cur->right)ans=max(ans,findpath(m,cur->right));    
    return ans+=cur->val;
}
// returns the sum of the max path for this subtree, starting
// and ending at any node.
int findmax(mapt&m,mapt&m2,TreeNode*cur){
    pair<mapt::iterator,bool>p=m.emplace(make_pair(cur,cur->val));
    int&ans=(p.first)->second;
    if(!p.second)return ans;
    int left=0,right=0;
    if(cur->left){
        left=max(0,findpath(m2,cur->left));
        int lefttree=findmax(m,m2,cur->left);
        ans=max(ans,left+cur->val);
        ans=max(ans,lefttree);
    }
    if(cur->right){
        right=max(0,findpath(m2,cur->right));        
        int righttree=findmax(m,m2,cur->right);
        ans=max(ans,right+cur->val);
        ans=max(ans,righttree);
    }
    ans=max(ans,left+right+cur->val);
    return ans;
}
class Solution {
public:
    int maxPathSum(TreeNode *root) {
        mapt m,m2;
        return findmax(m,m2,root);
    }
};
int main(){
    TreeNode root(-2);
    root.left=new TreeNode(1);
    Solution s;
    cout<<(s.maxPathSum(&root)==1)<<endl;
    root.val=3;
    cout<<(s.maxPathSum(&root)==4)<<endl;
    
}