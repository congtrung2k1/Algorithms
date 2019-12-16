#include<vector>
using namespace std;
class Solution {
public:
    vector<int> plusOne(vector<int> &digits) {
        int i,j,carry=1;
        for(i=digits.size()-1;i>=0&&carry;i--){
            int sum=carry+digits[i];
            carry=sum/10;
            digits[i]=sum%10;
        }
        if(carry){
            // digits must be all 9's for carry to be 1.
            digits[0]=1;
            digits.push_back(0);
        }
        return digits;
    }
};
