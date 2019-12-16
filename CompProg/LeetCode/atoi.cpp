#include<iostream>
using namespace std;

class Solution {
public:
    int atoi(const char *str) {
        long long n=0;
        int i,j;
        int sign=1;
        for(i=0;;i++){
            char c=(str[i]);
            if(c==' '||c== '\n'||c=='\t'||c=='\r')
                continue;
            if(c=='-'){i++;sign=-1;}
            else if(c=='+')i++;
            break;
        }

        for(;;i++){
            char c = str[i];
            if(!('0'<=c&&c<='9'))
                break;
            int d=c-'0';
            long long k = n*10+d;
            if(sign==1&&k>0x7fffffff)return 0x7fffffff;
            if(sign<0&&k>0x80000000)return (int)0x80000000;
            n=k;
        }
        return n*sign;
    }
};

int main(){
    Solution s;
    cout<<s.atoi("+123")<<endl;
    cout<<s.atoi(" +123")<<endl;
    cout<<s.atoi(" -123")<<endl;
    cout<<s.atoi(" -00123")<<endl;
    cout<<s.atoi(" -00123.")<<endl;
    cout<<s.atoi("")<<endl;
    cout<<s.atoi(" ")<<endl;
    cout<<s.atoi("2147483647")<<endl;
    cout<<s.atoi("2147483648")<<endl;
    cout<<s.atoi("-2147483648")<<endl;
}
