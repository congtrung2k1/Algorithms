#include<iostream>
#include<cmath>
#include<cstdlib>
using namespace std;
int vt, v0;
int main(){
    while(1){
        cin>>vt>>v0;
        if(!vt)break;
        int i,j,ans=0,num=0;
        double maxlen=0;
        for(i=1;i<=vt/v0;i++){
            double d = i*.3*sqrt(vt/1.0/i-v0);
            if(abs(d-maxlen)<0.00000001)num++;
            else if (d>maxlen){
                maxlen=d;
                num=0;
                ans=i;
            }
        }
        if(num)ans=0;
        cout<<ans<<endl;
    }
}