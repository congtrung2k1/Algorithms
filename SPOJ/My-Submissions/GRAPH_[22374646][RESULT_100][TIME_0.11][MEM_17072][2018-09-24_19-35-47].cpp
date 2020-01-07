#include <iostream>
#include <stdio.h>
#include <string.h>
#include <vector>
using namespace std;
#define nmax 10001

vector<int> a[nmax];
int n,m,cnt,num[nmax], low[nmax], par[nmax];

void dfs(int u, int la) { 
    num[u] = ++cnt; low[u] = n + 1;
    for (int v: a[u])
        if (v != la)
        if (par[v] == 0)
            par[v] = u,
            dfs(v, u),
            low[u] = min(low[u], low[v]);
        else
            low[u] = min(low[u], num[v]);
}

void out(){
    int cau = 0, khop = 0;
    int  nCNT[nmax] = {0};
    bool isCut[nmax] = {false};

    for (int i = 1; i <= n; i++) 
        if (par[i] != -1) nCNT[par[i]]++;

    for (int i = 1; i <= n; i++)
        if (par[i] != -1 && low[i] >= num[i]) cau++;

    for (int i = 1; i <= n; i++)
        if (par[i] != -1 && low[i] >= num[par[i]])
            isCut[par[i]] = isCut[par[i]] || (par[par[i]] != -1) || (nCNT[par[i]] >= 2);

    for (int i = 1; i <= n; i++) if (isCut[i]) khop++;
    cout << khop << ' ' << cau;
}

int main() {
    cin >> n >> m;
    for (int i = 1; i <= m; i++) {
        int u,v; cin >> u >> v;
        a[u].push_back(v);
        a[v].push_back(u);
    }

    memset(par,0,sizeof(par));
    for (int i = 1; i <= n; i++)
        if (par[i] == 0)
            par[i] = -1,
            dfs(i, 0);
    out();       
}