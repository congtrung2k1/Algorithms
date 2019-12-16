#include <bits/stdc++.h>
using namespace std;
#define ll long long
#define nmax 4000001

int ngto[nmax], cnt[nmax];
int n,k,m;
ll ans = 1;

void sang(){
    for (int i = 2; i <= 4000000; i++)
        if (ngto[i] == 0)
            for (int j = 1; j <= 4000000 / i; j++) ngto[i * j] = i;
}

void inc(int n){
    while (n > 1){
        int i = ngto[n];
        n /= i;
        ++cnt[i];
        if (cnt[i] > 0) ans = (ans * i) % m;
    }
}
void dec(int n){
    while (n > 1){
        int i = ngto[n];
        n /= i;
        --cnt[i];
    }
}

int main(){
    freopen("equa.inp","r",stdin);
    freopen("equa.out","w",stdout);

    scanf("%d %d %d", &n, &k, &m);
    for (int x, i = 0; i < k; i++){
        scanf("%d", &x);
        n -= x - 1;
    }
    sang();

    for (int i = 2; i < n; i++){
        if (i <= min(k - 1, n - k)) dec(i); else
        if (i > max(k - 1, n - k)) inc(i);
    }
    cout << ans;

    return 0;
}
