/*
user: tbhtan31
LANG: C++
TASK: milk2
*/
#include<iostream>
#include<fstream>
#include<cstring>
#include<cstdlib>
using namespace std;

struct range{
    int start,end;
};
range r[5555];
int N;

int comp(const void*a, const void *b){
    return ((range*)a)->start - ((range*)b)->start;
}

int main(){
    ifstream in("milk2.in");
    ofstream out("milk2.out");
    in>>N;
    int i,j;
    for (i=0;i<N;i++){
        in>>r[i].start>>r[i].end;
    }
    qsort(r,N,sizeof r[0],comp);
    int maxyes=0,maxno=0;
    int start=r[0].start,end=r[0].end;
    for (i=0;i<N;i++){
        range &cur=r[i];
        if(start<=  cur.start && cur.start <= end){
            end=max(end,cur.end);
            maxyes=max(maxyes,end-start);
        }
        else{
            maxno=max(maxno,cur.start-end);
            maxyes=max(maxyes,cur.end-cur.start);
            start=cur.start; end=cur.end;
            }
    }
    out<<maxyes<<' '<<maxno<<endl;
    out.flush();out.close();
    return 0;
}
