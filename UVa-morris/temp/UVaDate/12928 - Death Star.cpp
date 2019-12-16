#include <stdio.h> 
#include <math.h>
#include <algorithm>
#include <set>
#include <map>
#include <assert.h>
#include <vector>
#include <string.h>
using namespace std;
#define eps 1e-10
struct Pt {
    double x, y;
    Pt(double a = 0, double b = 0):
    	x(a), y(b) {}	
	Pt operator-(const Pt &a) const {
        return Pt(x - a.x, y - a.y);
    }
    Pt operator+(const Pt &a) const {
        return Pt(x + a.x, y + a.y);
    }
    Pt operator*(const double a) const {
        return Pt(x * a, y * a);
    }
    bool operator==(const Pt &a) const {
    	return fabs(x - a.x) < eps && fabs(y - a.y) < eps;
	}
    bool operator<(const Pt &a) const {
		if (fabs(x - a.x) > eps)
			return x < a.x;
		if (fabs(y - a.y) > eps)
			return y < a.y;
		return false;
	}
	double length() {
		return hypot(x, y);
	}
	void read() {
		scanf("%lf %lf", &x, &y);
	}
};
const double pi = acos(-1);
int cmpZero(double v) {
	if (fabs(v) > eps) return v > 0 ? 1 : -1;
	return 0;
}
double dot(Pt a, Pt b) {
	return a.x * b.x + a.y * b.y;
}
double cross(Pt o, Pt a, Pt b) {
    return (a.x-o.x)*(b.y-o.y)-(a.y-o.y)*(b.x-o.x);
}
double cross2(Pt a, Pt b) {
    return a.x * b.y - a.y * b.x;
}
int between(Pt a, Pt b, Pt c) {
	return dot(c - a, b - a) >= -eps && dot(c - b, a - b) >= -eps;
}
int onSeg(Pt a, Pt b, Pt c) {
	return between(a, b, c) && fabs(cross(a, b, c)) < eps;
}
struct Seg {
	Pt s, e;
	int label;
	Seg(Pt a = Pt(), Pt b = Pt(), int l=0): s(a), e(b), label(l) {
	}
	bool operator!=(const Seg &other) const {
		return !((s == other.s && e == other.e) || (e == other.s && s == other.e));
	}
};
int intersection(Pt as, Pt at, Pt bs, Pt bt) {
	if (cmpZero(cross(as, at, bs) * cross(as, at, bt)) < 0 &&
		cmpZero(cross(bs, bt, as) * cross(bs, bt, at)) < 0)
		return 1;
	return 0;
}
Pt getIntersect(Seg a, Seg b) {
	Pt u = a.s - b.s;
    double t = cross2(b.e - b.s, u)/cross2(a.e - a.s, b.e - b.s);
    return a.s + (a.e - a.s) * t;
}
double getAngle(Pt va, Pt vb) { // segment, not vector
	return acos(dot(va, vb) / va.length() / vb.length());
}
Pt rotateRadian(Pt a, double radian) {
	double x, y;
	x = a.x * cos(radian) - a.y * sin(radian);
	y = a.x * sin(radian) + a.y * cos(radian);
	return Pt(x, y);
}
int inPolygon(Pt p[], int n, Pt q) {
	int i, j, cnt = 0;
	for(i = 0, j = n-1; i < n; j = i++) {
		if(onSeg(p[i], p[j], q))
			return 1;
		if(p[i].y > q.y != p[j].y > q.y &&
		q.x < (p[j].x-p[i].x)*(q.y-p[i].y)/(p[j].y-p[i].y) + p[i].x)
		cnt++;
	}
	return cnt&1;
}

int main() {
	Pt p[10];
	double x, y;
	int N;
	while (scanf("%lf %lf", &x, &y) == 2) {
		p[0] = Pt(x, y);
		for (int i = 1; i < 5; i++)
			p[i].read();
			
		Pt tri[5][3];
		int ok = 1;
		for (int i = 0; i < 5 && ok; i++) {
			Seg a, b, c;
			a = Seg(p[i], p[(i+2)%5]);
			b = Seg(p[i], p[(i+3)%5]);
			c = Seg(p[(i+4)%5], p[(i+1)%5]);
			ok &= intersection(a.s, a.e, c.s, c.e);
			ok &= intersection(b.s, b.e, c.s, c.e);
			if (ok) {
				tri[i][0] = getIntersect(a, c);
				tri[i][1] = getIntersect(b, c);
				tri[i][2] = p[i];
			}
		}
		scanf("%d", &N);
		for (int i = 0; i < N; i++) {
			Pt q;
			q.read();
			if (ok) {
				int ret = 0;
				for (int j = 0; j < 5; j++)
					ret |= inPolygon(tri[j], 3, q);
				puts(ret ? "Yes" : "No");
			}
		}
		if (!ok) 
			puts("Impossible");
	}
	return 0;
}
