/**
 * Reverse the second half of the list and then interleave the 2 halves.
 * Runtime is O(n).
 */
#include<iostream>
#include<cstdlib>
using namespace std;
struct ListNode {
     int val;
     ListNode *next;
     ListNode(int x) : val(x), next(NULL) {}
};
void print(ListNode*head);
class Solution {
public:
    // reverses a list in-place and returns the head.
    ListNode* reverse(ListNode*head){
        ListNode*cur=head,*curnext=cur->next;
        while(curnext){
            ListNode*curnext2=curnext->next;
            curnext->next=cur;
            cur=curnext;
            curnext=curnext2;
        }
        head->next=NULL;
        return cur;
    }
    void reorderList(ListNode *head) {
        if(!head)return;
        ListNode*c1=head,*c2=head,*prevc1=NULL;
        while(c2){
            prevc1=c1;
            c1=c1->next;
            c2=c2->next;
            if(c2)c2=c2->next;
        }
        prevc1->next=NULL;
        // c1 is the head of the second half.
        if(!c1)return;
        c1=reverse(c1);
        c2=head;
        while(c1){
            ListNode*c2next=c2->next;
            ListNode*c1next=c1->next;
            c2->next=c1;
            c1->next=c2next;
            c1=c1next;
            c2=c2next;
        }
    }
};
void print(ListNode*head){
    while(head){
        cout<<head->val<<",";
        head=head->next;
    }
    cout<<endl;
}


int main(){
    ListNode l0(0), l1(1), l2(2), l3(3), l4(4), l5(5), l6(6);
    l0.next=&l1;
    l1.next=&l2;
    l2.next=&l3;
    l3.next=&l4;
    l4.next=&l5;
    l5.next=&l6;
    Solution s;
    print(&l0);
    s.reorderList(&l0);
    print(&l0);
}

