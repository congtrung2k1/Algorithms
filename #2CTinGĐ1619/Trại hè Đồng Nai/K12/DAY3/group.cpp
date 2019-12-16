#include <bits/stdc++.h>
using namespace std;
#define nmax 2000010
#define ii pair<int, int>

vector<int> prime;
bool ngto[nmax];
void init(int n){
    for (int i = 2; i <= n; i++)
        if (!ngto[i]){
            prime.push_back(i);
            for (int j = 2; j <= n / i; j++) ngto[i * j] = true;
        }
}

int main(){
    ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
    freopen("group.inp","r",stdin);
    freopen("group.out","w",stdout);

    int n; cin >> n;
    init(2 * n + 1);

    stack<ii> st;
    int i = n, cnt = 0;
    while (i > 0){
        int t = upper_bound(prime.begin(), prime.end(), i) - prime.begin();
        int a = prime[t] - i;
        st.push( {a,i} );
        cnt += (i - a + 1) / 2;
        i = a - 1;
    }

    cout << cnt << '\n';
    while(!st.empty()){
        int l = st.top().first, r = st.top().second; st.pop();
        for (; l < r; l++, r--) cout << l << ' ' << r << '\n';
    }

    return 0;
}
