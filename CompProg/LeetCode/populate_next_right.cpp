#include<cstdlib>
struct TreeLinkNode{
    TreeLinkNode *left,*right,*next;
};
class Solution {
public:
    void connect(TreeLinkNode *root) {
        if(!root)return;
        TreeLinkNode*curLevel=root,*nextLevel=root->left;
        root->next=NULL;
        while(curLevel->left){
            curLevel->left->next=curLevel->right;
            if (curLevel->next){
                curLevel->right->next = curLevel->next->left;
                curLevel=curLevel->next;
            }
            else {
                curLevel->right->next=NULL;
                curLevel=nextLevel;
                nextLevel=nextLevel->left;
            }
        }
    }
};
