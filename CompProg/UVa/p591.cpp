#include<iostream>
using namespace std;

int a[1000];

int main(){
    int c=1,n;
    while(1){
        cin>>n; if(!n)break;
        int i,j,s=0;
        for(i=0;i<n;i++){
            cin>>a[i];
            s+=a[i];
        }
        int ans=0;
        for(i=0;i<n;i++){
            ans+=max(0,a[i]-s/n);
        }
        cout<<"Set #"<<c++<<endl<<"The minimum number of moves is "<<ans<<"."<<endl<<endl;
    }
}
