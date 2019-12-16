#include <bits/stdc++.h>
using namespace std;
#define ll long long

const ll nmax = 1e6 + 1;
const ll inf = -nmax;

int top = -1;
struct type{ 
	ll f, fi, fo, fio; 
	type() { f = 0; fi = 1; fo = 1; fio = inf; }
	ll maxx() { return max(max(f, fi), max(fo, fio)); }
} g, stk[nmax];

type S(const type& a, const type& b){
	type re;
	re.f = max(a.f + b.f, a.fo + b.fi - 1);
	re.fi = max(a.fi + b.f, a.fio + b.fi - 1);
	re.fo = max(a.f + b.fo, a.fo + b.fio - 1);
	re.fio = max(a.fi + b.fo, a.fio + b.fio - 1);
	return re;
}

type P(const type& a, const type& b){
	type re;
	re.f = a.f + b.f;
	re.fi = a.fi + b.fi - 1;
	re.fo = a.fo + b.fo - 1;
	re.fio = max(a.fio + b.fio - 2, inf);
	return re;
}

int main(){
	ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
	freopen("indep.inp","r",stdin);
	freopen("indep.out","w",stdout);

	string s; getline(cin, s);

	for (int i = (int)s.length() - 1; i >= 0; --i)
		switch (s[i]){
			case 'g': stk[++top] = g; break;
			case 'S': stk[top - 1] = S(stk[top - 1], stk[top]); top--; break;
			case 'P': stk[top - 1] = P(stk[top - 1], stk[top]); top--; break;
		} 

	cout << stk[0].maxx();

	return 0;
}