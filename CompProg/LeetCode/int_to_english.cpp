#include <string>
#include<vector>
using namespace std;
class Solution {
public:
    const vector<string> ones = {
        "Zero",
        "One",
        "Two",
        "Three",
        "Four",
        "Five",
        "Six",
        "Seven",
        "Eight",
        "Nine"
    };
    const vector<string> teens = {
        "Ten",
        "Eleven",
        "Twelve",
        "Thirteen",
        "Fourteen",
        "Fifteen",
        "Sixteen",
        "Seventeen",
        "Eighteen",
        "Nineteen"

    };
    const vector<string> tenths = {
        "Twenty",
        "Thirty",
        "Forty",
        "Fifty",
        "Sixty",
        "Seventy",
        "Eighty",
        "Ninety",

    };
    const vector<string> thousands = {
        "Thousand",
        "Million",
        "Billion"
    };

    string d2(int num){
        if (num <= 9)
            return ones[num];
        if (num <= 19)
            return teens[num-10];
        if (num % 10)
            return tenths[num/10-2] + " " + ones[num%10];
        return tenths[num/10-2];
    }
    string d3(int num){
        if (num <= 99)
            return d2(num);
        int d = num / 100;
        if (num % 100)
            return ones[d] + " Hundred " + d2(num%100);
        return ones[d] + " Hundred";
    }

    string numberToWords(int num) {

        string ans;
        string sep = "";
        int mag = 1000000000;
        for (int i= thousands.size()-1; i>=0 && num; i--, mag /= 1000){
            if (num < mag) continue;
            int d = num / mag;
            ans = ans + sep + d3(d) + " " + thousands[i];
            sep = " ";
            num %= mag;
        }
        if (num)
            return ans + sep + d3(num);
        return ans;
    }
};
