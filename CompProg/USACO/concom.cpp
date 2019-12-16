/*
user: tbhtan31
LANG: C++
TASK: concom
*/
#include<iostream>
#include<fstream>
#include<cstdlib>
#include<cstring>
using namespace std;

int per[101][101]; // A owns per[A][B]% of B
int con[101][101]; // con[A][B] == true if A controls B
int N=0;

int main(){
    ifstream in("concom.in");
    ofstream out("concom.out");
    int count;
    in>>count;
    int i,j;
    for(i=1;i<=count;i++){
        int a,b,p;in>>a>>b>>p;
        per[a][b]=p;
        if(p>50)con[a][b]=1;
        N=max(N,max(a,b));
    }
    int changed=0;
    int p[101];
    do{
        changed=0;
        for (i=1;i<=N;i++){
            con[i][i]=1;
            memset(p,0,sizeof p);
            for(j=1;j<=N;j++){
                if(!con[i][j])continue;
                for (int k=1;k<=N;k++){
                    p[k] += per[j][k];
                }
            }
            for(j=1;j<=N;j++){
                if(!con[i][j] && p[j]>50)con[i][j]=changed=1;
            }

        }
    }while(changed);
    for(i=1;i<=N;i++){
        for(j=1;j<=N;j++)
            if(i!=j&&con[i][j])
                out<<i<<" "<<j<<endl;
    }
    out.close();
    return 0;
}
