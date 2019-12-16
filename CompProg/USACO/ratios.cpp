/*
user: tbhtan31
LANG: C++
TASK: ratios
*/
/**
 * Pure brute force. Can't believe this is the ACM finals.
 */
#include<iostream>
#include<fstream>
#include<cstring>
#include<cstdlib>
using namespace std;

int g[3];
int r[3][3];

int main(){
    ifstream in("ratios.in");
    ofstream out("ratios.out");
    int i,j,k;
    for(i=0;i<3;i++)
        in>>g[i];
    for(i=0;i<3;i++)
        for(j=0;j<3;j++)
            in>>r[i][j];
    int ans=1<<30,a,b,c,bestsum=1<<30;
    for (i=0;i<100;i++)
        for(j=0;j<100;j++)
            for(k=0;k<100;k++){
                int ratio=0;
                for (int p=0;p<3;p++){
                    int z = i*r[0][p] + j*r[1][p] + k*r[2][p];
                    if(g[p]==0){
                        if(!z)continue;
                    }
                    else if(z&&z%g[p]==0) {
                        if(ratio<=0){
                            ratio=z/g[p];continue;
                        }
                        else if(ratio==z/g[p])
                            continue;
                    }
                    ratio=-1;break;
                }
                if(ratio>=0&&bestsum>i+j+k){
                    ans=ratio;
                    bestsum=i+j+k;
                    a=i;b=j;c=k;
                }
            }
    if(ans> (1<<29))out<<"NONE"<<endl;
    else out<<a<<" "<<b<<" "<<c<<" "<<ans<<endl;
    out.flush();out.close();
    return 0;
}
