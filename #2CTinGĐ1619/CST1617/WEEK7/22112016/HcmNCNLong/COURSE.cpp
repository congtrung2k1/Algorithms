#include <iostream>
#include <algorithm>
#include <string>
#include <set>
#include <cstdio>

using namespace std;

int n, minLen = 1000000000;
set<string> save;
string a[500002];

int main()
{
	freopen("COURSE.INP", "r", stdin);
	freopen("COURSE.OUT", "w", stdout);
    int q;
    cin >> q;

    while(q--)
    {
        cin >> n;
        for(int i = 1; i <= n; i++)
        {
            cin >> a[i];
            minLen = min(minLen, (int)a[i].size());
        }

        for(int i = 1; i <= n; i++)
        {
            a[i].resize(minLen);
            save.insert(a[i]);
        }

        cout << save.size() << '\n';
        save.clear();
    }

    return 0;
}
/*
2
3
algebra
algeb
history
4
algebr
alg
algebra
algeb
*/
