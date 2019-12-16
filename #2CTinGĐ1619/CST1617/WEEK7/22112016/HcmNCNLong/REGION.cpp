#include <iostream>
#include <algorithm>
#include <cstdio>

#define maxn 100003
using namespace std;

struct DATA {
    int id, reg, sc;
};

int n, man, region, cocc, maxVal = -1;
bool already[maxn], mark[maxn], hasReg[maxn];
DATA a[maxn];

void input()
{
    bool med;
    cin >> n >> man >> region;

    for(int i = 1; i <= n; i++)
    {
        cin >> a[i].id >> a[i].reg >> a[i].sc >> med;
        hasReg[a[i].reg] = true;

        if(med) {
            already[a[i].reg] = true;
            swap(a[i], a[++cocc]);
        }
        else maxVal = max(maxVal, a[i].sc);
    }
}

int Count(int low)
{
    for(int i = 1; i <= region; i++)
        mark[i] = already[i];

    int cnt = cocc;

    for(int i = cocc + 1; i <= n; i++)
    {
        if(a[i].sc >= low)
        {
            cnt++;
            mark[a[i].reg] = true;
        }
    }

    for(int i = 1; i <= region; i++)
        if(!mark[i] && hasReg[i])
            cnt++;
    return cnt;
}

void process()
{
    int l = 0, r = maxVal, mid, res, cnt;

    while(l < r)
    {
        mid = (l + r) >> 1;
        cnt = Count(mid);

        if(cnt > man)
            l = mid + 1;
        else if(cnt < man)
            r = mid - 1;
        else
            r = res = mid;
    }

    cout << res;
}

int main()
{
    ios::sync_with_stdio(false);
	freopen("REGION.INP", "r", stdin);
	freopen("REGION.OUT", "w", stdout);

    input();
    for(int i = 1; i <= region; i++) cout << hasReg[i] << ' '; cout << '\n';
    for(int i = 1; i <= region; i++) cout << already[i] << ' '; cout << '\n';
    process();

    return 0;
}
/*
9 6 5
6 1 799 0
2 4 995 0
1 4 989 1
7 2 538 0
5 4 984 0
8 2 1000 0
3 2 998 0
4 2 823 1
9 1 543 0
*/
