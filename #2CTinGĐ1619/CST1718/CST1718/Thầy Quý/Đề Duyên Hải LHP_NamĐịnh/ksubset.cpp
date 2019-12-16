#include <iostream>
#include <math.h>
#include <string.h>
using namespace std;
#define ll long long

struct type{
    int fi,se;
} a[100];
int s[100];

int main(){
    freopen("ksubset.inp","r",stdin);
    freopen("ksubset.out","w",stdout);    

    int n,k; cin >> n >> k;
    for (int i = 1; i <= n; i++) cin >> a[i].se, a[i].fi = i;
    for (int i = 1; i <= n; i++) cin >> s[i];

    while (true) {

for (int i = 1; i <= n; i++) cout << a[i].se << ' ' ; cout << endl;
        int f[100];
        memset(f,0,sizeof(f));
        for (int i = 1, j = 1; i <= n; i++) 
            if (f[j] < s[j]) f[j] += a[i].se; else f[++j] += a[i].se;
        if (f[k] == s[k]) {
            cout << "YES"; exit(0);
        }

        int i = n - 1;
        while (i && a[i].fi > a[i + 1].fi) i--;
        if (i == 0) break;

        int j = n;
        while (i < j && a[i].fi > a[j].fi) j--;
        swap(a[i], a[j]);
        i++; j = n;
        while (i < j) swap(a[i++], a[j--]);
    }
    cout << "NO";
}