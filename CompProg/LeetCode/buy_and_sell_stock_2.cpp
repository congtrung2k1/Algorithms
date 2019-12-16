/**
 * Since now we are allowed unlimited transactions, if there is any negative element in the running sequence,
 * break the sequence into 2 (2 transactions). Boils down to adding all positive sums of contiguous ints in D
 * which simplifies to adding all positive ints in D.
 */
#include<vector>
using namespace std;
class Solution {
public:
    int maxProfit(vector<int>& prices) {
        const size_t n = prices.size();
        int ans = 0;
        for (size_t i=1;i<n;i++)
            ans += max(0,prices[i]-prices[i-1]);
        return ans;
    }
};
