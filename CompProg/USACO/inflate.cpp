/*
user: tbhtan31
LANG: C++
TASK: inflate
*/
#include<iostream>
#include<fstream>
#include<cstring>
#include<cstdlib>
#include<queue>
#include<cmath>
using namespace std;

struct cat{int points,len;};
cat cats[10001];
int maxpts[10001];
int N,M;

int main(){
    ifstream in("inflate.in");
    ofstream out("inflate.out");
    int i,j;
    in>>M>>N;
    for (i=0;i<N;i++){
        in>> cats[i].points >> cats[i].len;
    }
    for(i=1;i<=M;i++){
        int m=maxpts[i-1];
        for(j=0;j<N;j++){
            if(cats[j].len<=i){
                m=max(m,cats[j].points+maxpts[i-cats[j].len]);
            }
        }
        maxpts[i]=m;
    }
    out<<maxpts[M]<<endl;
    out.flush();out.close();
    return 0;
}
