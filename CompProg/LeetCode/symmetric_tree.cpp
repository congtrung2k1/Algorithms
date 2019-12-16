/**
 * Level-order BFS, pushing the pairs of children in the right ordering
 * for comparison.
 */
#include<cstdlib>
#include<queue>
using namespace std;
 struct TreeNode {
      int val;
      TreeNode *left;
      TreeNode *right;
      TreeNode(int x) : val(x), left(NULL), right(NULL) {}
  };
typedef pair<TreeNode*,TreeNode*> nodepair;
class Solution {
public:
    bool isSymmetricRecursive(TreeNode*a,TreeNode*b){
        if(a){
            return b && a->val==b->val &&
                isSymmetricRecursive(a->left,b->right) &&
                isSymmetricRecursive(a->right,b->left);
        }
        return !b;
    }
    bool isSymmetricRecursive(TreeNode*root){
        return !root || isSymmetricRecursive(root->left,root->right);
    }
    bool isSymmetric(TreeNode *root) {
        queue<nodepair> q;
        if(root)
            q.push(make_pair(root->left,root->right));
        while(q.size()){
            nodepair p=q.front(); q.pop();
            if(p.first){
                if(!p.second)return false;
                if(p.first->val != p.second->val) return false;
                q.push(make_pair(p.first->left,p.second->right));
                q.push(make_pair(p.first->right,p.second->left));
            }
            else if(p.second) return false;
        }
        return true;
    }
};
