#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <iostream>
using namespace std;

int n;

typedef long long ll;

struct ret{
    ll f[2][3][5][7];
};

char str[100];
int len;
char has[41];
ret dp[41];
ret zr;

ret find(int idx){
    if (idx == len){
       // memset(&zr,0,sizeof zr);
        zr.f[0][0][0][0]=1;
        return zr;
    }

    if (has[idx]) return dp[idx];
    
    ret r;
    int a=0, b=0, c=0, d=0;
    memset(&r, 0,sizeof r);
    for (int i = idx; i < len;i++){
        const char ch = str[i];
        a = (a * 10 + ch-'0' )%2;
        b = (b * 10 + ch-'0' )%3;
        c = (c * 10 + ch-'0' )%5;
        d = (d * 10 + ch-'0' )%7;
        ret r2 = find(i+1);
        
        for (int j =0; j < 2; j++){
            for (int k = 0; k < 3; k++){
                for (int l = 0; l < 5; l++){
                    for (int p = 0; p < 7;p++){
              
             // there is a symmetry that results in double counting? 
              r.f[j][k][l][p]+=
                        r2.f[(a+j)%2][(b+k)%3][(c+l)%5][(d+p)%7]
                      +r2.f[(j-a+8)%2][(k-b+12)%3][(l-c+15)%5][(p-d+21)%7];
                    }
                }
            }
        }
    }
     (has[idx])=1;
     return dp[idx]=r;
}

int main(){
    int nu;
    scanf ("%d", & nu); gets(str); int casen=1;
    while (nu--){
        gets(str); len = strlen(str);
        memset(has,0,sizeof has);
        ret r = find(0);
        ll total=0;
    

            for (int k = 0; k < 3; k++){
                for (int l = 0; l < 5; l++){
                    for (int p = 0; p < 7;p++){
                        total += r.f[0][k][l][p];
                    }
                }
            }

            for (int j = 1; j < 2; j++){
                for (int l = 0; l < 5; l++){
                    for (int p = 0; p < 7;p++){
                        total += r.f[j][0][l][p];
                    }
                }
            }
            for (int j = 1; j < 2; j++){
                for (int l = 1; l < 3; l++){
                    for (int p = 0; p < 7;p++){
                        total += r.f[j][l][0][p];
                    }
                }
            }
            for (int j = 1; j < 2; j++){
                for (int l = 1; l < 3; l++){
                    for (int p = 1; p < 5;p++){
                        total += r.f[j][l][p][0];
                    }
                }
            }
        cout <<"Case #"<<casen++ << ": "<<total/2<<endl;
    }
}
