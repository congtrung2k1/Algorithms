#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int xx[99];
int yy[99];
int b;

void tob (int n, int * a){
    memset(a, 0, sizeof(int)*99);
    int idx=0;
    while (n >0){
        a[idx] = n % b;
        n/= b;idx++;
    }

}

int main()
{

    int nu;
    scanf ("%d", &nu);
    while (nu--){
        int cc;
        scanf ("%d", &cc); int x,y;
        scanf ("%d%d%d", &b,&x,&y);
        tob(x, xx); tob(y,yy);
        int i,j;
        for (i=0;i < 99;i++){
            xx[i] = (xx[i] +yy[i]) % b;
        }
        long long sum = 0;
        for (i=98;i >=0;i--){
            sum  = sum * b + xx[i];
        }
        printf("%d %lld\n",cc,sum);
    }
}




