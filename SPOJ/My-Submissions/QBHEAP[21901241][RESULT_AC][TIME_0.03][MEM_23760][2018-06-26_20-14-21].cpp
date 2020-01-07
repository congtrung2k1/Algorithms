#include <bits/stdc++.h>
using namespace std;
#define ll long long
#define base 1e-16

int main(){
    ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
    //freopen("input.inp","r",stdin);

    priority_queue<int> q;
    string s;
    getline(cin, s);
    while (s != ""){
        if (s[0] == '+'){
            s.erase(0,1);
            int n = atoi(s.c_str());
            if (q.size() < 15000) q.push(n);
        }
        else
        if (!q.empty()){
            int t = q.top();
            while (!q.empty() && q.top() == t) q.pop();
        }
        getline(cin, s);
    }
    
    int t = 0;
    int a[2000001];
    a[0] = -1;
    while (!q.empty()){
        if (q.top() != a[t]) t++, a[t] = q.top();
        q.pop();
    }
    
    printf("%d\n", t);
    for (int i = 1; i <= t; i++) printf("%d\n", a[i]);

    return 0;
}
