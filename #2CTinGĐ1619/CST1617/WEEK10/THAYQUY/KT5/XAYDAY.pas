uses math;
Const
  Fi='XAYDAP.I0';
  Fo='XAYDAP.O0';
  maxn=trunc(1e5)+3;
  oo=trunc(1e9);

var
  g,r,x : array[1..maxn] of longint;
  a  : array[1..2*maxn] of int64;
  cs,b,t : array[0..2*maxn] of longint;
  i,j,n : longint;
  best : int64;
  sr,sg : array[0..maxn] of int64;

procedure enter;
  begin
    assign(input,fi);reset(input);
    read(n);
    for i:=1 to n do read(x[i],g[i],r[i]);
    close(input);
  end;

procedure swap(var x,y : longint);
  var tg : longint;
  begin
    tg := x; x:= y;y :=tg;
  end;

procedure qs(l,r : longint);
  var i,j :longint;
      x : int64;
  begin
    i := l;j :=r;
    x := a[cs[(l+r) div 2]];
    repeat
      while a[cs[i]]<x do inc(i);
      while a[cs[j]]>x do dec(j);
      if i<=j then
        begin
          swap(cs[i],cs[j]);
          inc(i);dec(j);
        end;
    until i>j;
    if i<r then qs(i,r);
    if j>l then qs(l,j);
  end;

procedure init;
  begin
    for i:=1 to n do sr[i] := sr[i-1] + r[i];
    for i:=1 to n do sg[i] := sg[i-1] + g[i];
  end;
procedure sub1;
  begin
    for i := 1  to n do
      for j:= i to n do
        begin
          if sr[j] - sr[i-1] >= x[j] - x[i] then
            begin
              best := max(best,sg[j]-sg[i-1]);
            end;
        end;
  end;

procedure roirac;
  var i,hold : longint;
  begin
    for i:=1 to n do a[i] := sr[i]-x[i];
    for i:=1 to n do a[n+i] := sr[i-1]-x[i];
    for i:=1 to 2*n do cs[i] := i;
    qs(1,2*n);
    b[cs[1]]  := 1; hold := 1;
    for i:=2 to 2*n do
      begin
        if a[cs[i]] = a[cs[i-1]] then
          begin
            b[cs[i]] := hold;
          end;
        if a[cs[i]] <> a[cs[i-1]] then
          begin
            inc(hold);
            b[cs[i]] := hold;
          end;
      end;
  end;

procedure update(i,x : longint);
  begin
    while i<=2*n do
      begin
        t[i] := min(t[i],x);
        i := i + i and (-i);
      end;
  end;

function get(i : longint) : longint;
  var res : longint;
  begin
    res := oo;
    while i>0 do
      begin
        res := min(res,t[i]);
        i := i - i and (-i);
      end;
    exit(res);
  end;

procedure sub2;
  var i,tg : longint;
  begin
    roirac;
    for i := 0 to 2*n+3 do t[i] := oo;
    for i:=1 to n do
      begin
        update(b[n+i],i);
        tg := get(b[i]);
        if tg<>oo then
          begin
            best := max(best, sg[i]-sg[tg-1]);
          end;
      end;
  end;

procedure process;
  begin
    sub2;
  end;

procedure print;
  begin
    assign(output,fo);rewrite(output);
    writeln(best);
    close(output);
  end;

begin
  enter;
  init;
  process;
  print;
end.

C++

using namespace std;
#include<bits/stdc++.h>
#define FOR(i, a, b) for (int i = a; i < b; i++)
#define FORE(i, a, b) for (int i = a; i <= b; i++)
#define FORD(i, a, b) for (int i = a; i >= b; i--)
const int MAXN = 5*1e5;
const int INF = 1e9 + 7;

int n;
int x[MAXN], a[MAXN], r[MAXN];
long long sr[MAXN], sx[MAXN], sg[MAXN];
void sub1()
{
    FORE(i, 1, n) sr[i] = sr[i - 1] + r[i];
    FORE(i, 1, n) sx[i] = sx[i - 1] + x[i];
    FORE(i, 1, n) sg[i] = sg[i - 1] + a[i];
    long long ans = 0;
    FORE(i, 1, n) FORE(j, 0, i - 1) if (sr[i] - sr[j] >= x[i] - x[j + 1]){
        ans = max(ans, sg[i] - sg[j]);
        //if (ans == 99) cout<<i<<" "<<j<<endl;
    }
    cout<< ans <<endl;
}

long long b[MAXN], T[MAXN], c[MAXN], sa[MAXN];
int get(int x)
{
    long long ans = INF;
    for(; x; x -= x & -x){
        ans = min(ans, T[x]);
    }
    return ans;
}
void update(int x, long long v)
{
    for(; x < MAXN; x+= x & -x) T[x] = min(T[x], v);
}

