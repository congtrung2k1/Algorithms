/*
user: tbhtan31
LANG: C++
TASK: cowtour
*/
#include<iostream>
#include<fstream>
#include<cstring>
#include<cstdlib>
#include<queue>
#include<cmath>
using namespace std;

struct pos{int x,y;};
pos allpos[151];
double dist[151][151];
int N;
int visited[151];
double maxdist[152];
const double inf=1<<30;

void color(int start, int  c){
    int i,j;
    visited[start]=c;
    for (i=0;i<N;i++){
        if (dist[start][i]>=inf || visited[i])continue;
        color(i,c);
    }
}

int main(){
    ifstream in("cowtour.in");
    ofstream out("cowtour.out");
    int i,j;
    in>>N;
    for (i=0;i<N;i++){
        in>>allpos[i].x>>allpos[i].y;
    }
    for(i=0;i<N;i++)
        for(j=0;j<N;j++){
            char ch;in>>ch;
            if (ch=='1'){
                double dx=allpos[i].x-allpos[j].x;
                double dy=allpos[i].y-allpos[j].y;
                dist[i][j]=sqrt(dx*dx+dy*dy);
            }else dist[i][j]=inf;
            if (i==j)dist[i][j]=0;
        }
    int k;
    for (i=0;i<N;i++)
        for(j=0;j<N;j++)
            for(k=0;k<N;k++)
                dist[j][k]=min(dist[j][k],dist[j][i]+dist[i][k]);
    k=1;
    for (i=0;i<N;i++){
        if(!visited[i]){color(i,k++);}
    }
    for(i=0;i<N;i++){
        double& d = maxdist[visited[i]];
        for(j=0;j<N;j++)
            for (k=0;k<N;k++)
                if(visited[j]==visited[k])
                    d=max(d,dist[j][k]);
    }
    double ans=1e10;
    for (i=0;i<N;i++){
        double d1=0,d2;
        for (j=0;j<N;j++){
            if(visited[i]==visited[j])
                d1=max(d1,dist[i][j]);
        }
        for(j=0;j<N;j++){
            if(visited[j]==visited[i])continue;
            d2=0;
            for (k=0;k<N;k++){
                if(visited[k]==visited[j])
                    d2=max(d2,dist[j][k]);
            }
            double dx=allpos[i].x-allpos[j].x;
            double dy=allpos[i].y-allpos[j].y;
            double dd = sqrt(dx*dx+dy*dy);
            ans=min(ans,max(dd+d1+d2,max(maxdist[visited[i]],maxdist[visited[j]])));
        }
    }
    char s[100];
    sprintf(s,"%.6f",ans);
    out<<s<<endl;
    out.flush();out.close();
    return 0;
}
