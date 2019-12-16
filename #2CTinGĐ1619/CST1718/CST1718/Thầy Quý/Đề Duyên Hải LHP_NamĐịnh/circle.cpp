#include <iostream>
#include <math.h>
#include <algorithm>
using namespace std;
    
int n;    
float a[5001], b[5001];

int main(){
    freopen("circle.inp","r",stdin);
    freopen("circle.out","w",stdout);

    cin >> n;
    for (int i = 1; i <= n; i++) {
        int u,v; cin >> u >> v;
        a[i] = 1.0 * u * u + 1.0 * v * v;
    }
    for (int i = 1; i <= n; i++) {
        int u,v; cin >> u >> v;
        b[i] = 1.0 * u * u + 1.0 * v * v;
    }
    sort(a + 1, a + n + 1);
    sort(b + 1, b + n + 1);

    for (int i = 1; i <= n; i++) {
        if (a[i] < b[i + 1] && b[i] < a[i + 1]) {
            if (a[i] < b[i]) printf("%.6f", sqrt(b[i])); else printf("%.6f", sqrt(a[i]));
            exit(0);
        }
    }   
}