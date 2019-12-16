#include<vector>
#include<iostream>
#include<cstdlib>
using namespace std;

class Solution {
public:
    int evalRPN(vector<string> &tokens) {
        int ans=0;
        int i,j,k;
        vector<int> st;
        for(i=0;i<tokens.size();i++){
            const string&s=tokens[i];
            if(s=="+"||s=="-"||s=="/"||s=="*"){
                int b = st.back(); st.pop_back();
                int a = st.back(); st.pop_back();
                switch(s[0]){
                case '+':
                    st.push_back(a+b);
                    break;
                case '-':
                    st.push_back(a-b);
                    break;
                case '/':
                    st.push_back(a/b);
                    break;
                case '*':
                    st.push_back(a*b);
                    break;
                }
            }
            else
                st.push_back(atoi(s.c_str()));
        }
        return st[0];
    }
};
