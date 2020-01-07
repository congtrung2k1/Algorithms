#include <bits/stdc++.h>
using namespace std;

int n,x,cnt[500001];
long long ans;
vector<int> st;

int main(){
    ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);

    cin >> n >> x;
    st.push_back(x);
    cnt[1] = 1;
    for (int i = 2; i <= n; i++) {
        cin >> x;
        while (st.size() != 0 && x > st.back()) {
            ans += cnt[st.size()];
            st.pop_back();
        }
        if (st.size() != 0 && x == st.back()) {
            ans += cnt[st.size()];
            cnt[st.size()]++;
            if (st.size() > 1) ans++;
            continue;
        }

        if (st.size() > 0) ans++;
        st.push_back(x);
        cnt[st.size()] = 1;
    }

    cout << ans;

    return 0;
}