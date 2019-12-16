/**
 * The path has to keep spiralling outwards, if not, it will have to spiral inwards to prevent crossing itself.
 */
#include<vector>
using namespace std;
class Solution {
public:
    bool isSpiralIn(vector<int>& x, int startIdx){
        for (int i=startIdx; i<x.size();i++){
            if(x[i] >= x[i-2]) return false;
        }
        return true;
    }
    bool isSelfCrossing(vector<int>& x) {
        if (x.size() <= 3) return false;
        if (x[2] <= x[0]) return !isSpiralIn(x,3);
        if (x[3] < x[1]) {return !isSpiralIn(x,4);}
        if (x[3] == x[1]) {x[2] -=x[0];return !isSpiralIn(x,4);}
        int i;
        for (i=4; i<x.size() && x[i] >= x[i-2];i++){
        }

        if (i < x.size() && x[i] >= x[i-2] - x[i-4]){
            x[i-1] -= x[i-3];
        }

        return !isSpiralIn(x,i+1);
    }
};
