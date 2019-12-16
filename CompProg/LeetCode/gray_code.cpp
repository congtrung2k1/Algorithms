/**
 * Notice the pattern:
 *   0
 *   1
 *  11
 *  10
 * 110
 * 111
 * ....
 */
#include<vector>
using namespace std;
class Solution {
public:
    vector<int> grayCode(int n) {

        vector<int> v={0};
        int i,j,bit=1;
        for(i=0;i<n;i++){
            for(j=v.size()-1;j>=0;j--){
                v.push_back(bit | v[j]);
            }
            bit <<= 1;
        }
        return v;
    }
};
