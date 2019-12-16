/**
 * Manacher's algorithm
 */
#include<string>
#include<algorithm>
#include<iostream>
#include<vector>
using namespace std;
class Solution {
public:
    // index:  0 1 2 3 4 5 6
    //         a b c d e f g h i
    // index2: 0123456789
    //
    // palinLen[i] = length of palin at index2 i
    vector<int> palinLen;

    char mapStr(string &s, int i2){
        return i2 % 2 ? 0 : s[i2/2];
    }
    string shortestPalindrome(string s) {
        if (s.size() == 0)
            return "";
        const int maxIndex2 = s.size()*2-2;
        int curPalinLenHalf=0;
        for (int i=0;i<=maxIndex2;){

            // expand palindrome
            while (i-1-curPalinLenHalf >= 0 &&
                i+1+curPalinLenHalf <= maxIndex2 &&
                mapStr(s, i-1-curPalinLenHalf) == mapStr(s, i+1+curPalinLenHalf)){
                curPalinLenHalf++;
            }
            palinLen.push_back(curPalinLenHalf*2+1);
            const int ir = min(i + curPalinLenHalf, maxIndex2);
            curPalinLenHalf=0;
            int j;
            for (j=i+1; j<= ir; j++){
                int ip = i - (j-i);
                int ipl = palinLen[ip];
                if (j + ipl/2 >= ir){
                    curPalinLenHalf=ir-j;
                    break;
                }
                palinLen.push_back(ipl);
            }
            i=j;
        }
        int maxPalinLen = 0;
        for (int i = 0; i < palinLen.size(); i++){
            int len = palinLen[i];
            if (i - len/2 == 0)
                maxPalinLen = max(maxPalinLen, len);
        }
        string prefix = s.substr(maxPalinLen/2+1);
        reverse(prefix.begin(), prefix.end());
        return prefix + s;
    }
};

int main(){
    Solution s;
    cout << s.shortestPalindrome("abbacd") << endl;

}
