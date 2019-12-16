#include <bits/stdc++.h>
using namespace std;
#define ll long long

const int nmax = 1e5 + 1;
const int wmax = 1e6;
const ll oo = (ll)nmax * wmax;

int n,m,k,cnt;
ll d[nmax];

struct node{ 
    int v,w; 
};
vector<node> a[nmax];

struct heapNode
{
    int u; ll val;
    inline bool operator < (const heapNode& other) const
    {
        return val > other.val;
    }
};
priority_queue<heapNode> heap;

inline int sign(ll x){
    return x > 0 ? 1 : (x < 0 ? -1 : 0);
}

struct bigNum{
    int dau;
    array<ll, 4> save;
    const ll MOD = 1e9;

    bigNum(){
        fill(save.begin(), save.end(), 0);
    }
    bigNum(ll x){
        dau = sign(x);
        x = abs(x);
        fill(save.begin(), save.end(), 0);
        for (int i = 0; i < 4 && x > 0; i++) save[i] = x % MOD, x /= MOD;
    }

    inline bigNum operator * (const bigNum& a) const {
        bigNum re;
        re.dau = dau * a.dau;

        if (re.dau == 0){
            fill(re.save.begin(), re.save.end(), 0);
            return re;
        }

        for (int i = 0; i < 4; i++)
            for (int j = 0; j < 4; j++){
                int k = i + j;
                re.save[k] += save[i] * a.save[j];
                while (k < 4 && re.save[k] > MOD) {
                    re.save[k + 1] = re.save[k] / MOD;
                    re.save[k] %= MOD;
                    k++;
                }
            }
        return re;
    }

    inline bool operator > (const bigNum& a) const {
        if (dau != a.dau) return dau > a.dau;
        if (dau == 0) return false;

        int tmp = 0;
        for (int i = 3; i >= 0; i--)
            if (save[i] != a.save[i]){
                tmp = sign(save[i] - a.save[i]);
                break;
            }
        return tmp * dau > 0;
    }
};

struct POINT{
    ll x, y;
    inline POINT operator - (const POINT& a) const { return {x - a.x, y - a.y}; }
    inline ll operator * (const POINT& a) const {
        bigNum q = bigNum(x) * bigNum(a.y);
        bigNum p = bigNum(y) * bigNum(a.x);
        if (q > p) return 1;
        if (p > q) return -1;
        return 0;
    }
} p[nmax], hull[nmax];

inline int read(){
    char c;
    for (c = getchar(); c < '0' || c > '9'; c = getchar());
    int re = c - '0';
    for (c = getchar(); c >= '0' && c <= '9'; c = getchar()) re = re * 10 + c - '0';
    return re;
}

inline void write(ll x){
    if (x > 9) write(x / 10);
    putchar(x % 10 + '0');
}

void dijkstra(int s){
    for (int i = 1; i <= n; i++) d[i] = oo;
    d[s] = 0;
    heap.push({s,0});

    while (!heap.empty()){
        heapNode t = heap.top(); heap.pop();
        if (d[t.u] == t.val)
            for (const node& x: a[t.u]){
                if (d[x.v] > d[t.u] + x.w){
                    d[x.v] = d[t.u] + x.w;
                    heap.push({x.v, d[x.v]});
                }
            }
    }
}

inline bool ccw(const POINT& a, const POINT& b, const POINT& c){
    return (b - a) * (c - b) > 0;
}

inline ll Fun(const POINT& a, const POINT& b){
    return a.x * b.x + a.y * b.y;
}

inline bool better(int m, const POINT& K){
    if (m <= 1) return true;
    if (m > cnt) return false;
    return Fun(hull[m - 1], K) > Fun(hull[m], K);
}

int main(){
    ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
    freopen("mpoints.inp","r",stdin);
    freopen("mpoints.out","w",stdout);

    n = read(); m = read(); k = read();
    for (int i = 0; i < m; i++){
        int u = read(), v = read(), w = read();
        a[u].push_back({v,w});
    }

    dijkstra(1);
    for (int i = 1; i <= n; i++) p[i].x = d[i];
    dijkstra(n);
    for (int i = 1; i <= n; i++) p[i].y = d[i];

    sort(p + 1, p + n + 1, [](const POINT& a, const POINT& b){
        return a.x < b.x || (a.x == b.x && a.y < b.y);
    });
    for (int i = 2; i <= n; i++) if (p[i].x == p[i - 1].x) p[i].y = oo;
    int q = 0;
    for (int i = 1; i <= n; i++) if (p[i].x < oo && p[i].y < oo) p[++q] = p[i];
    cnt = 0;
    for (int i = 1; i <= q; i++){
        while (cnt >= 2 && !ccw(hull[cnt - 1], hull[cnt], p[i])) --cnt;
        hull[++cnt] = p[i];
    }

    while (k--){
        POINT K;
        K.x = read(), K.y = read();
        int l = 2, r = cnt;
        while (l <= r){
            int m = (l + r) / 2;
            if (better(m, K)) l = m + 1; else r = m - 1;
        }

        ll ans = Fun(hull[r], K);
        write(ans); putchar('\n');
    }

    return 0;
}