/*
user: tbhtan31
LANG: C++
TASK: comehome
*/
/**
 * Floyd-warshal. Tricky part is there may be self-loops.
 */
#include<iostream>
#include<fstream>
#include<cstring>
#include<cstdlib>
#include<queue>
#include<cmath>
using namespace std;

int dist[60][60];
int P;
const int inf = 1<<29;

inline int toidx(char a){
    if('a'<=a&&a<='z')return a-'a';
    return a-'A'+26;
}

inline char toletter(int idx){
    if(idx<=25)return 'a'+idx;
    return 'A'+(idx-26);
}

int main(){
    ifstream in("comehome.in");
    ofstream out("comehome.out");
    int i,j,N=60;
    in>>P;
    for(i=0;i<60;i++)
        for(j=0;j<60;j++)
            dist[i][j]=i==j?0:inf;
    for (i=0;i<P;i++){
        int d;
        char a,b;in>>a>>b>>d;
        int aa=toidx(a); int bb=toidx(b);
        dist[aa][bb]=dist[bb][aa]=min(dist[aa][bb],d);
    }
    int k;
    for (i=0;i<N;i++)
        for(j=0;j<N;j++)
            for(k=0;k<N;k++)
                dist[j][k]=min(dist[j][k],dist[j][i]+dist[i][k]);
    int ans,mindist=inf;
    for(i=0;i<N;i++){
        int d=dist[toidx('Z')][i];
        if(d<mindist&&d&&i>=26){
            mindist=d;
            ans=i;
        }
    }
    out<<toletter(ans)<<' '<<mindist<<endl;
    out.flush();out.close();
    return 0;
}
