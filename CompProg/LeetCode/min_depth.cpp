/**
 * Tricky part is the path must start from the root node and ends on
 * a leaf node that is not equals to the root node.
 */
struct TreeNode {
      int val;
      TreeNode *left;
      TreeNode *right;
      TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};
#include<iostream>
using namespace std;
class Solution {
public:
    int minDepth(TreeNode *root) {
        if(!root)return 0;
        if(!(root->left))return 1+minDepth(root->right);
        if(!(root->right))return 1+minDepth(root->left);
        return 1+min(minDepth(root->left),minDepth(root->right));
    }
};
