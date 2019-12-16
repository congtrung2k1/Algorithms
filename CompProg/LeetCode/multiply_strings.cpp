#include<iostream>
using namespace std;

class Solution {
public:
    string multiply(string num1, string num2) {
        const int n1=num1.size(), n2=num2.size();
        int i,j;
        string s(n1+n2,0);
        for(i=n1-1;i>=0;i--){
            int mult=n1-1-i;
            char c=num1[i];
            int d=c-'0';
            int r=0;
            for(j=n2-1;j>=0;j--){
                char c2=num2[j];
                int d2=c2-'0';
                int m=r+d*d2+s[mult+n2-1-j];
                r=m/10;
                s[mult+n2-1-j]=m%10;
            }
            s[mult+n2]=r;
        }
        for(i=s.size()-1;i>=0&&!s[i];i--);
        if(i+1>=0)
            s.resize(max(1,i+1));
        for(j=0;j<s.size()/2;j++)
            swap(s[j],s[s.size()-1-j]);
        for(j=0;j<s.size();j++)
            s[j]+='0';
        return s;
    }
};

int main(){
    Solution s;
    cout<<(s.multiply("0","1")=="0")<<endl;
    cout<<(s.multiply("1","0")=="0")<<endl;
    cout<<(s.multiply("99","0")=="0")<<endl;
    cout<<(s.multiply("1","1")=="1")<<endl;
    cout<<(s.multiply("9","1")=="9")<<endl;
    cout<<(s.multiply("9","9")=="81")<<endl;
    cout<<(s.multiply("99","9")=="891")<<endl;
    cout<<(s.multiply("99","99")=="9801")<<endl;
    cout<<(s.multiply("123456","9876543210")=="1219318518533760")<<endl;
}
