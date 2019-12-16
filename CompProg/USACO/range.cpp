/*
LANG: C++
TASK: range
*/
/**
 * Dynamic programming by keep tracking of the biggest square at (i,j) and the
 * consequtive vertical run of 1's in each column.
 */
#include<iostream>
#include<fstream>
#include<cmath>
#include<cstdlib>
#include<vector>
#include<cstring>
using namespace std;

int vrun[252]; // vrun[j] = consequtive # of vertical 1's in col j ending at current row
int maxsize[252]; // maxsize[j] = size of biggest sq at col j, current row
int sizes[252];
int N;

int main(){
    ifstream in("range.in");
    ofstream out("range.out");
    int i,j;
    in>>N;
    for(i=1;i<=N;i++){
        int hrun=0; // current row's consequtive 1's
        int prevmaxsize=0;//previous row's maxsize
        for(j=1;j<=N;j++){
            char ch;in>>ch;
            int mask=(-(int)(ch-'0'));
            hrun=(hrun+1)&mask;
            int newvrun=(vrun[j]+1)&mask;
            int size=min(hrun,min(newvrun,1+prevmaxsize));
            vrun[j]=newvrun;
            prevmaxsize=maxsize[j];
            maxsize[j]=size;
            sizes[size]++;
        }
    }
    // top-down cumulative propagation of counts
    for(i=N-1;i>=2;i--)
        sizes[i]+=sizes[i+1];
    for(i=2;i<=N&&sizes[i];i++){
        out<<i<<" "<<sizes[i]<<endl;
    }
    out.flush();
}

