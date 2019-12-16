#include<stdio.h>
#include<string.h>
#include<limits.h>
typedef long long ll;
int main(){
    int n,k,i,j;
    scanf ("%d%d", &n,&k);
    int len=0;
    ll posrun=0;
    ll max=INT_MIN;
    ll negrun = 0;
    int neglen = 0;
    for (i=0;i <n;i++){ int p;
        scanf("%d", & p);
        posrun += p;
        len++;
        if (posrun < 0){
            neglen=len;
            negrun += posrun;
            posrun=0;
        }
        if (len >= k){
            ll total;
            if (len-neglen >= k){
                len -= neglen; neglen=0;
                negrun=0;
            }
            total = posrun+negrun;
            if (total>max)max=total;
        }

    }printf("%lld\n",max);

}
