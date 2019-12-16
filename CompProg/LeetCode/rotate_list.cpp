#include<iostream>
#include<vector>
#include<cstdlib>
using namespace std;
struct ListNode {
      int val;
      ListNode *next;
      ListNode(int x) : val(x), next(NULL) {}
  };
class Solution {
public:
    ListNode *rotateRight(ListNode *head, int k) {
        if(!head)return head;
        ListNode*a=head,*b=head,*prev=NULL,*prev2;
        int len=0; // length of linked list.
        while(b&&k--){
            b=b->next;
            len++;
        }
        // we reached the end of the list first,
        // which means k is larger than the length of the list.
        if(k>0){
            k%=len;
            b=head;
            while(k--){
                b=b->next;
            }
        }
        // b is now k nodes ahead of a.
        while(b){
            prev=a;
            prev2=b;
            a=a->next;
            b=b->next;
        }
        // if !a, then there is only one node.
        // if !prev, then there is no need to rotate.
        if(!a||!prev)return head;
        prev2->next=head;
        prev->next=NULL;
        return a;
    }
};
void check(const vector<int>&v, int k){
    vector<ListNode> nodes(v.size(),ListNode(0));
    int i,j;
    for(i=0;i<v.size();i++){
        nodes[i].val=(v[i]);
        if(i)nodes[i-1].next=&nodes[i];
    }
    Solution s;
    bool ok=true;
    ListNode*node=s.rotateRight(&nodes[0],k);
    for(i=0;i<v.size();i++){
        if(node->val!=v[(v.size()-k%v.size()+i)%v.size()])ok=false;
        cout<<node->val<<",";
        node=node->next;
    }
    cout<<endl<<ok<<endl<<endl;
}
int main(){
    check({1},0);
    check({1},1);
    check({1},2);
    check({1,2},0);
    check({1,2},1);
    check({1,2},2);
    check({1,2},3);
    check({1,2,3},0);
    check({1,2,3},1);
    check({1,2,3},2);
    check({1,2,3},7);
    check({1,2,3},6);
    Solution s;
    cout<<(s.rotateRight(NULL,1)==NULL)<<endl;
}
