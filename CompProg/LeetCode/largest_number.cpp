#include<cmath>
#include <algorithm>    // std::sort
#include <vector>       // std::vector
using namespace std;
typedef long long ll;
int numDigits(int n){
    if (n==0) return 1;
    return floor(log(n)/log(10))+1;
}
bool myfunction (int i,int j) { 
    int n1 = numDigits(i);
    int n2 = numDigits(j);
    ll k1 = (ll)pow(10,n1)*j + i;
    ll k2 = (ll)pow(10,n2)*i + j;
    return k1<k2;
}

class Solution {
public:
    
    string largestNumber(vector<int>& nums) {
        sort(nums.begin(), nums.end(), myfunction);
        string ans;
        if (nums[0] == 0) return "0";
        for (int &n:nums){
            ans += std::to_string(n);
        }
        return ans;
    }
};