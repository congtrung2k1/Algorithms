#include<bits/stdc++.h>
using namespace std;
#define ii pair<long long,int>
#define fi first
#define se second

priority_queue<ii, vector<ii> , greater<ii> > q;
vector<ii> a[30001];
long long dij[30001], ddij[30001], sl[30001], sll[30001];
int n,m;
bool mark[30001];

int main() {
	ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);

	cin >> n >> m;
	for (int u,v,d,i = 0; i < m; i++) {
		cin >> u >> v >> d;
		a[u].push_back(ii(d,v));
		a[v].push_back(ii(d,u));
	}

	for (int i = 1; i <= n; i++) dij[i] = 10000000000000000;
	dij[1] = 0;
	sl[1] = 1;
		
	q.push(ii(0,1));
	while (!q.empty()) { 
		int u = q.top().se; long long gt = q.top().fi; q.pop();
		if (gt != dij[u]) continue;

		for (int i = 0; i < a[u].size(); i++) {
			int v = a[u][i].se; long long y = a[u][i].fi;

			if (dij[v] > gt + y)
			{
				dij[v] = gt + y;
				q.push(ii(dij[v] , v));
				sl[v] = sl[u];
			}
			else if (dij[v] == gt + y) sl[v] += sl[u];
		}
	}

	for (int i = 1; i <= n; i++) ddij[i] = 10000000000000000;
	ddij[n] = 0;
	sll[n] = 1;
		
	q.push(ii(0,n));
	while (!q.empty()) { 
		int u = q.top().se; long long gt = q.top().fi; q.pop();
		if (gt != ddij[u]) continue;

		for (int i = 0; i < a[u].size(); i++) {
			int v = a[u][i].se; long long y = a[u][i].fi;

			if (ddij[v] > gt + y)
			{
				ddij[v] = gt + y;
				q.push(ii(ddij[v] , v));
				sll[v] = sll[u];
			}
			else if (ddij[v] == gt + y) sll[v] += sll[u];
		}
	}

	int ans = 0;
	for (int i = 1; i <= n; i++) 
		if (dij[i] + ddij[i] != dij[n] || sl[i] * sll[i] != sl[n]) ans++, mark[i] = true;

	cout << ans << endl;
	for (int i = 2; i < n; i++) if (mark[i]) cout << i << endl;

	return 0;
}