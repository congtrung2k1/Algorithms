/**
 * Merge sort.
 */
#include<iostream>
#include<cstdlib>
using namespace std;
struct ListNode {
  int val;
  ListNode *next;
  ListNode(int x) : val(x), next(NULL) {}
};

class Solution {
public:
    ListNode *sortList(ListNode *head) {
        if(head){
            ListNode*a=head->next;
            if(!a) return head; // 1 elem
            if(!a->next){ // 2 elems
                if(head->val > a->val)
                    swap(head->val, a->val);
                return head;
            }
        }
        else return NULL; // 0 elem
        ListNode*a=head,*b=head,*prev;
        while(b){
            prev=a;
            a=a->next;
            b=b->next;
            if(b)b=b->next;
        }
        // a is the head of second half.
        prev->next=NULL;
        a=sortList(a);
        b=sortList(head);
        ListNode r(0);
        head=&r;
        // merge step
        while(a&&b){
            if(a->val < b->val){
                head->next=a;
                a=a->next;
            }else{
                head->next=b;
                b=b->next;
            }
            head=head->next;
        }
        head->next=a?a:b;
        return r.next;
    }
};
void print(ListNode*n){
    while(n){
        cout<<n->val<<",";
        n=n->next;
    }
    cout<<endl;
}
int main(){
    ListNode r0(4),r1(3),r2(2),r3(1),r4(0);
    r0.next=&r1;
    Solution s;
    print(s.sortList(&r0));
    r1.next=&r2;
    print(s.sortList(&r0));
    r2.next=&r3;
    //print(s.sortList(&r0));
    r3.next=&r4;
    //print(s.sortList(&r0));
}
