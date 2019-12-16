#include<iostream>
#include<cstdlib>
#include<cstring>
using namespace std;

int slots[99999];
int N;

int main(){
    while(1){
        cin>>N;
        if(!N)break;
        int i,j,k=0;
        memset(slots,0,sizeof slots);
        bool ok=true;
        for(i=1;i<=N;i++){
            int a,b;
            cin>>a>>b;
            int p = i+b;
            if(p<1||p>N||slots[p]){ok=false;}
            else if(ok){
                slots[p]=a;
                k=max(k,p);
            }
        }
        if(ok){
            int first=0;
            for(i=0;i<=k;i++){
                if(slots[i])
                    cout<<(first++==0?"":" ")<<slots[i];
            }
        }
        else cout<<-1;
        cout<<endl;
    }
}
