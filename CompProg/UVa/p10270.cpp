/**
 * Solved using Brute force backtracking with some heuristic.
 * The backtracking is not fast enough, thus the solutions are precalculated.
 * The idea is to fill the area from top-down. The heuristic is to assume a
 * square of around N/2 size and 2 smaller ones by its sides.
 * A way to improve speed may be to use bitmask.
 */
#include<iostream>
#include<cstdlib>
#include<cstring>
#include<vector>
#include<cmath>
#include<cassert>
using namespace std;
#define DEBUG 0

int primes[]={2,3,5,7,11,13,17,19,23,29,31,37,41,43,47};
int primesoln[51][200]={
{2,1,1,1,2,1,1,1,2,1,2,2,1},
{3,1,1,1,2,1,1,1,2,1,3,1,1,2,2,2,1,3,1},
{5,1,1,2,3,1,2,1,3,2,5,1,1,5,2,1,3,3,3,1,5,1,2,5,1},
{7,1,1,4,5,1,3,1,5,3,5,4,2,7,4,1,4,5,1,7,5,1,4,6,2,6,6,2},
{11,1,1,5,6,1,3,1,6,3,9,1,3,6,4,4,10,4,2,4,6,2,10,6,2,4,8,4,8,8,4,1,9,3},
{13,1,1,7,8,1,6,1,8,6,8,7,2,10,7,4,7,8,1,7,9,3,10,11,1,11,11,3,7,12,2,9,12,2},
{17,1,1,9,10,1,8,1,10,8,10,9,2,12,9,4,16,9,2,9,10,1,9,11,3,16,11,2,12,13,1,13,13,5,9,14,4},
{19,1,1,9,10,1,5,1,10,5,15,1,5,10,6,6,16,6,4,6,10,4,16,10,2,18,10,2,10,12,2,12,12,8,6,14,6,1,15,5},
{23,1,1,12,13,1,11,1,13,11,13,12,2,15,12,5,20,12,4,12,13,1,12,14,3,20,16,1,21,16,3,12,17,7,19,17,2,19,19,5},
{29,1,1,15,16,1,14,1,16,14,16,15,2,18,15,5,23,15,7,15,16,1,15,17,3,15,20,3,18,20,3,21,20,2,21,22,1,22,22,8,15,23,7},
{31,1,1,16,17,1,15,1,17,15,17,16,3,20,16,6,26,16,6,16,17,1,16,18,1,16,19,4,20,22,1,21,22,1,22,22,10,16,23,6,16,29,3,19,29,3},
{37,1,1,19,20,1,18,1,20,18,20,19,2,22,19,5,27,19,11,19,20,1,19,21,3,19,24,8,27,30,3,30,30,8,19,32,6,25,32,1,26,32,1,25,33,5},
{41,1,1,23,24,1,18,1,24,18,24,19,7,31,19,11,19,24,3,22,24,2,22,26,1,23,26,5,28,26,3,19,27,4,28,29,2,30,29,1,30,30,12,19,31,11},
{43,1,1,21,22,1,11,1,22,11,33,1,11,22,12,12,34,12,10,12,22,10,34,22,2,36,22,8,22,24,8,30,24,6,30,30,14,12,32,12,24,32,6,1,33,11,24,38,6},
{47,1,1,24,25,1,23,1,25,23,25,24,2,27,24,5,32,24,5,37,24,11,24,25,1,24,26,3,24,29,8,32,29,5,32,34,3,35,34,1,36,34,1,35,35,13,24,37,11},
{0}
};
struct rect{int x,y,size;};
int col[51];//number of cells filled from top down.
int N, bestsize;
vector<rect> rects;

