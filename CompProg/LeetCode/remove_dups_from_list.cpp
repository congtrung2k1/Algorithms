#include<cstdlib>
using namespace std;
struct ListNode {
      int val;
      ListNode *next;
      ListNode(int x) : val(x), next(NULL) {}
  };
class Solution {
public:
    ListNode *deleteDuplicates(ListNode *head) {
        ListNode*cur=head,*tail=head;
        while(cur){
            if(cur->val!=tail->val){
                tail->next=cur;
                tail=cur;
            }
            cur=cur->next;
            tail->next=NULL;
        }
        return head;
    }
};
