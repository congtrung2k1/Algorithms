/**
 * The algorithm is O(n^2). First deal with duplicate points by combining them.
 * Then go through every pair of points to find the
 * gradient and y-intercept of the line defined by the points. Keep track of
 * the number of points in each line.
 */

#include<iostream>
#include<unordered_map>
#include<unordered_set>
#include<vector>
#include<cmath>
using namespace std;

struct Point {
  int x;
  int y;
  Point() : x(0), y(0) {}
  Point(int a, int b) : x(a), y(b) {}
};

struct rational{
    int a,b;
    inline rational(): a(0), b(0){}
    inline rational(int m, int n): a(m), b(n){};
    inline bool operator==(const rational&g)const{
        return a==g.a&&b==g.b;
    }
};

struct line{
    rational m,c; // y = mx + c
    inline bool operator==(const line&l)const{
        return m==l.m && c==l.c;
    }
};

struct pt{
    Point p; int count;
};

int gcd(int a, int b){
    if(b==0)return a;
    return gcd(b,a%b);
}

rational norm(int a, int b){
    int s=1,d;
    if(a<0){
        if(b<0)d=gcd(-a,-b);
        else {s=-1;d=gcd(-a,b);}
    }
    else{
        if(b<0){s=-1;d=gcd(a,-b);}
        else {d=gcd(a,b);}
    }
    if(d==0)d=1;
    if(a==0)return rational(0,1);
    if(b==0)return rational(a*s,0);
    return rational(s*(abs(a)/d),abs(b)/d);
}
typedef unordered_set<line> sett;
typedef unordered_map<line,int> mapt;
namespace std{
    template<>
    struct hash<line> {
        inline size_t operator()(const line&g)const {
            return g.m.a^g.m.b^g.c.a^g.c.b;
        }
    };
}

class Solution {
public:
    int maxPoints(vector<Point> &points) {
        int i,j;
        mapt map;
        vector<pt> pts;
        vector<bool> used;
        int best=0;
        for(i=0;i<points.size();i++)
            used.push_back(false);
        for(i=0;i<points.size();i++){
            if(used[i])continue;
            const Point&p1=points[i];
            pt pt; pt.p=p1; pt.count=1;
            for(j=i+1;j<points.size();j++){
                if(used[j])continue;
                const Point&p2=points[j];
                if(p2.x==p1.x&&p2.y==p1.y){used[j]=true;pt.count++;}
            }
            pts.push_back(pt);
            best=max(best,pt.count);
        }
        int n=pts.size();
        sett set;
        for(i=0;i<n;i++){
            const Point&p1=pts[i].p;
            set.clear();
            for(j=0;j<n;j++){
                if(i==j)continue;
                const Point&p2=pts[j].p;
                line l;
                l.m = p1.x==p2.x?rational(1,0):norm(p1.y - p2.y, p1.x - p2.x);
                l.c = p1.x==p2.x?rational(p1.x,0):norm(p1.y*l.m.b-p1.x*l.m.a,l.m.b);
                pair<sett::iterator,bool> ret =set.insert(l);
                if(!ret.second)continue;
                pair<mapt::iterator,bool> ret2=map.emplace(make_pair(l,pts[i].count));
                mapt::iterator &it2=ret2.first;
                if(!ret2.second){
                    best=max(best,it2->second += pts[i].count);
                }
            }
        }
        return best;
    }
};

int main(){
    Solution s;
    vector<Point> pts;
    pts.push_back(Point(1,1));
    pts.push_back(Point(1,1));
    pts.push_back(Point(2,2));
    pts.push_back(Point(2,2));
    pts.push_back(Point(3,3));
    pts.clear();
    pts.push_back(Point(0,0));
    pts.push_back(Point(0,1));
    pts.push_back(Point(1,0));
    pts.push_back(Point(2,0));
    pts.push_back(Point(3,0));
    pts.push_back(Point(4,1));
    cout<<s.maxPoints(pts)<<endl;
    return 0;
}