void sub2()
{
    sr[0] = 0;
    sa[0] = 0;
    FORE(i, 1, n){
        sa[i] = sa[i - 1] + a[i];
        sr[i] = sr[i - 1] + r[i];
        b[i] = sr[i] - x[i];
        b[i + n] = sr[i - 1] - x[i];
        c[i] = b[i];
        c[i + n] = b[i + n];
    }
    b[n + n + 1] = -x[1];
    c[n + n + 1] = -x[1];
    sort(c + 1, c + n + n + 2);
    FORE(i, 1, n + n + 1) b[i] = lower_bound(c + 1, c + n + n + 2, b[i]) - c;
    FOR(x, 0, 1e5 * 5) T[x] = INF;
    update(b[n + n + 1], 1);
    long long ans = 0;
    FORE(i, 1, n){
        int j = get(b[i]);
        //if (i == 41) cout<<j<<"wtf"<<endl;
        ans = max(ans, 1LL * a[i]);
        if (j != INF)
            ans = max(ans, sa[i] - sa[j - 1]);
        update(b[i + n], i);
    }
    cout << ans << endl;
}
int main()
{
    ios::sync_with_stdio(false); cin.tie(0);
    #ifndef ONLINE_JUDGE
    freopen("MINE.inp", "r", stdin);
    freopen("MINE.out", "w", stdout);
    #endif // ONLINE_JUDGE
    //MIKELHPDATKE;
    cin >> n;
    FORE(i, 1, n) cin >> x[i] >> a[i] >> r[i];
    if (n <= 5000) sub1();
    else
    sub2();
    return 0;
}

Filed Under: BIT, C?u tr£c d? li?u, SPOJ Tagged With: bit, ctdl
Comments

    PHAMTANKHAC says:	
    16/02/2016 at 8:39 s ng

    B?n c¢ th? cho mnh xin thu?t to n b…i n…y kh“ng?
    Tr? l?i	
        admin says:	
        19/02/2016 at 1:38 chi?u

        Mnh da c?p nh?p thˆm thu?t to n ? trˆn
        Tr? l?i	

Speak Your Mind

Name *

Email *

Website

Chuyˆn m?c

    C?u tr£c d? li?u
        BIT
        Hashing
        Heap
        IT
    Ki?m ti?n Online
    Ng“n ng? l?p trnh
        C++
        Java
    OJ
        Codeforces
        SPOJ
    Phuong ph p
        D? quy c¢ nh?
        N‚n s? (r?i r?c h¢a m?ng)
        Nhƒn ma tr?n
        Quy ho?ch d?ng
        Quy ho?ch d?ng tr?ng th i
    T…i li?u
    Th? thu?t m y t¡nh
    Thu?t to n
        BFS
        Bitmask
        Deque
        Duy?t phƒn t?p
        D? quy
        D? th?
            C?p gh‚p
            DFS
            Dijkstra
            Floyd
            Kruskal
            LCA
            Lu?ng
            Prim
        Hnh h?c
        Tm ki?m nh? phƒn
        To n h?c
        V‚t c?n
        X? ly s? l?n

THEO DOI CHUNG TOI TREN FACEBOOK
Ch?n m?c b?n mu?n xem!
basic bit cap ghep co ban code codeforces ctdl dap an day con day con tang DEMSO spoj deque de quy de thi dfs dhfrbus dhlock spoj dhloco dijkstra do thi duyen hai duyet duyet phan tap easy GRAPH_ spoj
 hard hash HBTLCA spoj heap heap max hinh hoc hirehp hsg qg hsgqg icam4 IT khop va cau kruskal liq lis normal PreVOI QHD spoj tknp
BAI VI?T M?I

    C c ki?u d? li?u trong Java
    C c ki?u d? li?u trong C++
    DTDOI - spoj
    AZNET - spoj
    Vi?t ch£ th¡ch trong Java
    C11TRCNT - spoj
    LCS2X - spoj
    D? thi, d p  n, k?t qu? PreVOI 2016

BINH LU?N M?I

    NguyenHai trong SEQ198 - spoj
    conglb trong SEQ198 - spoj
    conglb trong SEQ198 - spoj
    conglb trong LEM3 - spoj
    kien trong LEM3 - spoj
    Phu trong SEQ198 - spoj
    __living is sharing__ trong SEQ198 - spoj

Qu?n ly blog

    Dang k¡
    Dang nh?p
    RSS cho b…i vi?t
    D•ng th“ng tin c c ph?n h?i.
    WordPress.org

B?n c¢ th? dang ky th…nh viˆn d? c¢ th? vi?t b…i.

Return to top of page

Copyright c 2016 ú Genesis Framework ú WordPress ú Log in
