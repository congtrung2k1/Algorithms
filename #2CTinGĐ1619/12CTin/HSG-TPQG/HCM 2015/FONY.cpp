#include <iostream>
#include <vector>
#include <stack>
#include <string.h>
 
using namespace std;
 
int a[100001], f[100001], ind[100001], cnt[100001];
vector <int> inv_a[100001];
bool fre[100001], kosaraju;
stack <int> s;
 
void dfs(int u) {
    fre[u] = false;
    if (kosaraju) {
        for (int i = 0; i < (int) inv_a[u].size(); i++)
            if (fre[inv_a[u][i]]) dfs(inv_a[u][i]);
    }
    else {
        if (fre[a[u]]) dfs(a[u]);
        s.push(u);
    }
}
 
void calc(int u) {
    if (f[u]) return;
    if (ind[u] == ind[a[u]]) f[u] = cnt[ind[u]];
    else calc(a[u]), f[u] = 1+f[a[u]];
}
 
int main() {
    int n;
    cin >> n;
    for (int i = 1; i <= n; i++)
        cin >> a[i], inv_a[a[i]].push_back(i);
    memset(fre, true, sizeof(fre));
    kosaraju = false;
    for (int i = 1; i <= n; i++)
        if (fre[i]) dfs(i);
    memset(fre, true, sizeof(fre));
    kosaraju = true;
    int id = 0;
    while (s.size()) {
        id++;
        dfs(s.top());
        while (s.size() && !fre[s.top()]) {
            ind[s.top()] = id;
            cnt[id]++;
            s.pop();
        }
    }
    memset(f, 0, sizeof(f));
    for (int i = 1; i <= n; i++)
        calc(i), cout << f[i] << '\n';
    return 0;
}