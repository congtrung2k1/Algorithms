#include <iostream>
#include <cmath>
#include <algorithm>
#include <vector>
using namespace std;

typedef long long ll;

class NumArray {
public:
    vector<int> a;
    vector<ll> segs;
    size_t numseg;

    NumArray(vector<int> &nums) : a(nums) {
        size_t len = nums.size();
        numseg = (size_t)ceil(sqrt(len));
        size_t i=0;
        for (i=0;i < len; i+=numseg){
            ll sum=0;
            for (size_t j = i; j < min(len,i+numseg); j++){
                sum+=nums[j];
            }
            segs.push_back(sum);
        }
    }

    void update(int i, int val) {
        segs[i/numseg] += val-a[i];
        a[i] = val;
    }

    int sumRange(int i, int j) {
        size_t s1 = i/numseg;
        size_t s2 = j/numseg;
        ll sum=0;
        for (size_t k=s1; k <=s2;k++)
            sum += segs[k];
        for (int k=s1*numseg; k<i;k++)
            sum -= a[k];
        for (int k=j+1; k < min(a.size(),(s2+1)*numseg); k++)
            sum -= a[k];
        return sum;
    }
};

int main(){
    vector<int> nums = {0,1,2};
    NumArray a(nums);
    cout << a.sumRange(0,0) << endl ;
    cout << a.sumRange(0,1) << endl ;
    cout << a.sumRange(0,2) << endl ;
    cout << a.sumRange(2,2) << endl ;
    a.update(0,-1);

    cout << a.sumRange(0,0) << endl ;
    cout << a.sumRange(0,2) << endl ;
}
