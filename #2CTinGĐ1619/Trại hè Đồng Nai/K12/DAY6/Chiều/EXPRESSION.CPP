#include <bits/stdc++.h>
using namespace std;
#define ll long long

string s; 
stack<string> stk;
stack<ll> ans;

int gcd(int a, int b){ return (b == 0) ? a : gcd(b, a % b); }

int main(){
	ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
	freopen("EXPRESSION.inp","r",stdin);
	freopen("EXPRESSION.out","w",stdout);

	cin >> s;
	string w = "";
	for (int i = 0; i < s.length(); i++)
		if (s[i] != '(' && s[i] != ')' && s[i] != ',') w += s[i];
		else 
		if (w != ""){
			stk.push(w);
			w = "";
		}
	if (w != "") stk.push(w);

	while (!stk.empty()){
		string a = stk.top(); stk.pop();
		if ('0' <= a[0] && a[0] <= '9') ans.push(atoi(a.c_str()));
		else 
		{	
			ll u = ans.top(); ans.pop();
			ll v = ans.top(); ans.pop();

			if (a == "SUM") ans.push(u + v); else
			if (a == "DIF") ans.push(u - v); else
			if (a == "MAX") ans.push(max(u,v)); else;
			if (a == "MIN") ans.push(min(u,v)); else;
			if (a == "GCD") ans.push(gcd(abs(u), abs(v)));
		}
	}

	cout << ans.top();

	return 0;
}