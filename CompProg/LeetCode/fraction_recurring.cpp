#include<string>
#include<cstdlib>
using namespace std;
class Solution {
public:
    typedef long long ll;
    string fractionToDecimal(int numerator, int denominator) {
        // take the abs values of numerator and denominator which are easier to work with
        ll abs_n = abs((ll)numerator);
        ll abs_d = abs((ll)denominator);
        int index_of_q[10] = {0}; // 1-based index of digit for quotient Q
        ll r_for_q[10]; // remainder obtained for quotient Q
        string decimals; // stores the fractional digits after the dot
        int recurring = -1; // 0-based index of first recurring digit
        ll r = abs_n % abs_d; // remainder
        // long division
        while (r){
            r *= 10; // "borrow" digit
            ll q = r / abs_d; // quotient

            if ( index_of_q[q] == 0){ // if never encounter Q before, then store the index
                index_of_q[q] = decimals.size()+1;
                r_for_q[q] = r;
            }
            else if ( r_for_q[q] == r){ // else check whether the remainder is the same as previously encountered
                recurring = index_of_q[q]-1;
                break;
            }
            decimals.append(1, q + '0');
            r = r % abs_d;
        }

        string s;
        if (numerator && ((((ll)numerator ^ denominator) >> 63) & 1)) // need the minus sign?
            s.append(1,'-');
        s += to_string(abs_n / abs_d);
        if (abs_n % abs_d == 0) // if numer is a multiple of denom, the result is an integer.
            return s;
        s.append(1,'.');

        if (recurring >= 0){
            while (recurring && decimals[recurring-1] == decimals.back()){ // shorten recurring sequence
                recurring--;
                decimals.pop_back();
            }
            s.append(decimals, 0, recurring);
            s.append(1, '(');
            s.append(decimals, recurring,  string::npos);
            s.append(1, ')');
        }
        else {
            s += decimals;
        }
        return s;
    }
};

