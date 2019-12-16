/*
user: tbhtan31
LANG: C++
TASK: msquare
*/
/**
 * BFS, using bitmask to keep track of visited states.
 */
#include<iostream>
#include<fstream>
#include<cstring>
#include<cstdlib>
#include<set>
#include<vector>
using namespace std;

struct node{
    char a[8];
    char step;
    int previdx;
};

node nodes[40999];
char steps[40999];
set<int> all;
int tmask;
int trans[3][8]={
    {7,6,5,4,3,2,1,0},
    {3,0,1,2,5,6,7,4},
    {0,6,1,3,4,2,5,7}
};

int getmask(char a[8]){
    int m=0;
    int i,j;
    for(i=0;i<8;i++)
        m|=(a[i]<<i*3);
    return m;
}

void transform(char a[8], char b[8], int*t){
    for(int i=0;i<8;i++)
        b[i] = a[t[i]];
}

int main(){
    ifstream in("msquare.in");
    ofstream out("msquare.out");
    int i,j,k;
    char t[8];
    int idx=0,count=1;
    node &first=nodes[0];
    for(i=0;i<8;i++){
        in>>j;
        t[i]=j-1;
        first.a[i]=i;
    }
    tmask=getmask(t);
    first.previdx=-1;
    all.insert(getmask(first.a));
    while(idx<count){
        node&cur=nodes[idx];
        int curmask=getmask(cur.a);
        if(curmask==tmask)break;
        for(i=0;i<3;i++){
            transform(cur.a,t,&trans[i][0]);
            j=getmask(t);
            if(all.find(j)==all.end()){
                all.insert(j);
                node &n=nodes[count++];
                for(j=0;j<8;j++)n.a[j]=t[j];
                n.step='A'+i;
                n.previdx=idx;
            }
        }
        idx++;
    }
    node*cur=&nodes[idx];
    int nsteps=0;
    while(cur->previdx>=0){
        steps[nsteps++]=cur->step;
        cur=&nodes[cur->previdx];
    }
    out<<nsteps;
    for(i=0;i<nsteps;i++)
        out<<(i%60==0?"\n":"")<<steps[nsteps-i-1];
    out<<endl;
    if(!nsteps)out<<endl;
    out.flush();out.close();
    return 0;
}
