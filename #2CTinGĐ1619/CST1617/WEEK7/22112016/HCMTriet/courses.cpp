//
//  main.cpp
//  courses
//
//  Created by Ngô Hùng Minh Triết  on 11/22/16.
//  Copyright © 2016 Ngô Hùng Minh Triết . All rights reserved.
//

#include <fstream>
#include <algorithm>
#include <stack>

using namespace std;

ifstream cin ("courses.inp");
ofstream cout("courses.out");

const int maxN = 10010;

int n;
string a[maxN];
stack <string> st;

bool check(string a, string b)
{
    for(int i=0; i<min(a.length(),b.length()); i++)
    {
        if (a[i]!=b[i]) return false;
    }
    return true;
}

int main()
{
    int Test;
    cin>>Test;
    for(int t=1; t<=Test; t++)
    {
        cin>>n;
        for(int i=1; i<=n; i++) cin >> a[i];
        sort(a+1,a+n+1);
        st.push(a[1]);
        for(int i=2; i<=n; i++)
        {
            while(!st.empty() && check(a[i],st.top())==true) st.pop();
            st.push(a[i]);
        }
        cout<<st.size()<<endl;
        while (!st.empty()) st.pop();
    }
    return 0;
}
