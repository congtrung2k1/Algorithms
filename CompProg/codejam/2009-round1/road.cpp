/**
 * Algorithm:
 * Dijkstra's
 */
#include<iostream>
#include<vector>
#include<algorithm>
#include<stdlib.h>
#include<string.h>
#include<assert.h>
using namespace std;
struct node{
    int time;
    int r, c; // row/col 
};
vector<node> q;

int rows, cols; 
int waitV[220][220]; // waiting time for vertical 
int waitH[220][220]; // waiting time for horizontal
int tt[220][220]; // time of cycle
char visited[200][200];

class comp1{
public:bool operator()(const node&a, const node&b) const{
    return a.time>b.time;
}
};
comp1 comp;

int find(){
    node start;
    start.time=start.r=start.c=0;
    q.clear();
    q.push_back(start);
    bool found=false;
    while(q.size()){
        start = q.front(); pop_heap(q.begin(),q.end(),comp);
        q.pop_back();
        if (visited[start.r][start.c]) continue;
        visited[start.r][start.c] = 1;
        if (start.r == rows && start.c == cols){ found=true; break;}
        int cond1,cond2,delta;
        if (start.c%2==0) // even
        {
            cond1 = start.c>0;
            cond2 = start.c<cols;
            delta = 1;
        }else{
            cond1 = start.c<cols;
            cond2 = start.c>0;
            delta = -1;
        }

            // can move right cross street to next block
            // or move left cross block on same block
            node nw=start;
            if(cond1){
                nw.time +=2; // move left
                nw.c -= delta;
                q.push_back(nw); push_heap(q.begin(),q.end(),comp);
            }
            if(cond2){
                nw=start; nw.c += delta;
                int t=tt[start.r][start.c];
                int vv = waitV[start.r][start.c];
                int hh = waitH[start.r][start.c];
                t =  ((start.time - t)) % (vv+hh);
                if (t >= vv) nw.time += 1;
                else nw.time += 1 + vv-t;
                q.push_back(nw); push_heap(q.begin(),q.end(),comp);
            }

        if (start.r%2==0) // even
        {
            cond1=start.r>0;
            cond2=start.r<rows;
            delta = 1;
        }else{
            cond1 = start.r<rows;
            cond2 = start.r>0;
            delta = -1;
        }

        nw=start;
            if(cond1){
                nw.time +=2;
                nw.r -=delta;
                q.push_back(nw); push_heap(q.begin(),q.end(),comp);
            }
            if(cond2){
                 nw=start; nw.r += delta;
                int t=tt[start.r][start.c];
                int vv = waitV[start.r][start.c];
                int hh = waitH[start.r][start.c];
                t =  ((start.time - t)) % (vv+hh);
                if (t >= vv) nw.time += 1+ hh+vv-t;
                else nw.time += 1 ;
                q.push_back(nw); push_heap(q.begin(),q.end(),comp);
            }
    }
    assert(found);
    return start.time;
}

int main(){
    int nu; int casen=1;
    cin >>nu;
    while(nu--){
        int n,m; // row col
        cin>>n>>m;
        int i;
        for (i=n-1;i >=0;i--){ // CAREFUL! Starts from the last row!
            for (int j =0; j < m;j++){
            int v,h,t;
            cin>>v>>h>>t;
            waitV[i*2][j*2] = v;
            waitV[i*2][1+j*2] = v;
            waitV[1+i*2][j*2] = v;
            waitV[1+i*2][1+j*2] = v;
            waitH[i*2][j*2] = h;
            waitH[1+i*2][j*2] = h;
            waitH[i*2][1+j*2] = h;
            waitH[1+i*2][1+j*2] = h;
            t %= (h+v);
            t -= h+v;
            tt[i*2][j*2] = t;
            tt[i*2][1+j*2] = t;
            tt[1+i*2][j*2] = t;
            tt[1+i*2][1+j*2] = t;
            }
        }
        memset(visited,0,sizeof visited);
        rows = n*2-1;
        cols = m*2-1;
        cout << "Case #"<<casen++<<": "<<find()<<endl;
    }
}


