#include <bits/stdc++.h>
using namespace std;
#define ss 100000

int n,start,f, a[21000][21000], chu[21000], tram[21000], que[21000];
string tmp;

int main() {
	ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
	freopen("input.inp","r",stdin);
	freopen("input.out","w",stdout);

	cin >> n;
	for (int i = 1; i <= 2100; i++)
		for (int j = 1; j <= 2100; j++) a[i][j] = (i == j ? 0 : ss);

	getline(cin,tmp);
	for (int i = 1; i <= n; i++) {
		string s;
		getline(cin,s);

		stringstream sss; sss << s;
		int m = 0, tmp[30];
		while (!sss.eof()) {
			m++; sss >> tmp[m];
			for (int j = m - 1; j > 0; j--) 
				a[tmp[m]][tmp[j]] = min(a[tmp[m]][tmp[j]] , m - j),
				a[tmp[j]][tmp[m]] = min(a[tmp[j]][tmp[m]] , m - j);
		}
	}
	cin >> start >> f;

	for (int i = 1; i <= 2100; i++) chu[i] = -1;
	int fi = 0, se = 0;
	que[se] = start;
	chu[start] = 0;
	tram[start] = 1;

	while (fi <= se) { 
		int u = que[fi++]; 

		if (u == f) { 
			cout << chu[f] << ' ' << tram[f]; return 0;
		}

		for (int i = 1; i <= 2100; i++)
			if (chu[i] == -1 && a[u][i] != ss) {
				chu[i] = chu[u] + 1;
				tram[i] = tram[u] + a[u][i];
				que[++se] = i;
			}
			else
			if (chu[i] == chu[u] + 1 && a[u][i] != ss) 
				tram[i] = min(tram[i] , tram[u] + a[u][i]); 

	}

	return 0;
}