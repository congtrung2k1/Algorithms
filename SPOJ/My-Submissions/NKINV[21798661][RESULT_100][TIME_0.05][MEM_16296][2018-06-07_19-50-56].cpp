#include <bits/stdc++.h>
using namespace std;
#define nMax 60000

int bit[nMax];

int get(int i){
    int t = 0;
    for (; i <= nMax; i += i & -i) t += bit[i];
    return t;
}
void update(int i){
    for (; i; i -= i & -i) bit[i]++;
}

int main(){
    int n,ans = 0; cin >> n;
    for (int i = 0; i < n; i++){
        int x; cin >> x;
        ans += get(x + 1);
        update(x);
    }

    cout << ans;
    return 0;
}
