/**
 * A plus sign can be ignored since it has no effect. A minus sign negates the signs contained within a pair of parentheses.
 *
 * A ')' matches the nearest '(', so we can use a stack structure to keep track of the negation context. When we encounter '(', save the current context and negate it. When ')', restore the previous context.
*/
#include<cstdlib>
#include<string>
#include<vector>
using namespace std;
class Solution {
public:
    int calculate(string s) {
        typedef long long ll;
        vector<int> ctx;
        int contextNumberMult = 1;
        int localNumberMult = 1;
        int ans=0;
        for (const char *x = s.c_str();*x;x++){
            switch(*x){
            case '-':
                localNumberMult = -1;
                break;
            case '(':
                contextNumberMult *= localNumberMult;
                ctx.push_back(localNumberMult);
                localNumberMult = 1;
                break;
            case ')':
                contextNumberMult *= ctx.back();
                ctx.pop_back();
            case ' ':
            case '+':
                break;
            default:{
                char *end;
                ll n=strtol(x,&end,10);
                ans += n * contextNumberMult  * localNumberMult ;
                localNumberMult = 1;
                x = end-1;
            }}
        }
        return ans;
    }
};