void print(const vector<rect>&rects){
    int grid[51][51];
    int i,j,k;
    for(i=0;i<N;i++)
        for(j=0;j<N;j++)
            grid[i][j]=' ';
    #if DEBUG
    cout<<N<<",size: "<<rects.size()<<endl;
    #endif
    primesoln[N][0]=N;
    for(i=0;i<rects.size();i++){
        const rect&r = rects[i];
        primesoln[N][i*3+1]=r.x+1;
        primesoln[N][i*3+2]=r.y+1;
        primesoln[N][i*3+3]=r.size;
        primesoln[N][i*3+4]=-1;
        //cout<<r.x+1<<","<<r.y+1<<","<<r.size<<(i==rects.size()-1?"":",");
        for(j=r.x;j<r.x+r.size;j++)
            for(k=r.y;k<r.y+r.size;k++){
                assert(grid[k][j]==' ');
                grid[k][j]=i+'A';
            }
    }
    #if DEBUG
    for(i=0;i<N;i++)
        for(j=0;j<N;j++)
            cout<<(char)(grid[i][j])<<(j==N-1?"\n":"");
    #endif
}

int find(int arealeft){
    int i,j,k,maxsize=0;
    if(rects.size()==bestsize){
        return !arealeft;
    }
    int colidx=0;
    for(i=1;i<N;i++)
        if(col[colidx]>col[i])colidx=i;
    for(i=colidx;i<N;i++){
        if(maxsize+1<=N-col[colidx] && col[i]==col[colidx])maxsize++;
        else break;
    }
    maxsize=min(maxsize,N-1);
    rect tmp;
    rects.push_back(tmp);
    rect&r=rects.back();
    r.size=maxsize;
    r.x = colidx;
    r.y = col[colidx];
    for(j=colidx;j<colidx+maxsize;j++){
        col[j]+=maxsize;
    }
    for(i=maxsize;i>=1;i--){
        if(find(arealeft-i*i))return 1;
        for(j=colidx;j<colidx+i-1;j++){
            col[j]--;
        }
        col[colidx+i-1]-=i;
        r.size--;
    }
    rects.pop_back();
    return 0;
}


int main(){
    int i,j,k,cases;
    #if DEBUG
    int len=sizeof primes / sizeof primes[0];
    int prevsize=4;
    cases=len;
    #else
    cin>>cases;
    #endif
    while(cases--){
        #if DEBUG
        int idx = len-cases-1;
        N=primes[idx];
        int solved=0;
        for(bestsize=prevsize;!solved;bestsize++){
            for(i=(N-1)/2;i<=min(N-1,N/2+3);i++){
                for(j=min(i,N-i);j>=1;j--){
                    rects.clear();
                    memset(col,0,sizeof col);
                    rect r;
                    r.x=0;r.y=0;r.size=i;
                    rects.push_back(r);
                    r.x=i;r.y=0;r.size=j;
                    rects.push_back(r);
                    r.x=0;r.y=i;r.size=j;
                    rects.push_back(r);
                    for(k=i;k<i+j;k++)
                        col[k] += j;

                    for(k=0;k<j;k++)
                        col[k] += j;

                    for(k=0;k<i;k++)
                        col[k] += i;

                    solved=find(N*N-i*i-2*j*j);
                    if(solved){i=99;break;}
                }
            }
        }
        prevsize=rects.size();
        print(rects);
        #else
        cin>>N;
        for(i=0;primesoln[i][0];i++){
            if(N%primesoln[i][0]==0)break;
        }
        int a=i;
        int f=N/primesoln[i][0];
        k=0;
        for(i=1;primesoln[a][i];i+=3,k++);
        cout<<k<<endl;
        for(i=1;primesoln[a][i];i+=3)
            cout<<(primesoln[a][i]-1)*f+1<<" "<<(primesoln[a][i+1]-1)*f+1<<" "<<primesoln[a][i+2]*f<<endl;
    #endif
    }
    #if DEBUG
    for (i=1;i<=50;i++){
        if(!primesoln[i][0])continue;
        cout<<"{"<<primesoln[i][0];
        for(j=1;primesoln[i][j]>=0;j++)
            cout<<","<<primesoln[i][j];
        cout<<"}"<<endl;
    }
    #endif
}
