#include <bits/stdc++.h>
using namespace std;
#define ll long long

ll prev[1000001];

int main(){
	ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
	
	string s,a; cin >> s >> a;
	ll ls = s.length(), la = a.length();
	s = " " + s; a = " " + a;

	for (int j = 0, i = 2; i <= la; i++){
		while (j > 0 && a[j + 1] != a[i]) j = prev[j];
		if (a[j + 1] == a[i]) ++j;
		prev[i] = j;
	}

	for (int j = 0, i = 1; i <= ls; ++i){
		while (j > 0 && a[j + 1] != s[i]) j = prev[j];
		if (a[j + 1] == s[i]) ++j;
		if (j == la){
			cout << i - la + 1 << " "; 
			j = prev[j];
		}
	}

	return 0;
}