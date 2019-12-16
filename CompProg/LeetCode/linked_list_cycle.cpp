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
    bool hasCycle(ListNode *head) {
        
        ListNode*a=head;
        while(a){
            head=head->next;
            a=a->next;
            if(a){
                a=a->next;
                if(a==head)return true;
            }
        }
        return false;
    }
};