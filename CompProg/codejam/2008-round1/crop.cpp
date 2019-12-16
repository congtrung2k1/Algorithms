#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int x[100005];
int y[100005];
int n;
int buck[3*3];
typedef long long ll;
int main(){
    int nu;
    scanf("%d",&nu); int casen=1;
    while(nu--){
        int a,b,c,d,x0,y0,m;
        memset(buck,0,sizeof buck);
        scanf("%d%d%d%d%d%d%d%d", &n,&a,&b,&c,&d,&x0,&y0,&m);
        x[0] = x0;
        y[0] = y0;
        for (int i = 1; i < n;i++){
            x[i]= ((ll)a * x[i-1] + b ) % m ;
            y[i]= ((ll)c * y[i-1] + d ) % m ;
        }
        for (int i = 0; i < n;i++){
        
            buck[(x[i]%3)*3+y[i]%3]++;
        }
        long long sum=0;
        for (int i = 0; i < 9;i++){
                sum += (ll)buck[i]*(buck[i]-1)*(buck[i]-2)/6;
        }
        for (int i = 0; i < 9;i++)
            for (int j =i+1; j < 9; j ++){
                for (int k = j+1; k < 9; k++){
                    if ( (k/3 + i/3 + j/3 ) % 3 == 0 &&
                         (k%3 + i%3 + j%3)%3==0)
                 sum += (ll)buck[i]*buck[k]*buck[j];
                }
            }
        printf("Case #%d: %lld\n", casen++, sum);
    }

}
