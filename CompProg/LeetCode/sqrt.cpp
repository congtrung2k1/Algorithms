/**
 * Apply binary search since x^2 is monotonically increasing.
 */
typedef long long ll;
class Solution {
public:
    int sqrt(int x) {
        int lo=0,hi=1<<(sizeof(int) * 4);
        while(lo<=hi){
            int mid=lo+(hi-lo)/2;
            ll mid2=(ll)mid*mid;
            if(mid2<x) lo=mid+1;
            else if(mid2>x) hi=mid-1;
            else return mid;
        }
        return (ll)lo*lo>x?lo-1:lo;
    }
};
