#include<iostream>
#include<string>
#include<cstring>
using namespace std;

class Solution {
public:

    bool isNumber(const char *s) {
        // format in regex:
        // \s* (+|-)? (\d+(.\d*)?|.\d+) (e (+|-)? \d+)? \s*

        int i,j,k;
        for(i=0;isspace(s[i]);i++);
        if(s[i]=='+'||s[i]=='-')i++;
        if(isdigit(s[i])){
            for(;isdigit(s[i]);i++);
            if(s[i]=='.'){
                for(i++;isdigit(s[i]);i++);
            }
        }
        else if(s[i]=='.'){
            i++;
            if(!isdigit(s[i]))return false;
            for(;isdigit(s[i]);i++);
        }
        else return false;

        if(s[i]=='e'||s[i]=='E'){
            i++;
            if(s[i]=='+'||s[i]=='-')i++;
            if(!isdigit(s[i]))return false;
            for(;isdigit(s[i]);i++);
        }

        for(;isspace(s[i]);i++);

        return s[i]==0;
    }
};

int main(){
    Solution s;
    cout<<(!s.isNumber(""))<<endl;
    cout<<(!s.isNumber("."))<<endl;
    cout<<(!s.isNumber(" ."))<<endl;
    cout<<(!s.isNumber(" . "))<<endl;
    cout<<(!s.isNumber(" 1e"))<<endl;
    cout<<(!s.isNumber(" 1e "))<<endl;
    cout<<(s.isNumber(" .1 "))<<endl;
    cout<<(s.isNumber(" .11 "))<<endl;
    cout<<(s.isNumber(" 1.11 "))<<endl;
    cout<<(s.isNumber(" -.11 "))<<endl;
    cout<<(s.isNumber(" +.11 "))<<endl;
    cout<<(s.isNumber(" +.11e1 "))<<endl;
    cout<<(s.isNumber(" +.11e+1 "))<<endl;
    cout<<(!s.isNumber(" + 1.11e+1 "))<<endl;
    cout<<(s.isNumber(" +1.11e+1 "))<<endl;
}
