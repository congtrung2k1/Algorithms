#include <stdio.h>
#include <stdlib.h>
#include <algorithm>
#include <string.h>
#include <math.h>
#include <vector>
using namespace std;

int visited[32767];
vector<int> tree[32767];
int parent[32767], weight[32767];
int findp(int x) {
    return parent[x] == x ? x : (parent[x] = findp(parent[x]));
}
int joint(int x, int y) {
    x = findp(x), y = findp(y);
    if(x == y)
        return 0;
    if(weight[x] > weight[y])
        weight[x] += weight[y], parent[y] = x;
    else
        weight[y] += weight[x], parent[x] = y;
    return 1;
}

// LCA
vector< pair<int, int> > Q[32767];// query pair, input index - node
int LCA[131072]; // [query time] input query answer buffer.
void tarjan(int u, int p) {// rooted-tree.
    parent[u] = u;
    for(int i = 0; i < tree[u].size(); i++) {//son node.
		int v = tree[u][i];
    	if(v == p)	continue;
        tarjan(v, u);
        parent[findp(v)] = u;
    }
    visited[u] = 1;
    for(int i = 0; i < Q[u].size(); i++) {
        if(visited[Q[u][i].second]) {
            LCA[Q[u][i].first] = findp(Q[u][i].second);
        }
    }
}
int dfs(int u, int p, int weight[]) {
	int sum = weight[u];
    for(int i = 0; i < tree[u].size(); i++) {//son node.
		int v = tree[u][i];
    	if(v == p)	continue;
        sum += dfs(v, u, weight);
    }
    return weight[u] = sum;
}
int main() {
//	freopen("in.txt", "r+t", stdin);
//	freopen("out2.txt", "w+t", stdout); 
	int n, m, x, y, u, v, k;
	int X[32767], Y[32767], K[32767];
	while (scanf("%d %d", &n, &m) == 2) {
		for (int i = 0; i < n; i++)
			tree[i].clear();
		for (int i = 1; i < n; i++) {
			scanf("%d %d", &x, &y);
			tree[x].push_back(y);
			tree[y].push_back(x);
		}
		
		int weight[32767] = {}, extra[32767] = {};
		for (int i = 0; i < n; i++)
            visited[i] = 0, Q[i].clear();
		for (int i = 0; i < m; i++) {
			scanf("%d %d %d", &X[i], &Y[i], &K[i]);
			Q[X[i]].push_back(make_pair(i, Y[i]));
        	Q[Y[i]].push_back(make_pair(i, X[i]));
		}
		tarjan(0, -1);
		for (int i = 0; i < m; i++) {
			extra[LCA[i]] += K[i];
			weight[X[i]] += K[i];
			weight[Y[i]] += K[i];
			weight[LCA[i]] -= 2 * K[i];
		}
		dfs(0, -1, weight);
		for (int i = 0; i < n; i++)
			printf("%d%s", weight[i] + extra[i], i == n-1 ? "" : " ");
		puts("");
	}
	return 0;
}
