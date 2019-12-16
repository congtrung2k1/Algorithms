#include <bits/stdc++.h>
using namespace std;
#define ld long double
#define eps 1e-16
#define nmax 1000010
#define pi 3.14

struct POINT{
    ld x,y;

    POINT(){ x = y = 0; }
    POINT(ld X, ld Y): x(X), y(Y) {}

    POINT operator + (const POINT& a) { return POINT(x + a.x, y + a.y); }
    POINT operator - (const POINT& a) { return POINT(x - a.x, y - a.y); }
    POINT operator * (ld k) { return POINT(x * k, y * k); }
    POINT operator / (ld k) { return POINT(x / k, y / k); }


    // Tich vo huong 2 vector
    ld operator * (const POINT& a) { return x * a.x + y * a.y; }
    // Tich ngoai 2 vector
    ld operator % (const POINT& a) { return x * a.y - y * a.x; }

    ld len() { return sqrt(x * x + y * y); }
    ld norm() { return x * x + y * y; }

} point[nmax];

struct LINE{
    ld a, b, c;
    POINT A, B;

    LINE(){ a = b = c = 0; }
    LINE(ld a, ld b, ld c): a(a), b(b), c(c) {}
    LINE(POINT A, POINT B): A(A), B(B) {
        a = A.y - B.y;
        b = B.x - A.x;
        c = A.x * B.y - A.y * B.x;
        //c = - (a * A.x + b * A.y);
    }
    // Gia tri phuong trinh duong thang sau khi thay (p.x, p.y)
    ld f(POINT p){ return a * p.x + b * p.y + c; }
    ld d(POINT p){ return f(p) / sqrt(a * a + b * b); }

} line[nmax];

int cmp(ld x, ld y) {
    return x < y - eps ? -1 : (x > y + eps ? 1 : 0); 
}
int cmp(POINT a, POINT b){
    return cmp(a.x, b.x) == -1 ? -1 : (cmp(a.x, b.x) == 1 ? 1 : cmp(a.y, b.y));
}

bool operator == (const ld& x, const ld& y){ return fabs(x - y) < eps; }

ld goc(POINT a, POINT o, POINT b){
    a = a - o; b = b - o;
    return acos( (a * b) / a.len() / b.len() );
}
ld goc(POINT A, POINT B){
    return acos( (A * B) / A.len() / B.len() );
}
ld gocdh(POINT a, POINT b){
    return (a % b > 0) ? goc(a,b) : -goc(a,b);
}

// 3 diem thang hang
// B la diem thuoc doan AC
bool thang(POINT a, POINT b, POINT c){
    return (b - a) % (c - b) == 0;
}
// 2 vector dong phuong
bool dongphuong(POINT a, POINT b){
    return (a % b) == 0;
}
// 2 vector cung chieu
bool dithang(POINT a, POINT b){
    return (a % b) == 0 && (a * b) >= 0;
}
// 3 diem cung chieu a -> b -> c
bool dithang(POINT a, POINT b, POINT c){
    return dithang(b - a, c - b);
}
// diem trong doan
bool diemtrongdoan(POINT a, POINT b, POINT c){
    return dithang(a,b,c) && (b - a) * (c - b) < 0;
}

// di thang: 0,  re phai (goc tu): -1,  re trai (goc nhon): 1
// a -> b -> c
int ccw(POINT a, POINT b, POINT c){
    return cmp((b - a) % (c - b), 0);
}
int ccw(POINT A, POINT B){
    return cmp(A % B, 0);
}

// AB cat CD
bool cut(POINT a, POINT b, POINT c, POINT d){
    return ccw(b - a, c - a) * ccw(b - a, d - a) <= 0 && ccw(d - c, a - c) * ccw(d - c, b - c) <= 0;
}
bool cut(LINE x, LINE y){
    return cmp(x.f(y.A) * x.f(y.B) , 0) <= 0;
}

bool areParallel(LINE x, LINE y) {
    return cmp(x.a * y.b, x.b * y.a) == 0;
}

bool intersect(LINE x, LINE y, POINT &re){
    if (areParallel(x,y)) return false;
    ld d  = x.a * y.b - x.b * y.a;
    ld dx = x.b * y.c - x.c * y.b;
    ld dy = x.a * y.c - x.c * y.a;
    if (d == 0) re = POINT(dx, -dy); else re = POINT(dx/d , -dy/d);
    return true;
}

int main(){
    ios::sync_with_stdio(false); cin.tie(0); cout.tie(0);
    freopen("input.inp","r",stdin);
    return 0;
}
