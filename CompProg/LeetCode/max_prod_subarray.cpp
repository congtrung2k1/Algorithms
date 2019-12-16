/**
Keep track of 2 running sequences: 'seq' starting from the first element, 'negSeq' starting from the first negative element. Reset both sequences when you hit zero.
For 'negSeq', we check whether excluding the first negative element will result in a max subarray, as excluding it will change the sign.
*/
#include<iostream>
#include<limits>
using namespace std;
typedef long long ll;
class Solution {
public:
    int maxProduct(int A[], int n) {
        int i,j,hasNeg=0,firstNeg=1;
        ll negSeq=1,seq=1,ans=numeric_limits<int>::min();
        for(i=0;i<n;i++){
            const int cur=A[i];
            seq*=cur;
            // check for overflow.
            if(abs(seq) > numeric_limits<int>::max())
                seq=1;
            else
                ans=max(ans,seq);

            if(cur < 0){
                hasNeg=1;
            }
            else if(cur==0) {
                seq=negSeq=firstNeg=1;
                hasNeg=0;
            }

            if(hasNeg){
                negSeq *= cur;
                if(abs(negSeq) > numeric_limits<int>::max())
                    negSeq=1;
                else {
                    if(firstNeg>0)
                        firstNeg = cur;
                    else
                        ans=max(ans,negSeq/firstNeg);
                    ans=max(ans,negSeq);
                }
            }
        }
        return ans;
    }
};
