#include<iostream>
#include<cstring>
using namespace std;

char taken[3001];

int main(){
    int i,j;
    int N;
    while(cin>>N){
        memset(taken,0,sizeof taken);
        int left=N-1;
        int prev=0;
        for(i=0;i<N;i++){
            cin>>j;
            int d=abs(prev -j);
            if(i){
                if(d>=1&&d<=N-1){
                    if(!taken[d]){taken[d]=1;left--;}
                }
            }
            prev=j;
        }
        cout<<(left==0?"Jolly":"Not jolly")<<endl;
    }
}
