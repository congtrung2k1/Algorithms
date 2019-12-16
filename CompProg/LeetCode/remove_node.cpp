/**
 * This solution is constant space and technically at most 2 passes as each
 * node is visited at most twice.
 * From iteration point of view, there is only 1 pass.
 * Idea is to move 2 pointers, one starting at the head and the other that
 * is already n steps ahead.
 */
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
class Solution {
public:
    ListNode *removeNthFromEnd(ListNode *head, int n) {
        ListNode*n1=head,*n2=head,*prev=head;
        while(n--){
            n1=n1->next;
        }
        while(n1){
            prev=n2;
            n2=n2->next;
            n1=n1->next;
        }
        // n2 is the node to remove.
        if(n2==head){
            return head->next;
        }
        prev->next=n2->next;
        return head;
    }
};
