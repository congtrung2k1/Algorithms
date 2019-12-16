#include<cstdlib>
using namespace std;
struct TreeLinkNode {
    int val;
    TreeLinkNode *left, *right, *next;
    TreeLinkNode(int x) : val(x), left(NULL), right(NULL), next(NULL) {}
};
class Solution {
public:
    void connect(TreeLinkNode *root) {
        if(!root)return;
        TreeLinkNode*curLevel=root,*nextLevel=root->left,
            *nextLevelPrev=NULL, *nextLevelNext=nextLevel;
        root->next=NULL;
        while(true){
            if (nextLevelNext){
                if(nextLevelPrev)
                    nextLevelPrev->next=nextLevelNext;
                nextLevelPrev=nextLevelNext;
                if(!nextLevel)
                    nextLevel=nextLevelNext;
            }
            if(nextLevelNext==curLevel->right){
                curLevel=curLevel->next;
                if(curLevel){
                    nextLevelNext=curLevel->left;
                }
                else if (nextLevel){
                    nextLevelPrev->next=NULL;
                    curLevel=nextLevel;
                    nextLevelPrev=NULL;
                    nextLevel=nextLevelNext= curLevel->left;
                }
                else break;
            }
            else{
                nextLevelNext=curLevel->right;
            }
        }
    }
};

