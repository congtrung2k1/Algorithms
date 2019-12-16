#include<vector>
#include<iostream>
using namespace std;
class Solution {
public:
    string getPermutation(int n, int k) {
        int i,j,f=1;
        string s(n,'0');
        for(i=1;i<=n;i++){
            f*=i;
            s[i-1]+=i;
        }
        for(i=0,k--;i<n;i++){
            f/=n-i;
            j=i+k/f;
            char c=s[j];
            // remove c by shifting to cover up.
            for(;j>i;j--)
                s[j]=s[j-1];
            k%=f;
            s[i]=c;
        }
        return s;
    }
};
int main(){
    Solution s;
    cout<<(s.getPermutation(1,1)=="1")<<endl;
    cout<<(s.getPermutation(2,1)=="12")<<endl;
    cout<<(s.getPermutation(2,2)=="21")<<endl;
    cout<<(s.getPermutation(3,1)=="123")<<endl;
    cout<<(s.getPermutation(3,2)=="132")<<endl;
    cout<<(s.getPermutation(3,5)=="312")<<endl;
    cout<<(s.getPermutation(3,6)=="321")<<endl;
    cout<<(s.getPermutation(4,1)=="1234")<<endl;
    cout<<(s.getPermutation(4,24)=="4321")<<endl;
}
