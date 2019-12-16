#include <bits/stdc++.h>
using namespace std;
#define ll long long
#define nmax 2001

struct POINT{
	int x,y,z;
	POINT() { x = y = z = 0; }
	POINT(int x, int y, int z): x(x), y(y), z(z) {}
	inline POINT operator - (const POINT& a){ return POINT(x - a.x, y - a.y, z - a.z); }
	inline POINT operator / (const POINT& a){ return POINT(x / a.x, y / a.y, z / a.z); }
	inline bool operator < (const POINT& a) const{
		return  x < a.x || (x == a.x && y < a.y) || (y == a.y && z < a.z);	
	}
} a[nmax];


int n;
int ans;
map<POINT, int> mp;

inline int gcd(int a, int b){ return (b == 0) ? abs(a) : gcd(abs(b), abs(a) % abs(b)); }

int main(){
	ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
	freopen("archer.inp","r",stdin);
	freopen("archer.out","w",stdout);

	cin >> n;
	for (int i = 0; i < n; i++) cin >> a[i].x >> a[i].y >> a[i].z;

	for (int k = 0; k < n; k++){
		mp.clear();
		int v0 = 1, r = 0;
		for (int i = 0; i < n; i++){
			if (i == k) continue;
			
			POINT tmp = a[i] - a[k];
			if (tmp.x == 0 && tmp.y == 0 && tmp.z == 0) v0++; 
			if (tmp.z > 0){
				int d = gcd(tmp.x, gcd(tmp.y, tmp.z));
				tmp = tmp / POINT(d,d,d);
				if (!mp.count(tmp)) mp[tmp] = 1; else mp[tmp]++;
				r = max(r, mp[tmp]); 
			}			
		}
		ans = max(ans, r + v0);
	}

	cout << ans;

	return 0;
}