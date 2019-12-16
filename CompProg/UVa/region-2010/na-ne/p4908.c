#include<stdio.h>
#include<string.h>

int a[1000];
int b[1000];
int c[101][101];
int n;
int r[99999];
int nr;

void doit()
{
nr=0;    int i,j;
    for (i = 0; i <n;i++){
        for (j=i+1;j<n;j++){
            int m = a[i] * b[j] - a[j]*b[i];
            r[nr++] = m;
        }
    }
}

int main(){
    while(9){
        int k = scanf("%d", &n);
            if (k!=1)break;
        int i,j;
        for (i=0;i<n;i++){
            scanf ("%d", & a[i]);
        }
        for(i=0;i<n;i++){
            scanf ("%d", &b[i]);
        }
        doit();
        if (nr==0) printf("0\n");
        else {
        printf("%d", r[0]);
        for (i=1;i<nr;i++){
            printf(" %d", r[i]);
        }
        printf("\n");
    }}
}

