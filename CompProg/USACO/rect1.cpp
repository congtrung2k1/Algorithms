/*
user: tbhtan31
LANG: C++
TASK: rect1
*/
#include<iostream>
#include<fstream>
#include<cstring>
#include<cstdlib>
#include<cmath>
#include<vector>
#include<cassert>
using namespace std;
int A,B,N;
struct rect{int lx,ux,ly,uy,c;};
vector<rect> rects1,rects2,*r1=&rects1,*r2=&rects2;
int area[3000];

bool valid(const rect&r){
    return r.lx < r.ux && r.ly < r.uy;
}

void perform(rect&r){
    int i,j;
    swap(r1,r2);
    r2->clear();

    for(i=0;i<r1->size();i++){
        rect &cur = (*r1)[i];

        // if the two rects don't intersect, then skip.
        if (cur.ux <= r.lx || cur.lx >= r.ux || cur.uy <= r.ly || cur.ly >= r.uy)
        {   r2->push_back(cur);
            continue;
        }
        rect left = cur;
        left.ux = r.lx;
        left.ly = max(left.ly, r.ly);
        left.uy = min(left.uy, r.uy);
        if(valid(left))r2->push_back(left);

        rect right = left;
        right.lx = r.ux;
        right.ux = cur.ux;
        if(valid(right))r2->push_back(right);

        rect top = cur;
        top.ly = r.uy;
        if(valid(top))r2->push_back(top);

        rect bot = cur;
        bot.uy = r.ly;
        if(valid(bot))r2->push_back(bot);
    }
    r2->push_back(r);
}

int main(){
    ifstream in("rect1.in");
    ofstream out("rect1.out");
    int i,j;
    in>>A>>B>>N;
    rect r;r.lx=r.ly=0;r.ux=A;r.uy=B;r.c=1;
    perform(r);
    for (i=0;i<N;i++){
        in >>r.lx>>r.ly>>r.ux>>r.uy>>r.c;
        perform(r);
    }
    for(i=0;i<r2->size();i++){
        rect&r=(*r2)[i];
        area[r.c]+=(r.ux-r.lx)*(r.uy-r.ly);
    }
    for (i=0;i<3000;i++)
        if (area[i])
            out<<i<<" "<<area[i]<<endl;
    out.flush();out.close();
    return 0;
}
