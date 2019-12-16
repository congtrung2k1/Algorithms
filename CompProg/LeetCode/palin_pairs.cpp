/**
 * algorithm: run manacher's algo on each word. For each prefix or suffix that is a
 * palindrome, find the missing word. Exploits the pattern :
 * <missing> <prefix/suffix> <reverse of missing>
 * where prefix/suffix must be palindrome.
 * Runtime: O(nk) where n is the no. of words and k is the average word length.
 */
#include<vector>
#include<string>
#include<unordered_map>
#include<algorithm>
#include<iostream>
using namespace std;

class Solution {
public:
    typedef unordered_map<string,int> mapt;
    // index:  0 1 2 3 4
    //         a b c d e
    // index2: 01234567
    // p[i] = length of palindrome at index2 i
    vector<int> p;

    inline char mapStr(const string &s, int index){
        return index % 2 ? 0 : s[index/2];
    }
    // find the matching word that can form a complete palindrome
    void find(const mapt&m, vector<vector<int>>&ans, int index, int palinLen,const string &s,const string &sr, bool rev){
        string prefix = rev ? s.substr(palinLen): sr.substr(0, sr.size()-palinLen);
        mapt::const_iterator it =  m.find(prefix);

        if (it != m.end() && index != it->second){
            if (rev){
                ans.push_back({index, it->second});
            }
            else {
                ans.push_back({it->second, index });
            }
        }
    }
    void check(const mapt&m, vector<vector<int>>&ans, int index,const string &s, const string &sr, bool rev ){
        if (s.size()==0)
            return;
        int palinLenHalf = 0;

        const int maxIndex2 = s.size()*2-2;
        p.clear();
        p.reserve(maxIndex2+1);
        // manacher's algo
        for (int i=0,j=0;i<= maxIndex2;){
            // expand palindrome
            while (i-1-palinLenHalf >= 0 &&
                i+1+palinLenHalf <= maxIndex2 &&
                mapStr(s, i-1-palinLenHalf) == mapStr(s,i+1+palinLenHalf)){
                palinLenHalf++;
            }
            p[i]=1+palinLenHalf*2;
            const int ir = min(maxIndex2, i+palinLenHalf);
            palinLenHalf=0;
            for ( j=i+1; j <= ir; j++){
                const int jp = i-(j-i);
                const int jpl = p[jp];
                if (jpl/2 + j >= ir){
                    palinLenHalf = ir-j;
                    break;
                }
                p[j] = jpl;
            }
            i=j;
        }

        // find prefix that is a palindrome
        for (int i=0;i <=maxIndex2;i++){
            if (i-p[i]/2 == 0){
                const int palinLen = (p[i]+1)/2;
                // find the missing word needed
                find(m,ans,index, palinLen,s, sr, rev);
            }
        }
    }
    vector<vector<int>> palindromePairs(vector<string>& words) {
        mapt m;
        m.reserve(words.size());
        int i=0;
        vector<vector<int>> ans;
        for (const string & s : words){
            m [s] = i++;
        }
        i=0;
        for (const string & s : words){
            string sr(s);
            reverse(sr.begin(),sr.end());
            // find prefixes that are palindrome
            check(m,ans,i,s,sr,false);
            // find suffixes that are palindrome
            check(m,ans,i,sr,s,true);
            // account for the zero-length prefix palindrome
            find(m,ans,i, 0, s,sr, false);
            i++;
        }
        return ans;
    }
};
