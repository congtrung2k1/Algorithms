#include<iostream>
using namespace std;
class Solution {
public:
    bool isPalindrome(int x) {
        if(x<0||(x&&x%10==0))return false;
        if(x<=9)return true;
        int n=0;
        do{
            int d=x%10;
            n=n*10+d;
            x/=10;
            if(n==x||x/10==n)return true;
        }while(x>n);
        return false;
    }
};


int main(){
    Solution s;
    cout<<s.isPalindrome(0)<<endl;
    cout<<s.isPalindrome(1)<<endl;
    cout<<s.isPalindrome(9)<<endl;
    cout<<!s.isPalindrome(12)<<endl;
    cout<<!s.isPalindrome(91)<<endl;
    cout<<s.isPalindrome(11)<<endl;
    cout<<s.isPalindrome(99)<<endl;
    cout<<s.isPalindrome(101)<<endl;
    cout<<s.isPalindrome(111)<<endl;
    cout<<s.isPalindrome(131)<<endl;
    cout<<s.isPalindrome(1331)<<endl;
    cout<<s.isPalindrome(10901)<<endl;
    cout<<s.isPalindrome(109901)<<endl;
    cout<<s.isPalindrome( 2134554312)<<endl;
    cout<<!s.isPalindrome(2147483647)<<endl;
}
