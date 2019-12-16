/**
 * Straightforward building of the entire sequence. It uses 2 swapping buffers
 * to save memory, and exploits the fact that count < 4.
 */
#include<string>
#include<cstring>
using namespace std;
class Solution {
public:
    string countAndSay(int n) {
        string s1("1"),s2,*p1 = &s2, *p2=&s1;
        int i,j;
        for(i=1;i<n;i++){
            swap(p1,p2);
            p2->clear();
            p1->append(1,0);
            char prev=(*p1)[0];
            int count=0;
            for(char cur : *p1){
                if(cur!=prev){
                    *p2 += '0'+count;
                    *p2 += prev;
                    count=0;
                }
                count++;
                prev=cur;
            }
        }
        return *p2;
    }
};
