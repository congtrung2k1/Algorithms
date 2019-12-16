/**
 * Define D[i] = Prices[i] - Prices[i-1]
 * A transaction is defined as buying at Prices[X] and selling at Prices[Y].
 * The profit of a transaction
 * = Prices[Y] - Prices[X]
 * = Prices[Y] - Prices[Y-1] +
 *   Prices[Y-1] - Prices[Y-2] +
 *   ...
 *   Prices[X+1] - Prices[X]
 * = D[Y] + ... + D[X+1]
 * = sum of D from X+1 to Y
 *
 * This translates the problem of finding max(Prices[Y] - Prices[X]) to finding the largest sum of contiguous ints in D.
 *
 */
#include<vector>
using namespace std;
class Solution {
public:
    int maxProfit(vector<int>& prices) {
        const size_t n=prices.size();
        int ans=0;
        int run=0;
        for (size_t i=1;i<n;i++){
            run += prices[i]-prices[i-1];
            ans = max(ans, run);
            run = max(0, run);
        }
        return ans;
    }
};
