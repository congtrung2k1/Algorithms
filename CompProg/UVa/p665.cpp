#include<iostream>
#include<cstdlib>
#include<cstring>
using namespace std;

int N,K;
int p[101];
int w[202];
int weight[101];

int main(){
    int cases; cin>>cases;
    while(cases--){
        cin>>N>>K;
        memset(p,1,sizeof p);
        memset(weight,0,sizeof weight);
        int i,j,numInequal=0;
        for (i=0;i<K;i++){
            int n;
            cin>>n;
            for (j=0;j<n*2;j++){
                cin>>w[j];
            }
            char ch;cin>>ch;
            if (ch=='=')
                for(j=0;j<2*n;j++)p[w[j]]=0;
            else {
                numInequal++;
                int l = (ch == '<'?-1:1);
                int r = (ch == '<'?1:-1);
                for(j=0;j<n;j++){
                    weight[w[j]]+=l;
                    weight[w[j+n]]+=r;
                }
            }
        }
        int found=0;
        int idx=0;
        for(i=1;i<=N;i++){
            if(abs(weight[i])==numInequal && p[i]){found++;idx=i;}
        }
        if(found==1)cout<<idx;
        else cout<<0;
        cout<<endl;
        if(cases)cout<<endl;
    }
}
