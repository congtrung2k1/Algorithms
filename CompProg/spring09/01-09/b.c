#include<string.h>
#include<stdio.h>


int setup, daily, shut;

int n;
int f[100002]; // pos means borrow, neg means no use


int main(){

    scanf("%d%d%d", &setup,&daily,&shut);
    scanf("%d", &n);
    int i,j;
    int prev = -1;
    int idx = -1; int num;
    for (i=0;i < n;i++){
        int aa;
        scanf("%d",&aa );
        if (aa)num = 1;
        else num=-1;
        if (aa != prev){
            f[++idx] =num;
        }
        else f[idx]+= num; prev = aa;
    }

    long long total = 0;
    bool has = false;
    for (i=0;i<=idx;i++){
        int cur = f[i];
        int abscur = f[i] < 0 ? -f[i]: cur;
        if (cur < 0 && has){
            long long w =  (long long)abscur * daily;
            if (i != idx && w < setup+shut){
                total += w;
            }
            else {
                has = false;
                total += shut;
            }
        }
        else if (cur > 0) {
            if (! has) total += setup; has=true;
            total += (long long)abscur * daily;
        }
    }

    if (has) total+=shut;
    printf("%lld\n",total);
}


