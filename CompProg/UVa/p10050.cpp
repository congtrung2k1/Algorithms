#include<iostream>
#include<cstring>
using namespace std;

char ok[4000];

int main(){
    int N,P,cases;
    cin>>cases;
    while(cases--){
        cin>>N>>P;
        int i,j;
        int nok=0;
        memset(ok,0,sizeof ok);
        for(i=0;i<P;i++){
            int a;
            cin>>a;
            for(j=a-1;j<N;j+=a)
                if(!ok[j] && j%7 < 5){
                    ok[j]=1; nok++;
                }
        }
        cout<<nok<<endl;
    }
}
