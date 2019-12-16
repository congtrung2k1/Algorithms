#include <bits/stdc++.h>
using namespace std;
#define nmax 300001

int n;
bool gr[nmax], Change[nmax];
vector<int> a[nmax], List;

inline int read(){
    char c;
    for (c = getchar(); c < '0' || c > '9'; c = getchar());
    int re = c - '0';
    for (c = getchar(); c >= '0' && c <= '9'; c = getchar()) re = re * 10 + c - '0';
    return re;
}

inline void write(int x){
    if (x > 9) write(x / 10);
    putchar(x % 10 + '0');
}

inline int check(int i){
    int dem = 0;
    for (int x: a[i]) if (gr[x] == gr[i]) dem++;
    return dem;
}

int main(){
    freopen("groupdiv.inp","r",stdin);
    freopen("groupdiv.out","w",stdout);

    n = read();
    for (int i = 1; i <= n; i++){
        List.push_back(i);
        int x = read();
        while (x--){
            int s = read();
            a[i].push_back(s);
        } 
    }

    while (!List.empty()) {
        int i = List.back(); List.pop_back();
        Change[i] = true;

        if (check(i) > 1){
            gr[i] = !gr[i];
            for (int x: a[i])
                if (gr[x] == gr[i] && Change[x]) List.push_back(x);
        }
    }

    putchar('Y'); putchar('E'); putchar('S'); putchar('\n');
    for (int i = 1; i <= n; i++) if (gr[i]) write(i), putchar(' ');
    putchar('\n');
    for (int i = 1; i <= n; i++) if (!gr[i]) write(i), putchar(' ');

    return 0;
}
