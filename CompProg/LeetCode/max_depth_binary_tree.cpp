/**
 * Definition for binary tree
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */
#include<iostream>
using namespace std;
class Solution {
public:
    int maxDepth(TreeNode *root) {
        if(!root)return 0;
        return 1+max(maxDepth(root->left),maxDepth(root->right));
    }
};