  struct Interval {
      int start;
      int end;
      Interval() : start(0), end(0) {}
      Interval(int s, int e) : start(s), end(e) {}
      inline bool operator==(const Interval&it)const{
        return it.start==start&&it.end==end;
      }
  };
#include<iostream>
#include<vector>
using namespace std;
class Solution {
public:
    int binsearch(const vector<Interval>&v, int a){
        int hi=v.size()-1,lo=0,m=0;
        while(hi>=lo){
            m=(hi+lo)/2;
            if(v[m].start<a){
                lo=m+1;
            }else if(v[m].start>a){
                hi=m-1;
            }
            else return m;
        }
        return m;
    }
    inline bool inside(const Interval&it,int a){
        return it.start<=a&&a<=it.end;
    }
    vector<Interval> insert(vector<Interval> &v, Interval newInterval) {
        const int s=newInterval.start,e=newInterval.end;
        const int n=v.size();
        vector<Interval> r;
        int i,j;
        int i1=binsearch(v,s), i2=binsearch(v,e);
        int s1=-1,e1=n; // preserve v[...s1] and v[e1...]

        // find ending elem to merge with or to insert before
        for(i=min(n-1,i2+1);i>=max(0,i2-1);i--){
            if(inside(v[i],e)){e1=i+1;newInterval.end=v[i].end;break;}
            if(e<v[i].start){e1=i;newInterval.end=e;}
        }
        for(i=max(0,i1-1);i<=min(n-1,i1+1);i++){
            if(inside(v[i],s)){s1=i-1;newInterval.start=v[i].start;break;}
            if(s>v[i].end){s1=i;newInterval.start=s;}
        }

        for(i=0;i<=s1;i++)
            r.push_back(v[i]);
        r.push_back(newInterval);
        for(i=e1;i<v.size();i++)
            r.push_back(v[i]);

        return r;
    }
};
typedef Interval it;
void check(const vector<Interval>&v,it n,const vector<Interval> &a){
    Solution s;
    cout<<((a)==s.insert(const_cast<vector<Interval> &>(v), n))<<endl;
}
int main(){
    check({}, it(1,2), {it(1,2)});
    check({it(4,5)}, it(1,2), {it(1,2),it(4,5)});
    check({it(4,5)}, it(6,6), {it(4,5),it(6,6)});
    check({it(4,5)}, it(5,6), {it(4,6)});
    check({it(4,5)}, it(1,6), {it(1,6)});
    check({it(4,5)}, it(1,5), {it(1,5)});
    check({it(4,5),it(6,7)}, it(1,5), {it(1,5),it(6,7)});
    check({it(4,5),it(6,7)}, it(1,6), {it(1,7)});
    check({it(4,5),it(6,7)}, it(5,6), {it(4,7)});
    check({it(4,5),it(6,7)}, it(6,6), {it(4,5),it(6,7)});
    check({it(4,5),it(6,7)}, it(6,7), {it(4,5),it(6,7)});
    check({it(4,5),it(6,7)}, it(4,5), {it(4,5),it(6,7)});
    check({it(4,5),it(6,7),it(8,9),it(10,11),it(12,13),it(13,14)}, it(1,90), {it(1,90)});
}
