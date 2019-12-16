/**
 * Algorithm:
 * Is there one?
 *
 * */

#include<string.h>
#include<stdio.h>

char out[10][200]; // pre-calc each triangle, just for fun
int len=0;

void gen(char *out,int a)
{

    int k;
    int i,j; len=0;
        for (j=0;j<a;j++){
            for (k=0;k <= j; k++){
                out[len++] = j+'1';
            }
            out[len++]='\n';
        }
        for (j=a-2; j >= 0;j--){
        
            for (k=0;k <= j; k++){
                out[len++] = j+'1';
            }
            out[len++]='\n';
        }

    out[len]=0;
}

void p(int a,int f){
    int i;
    for (i=0;i<f;i++){
        printf("%s", &out[a][0]); 
        if (i!=f-1) printf("\n");
    }
}

int main()
{
    for (int j=0;j < 9;j++) gen(&out[j+1][0], j+1);
        int 
            nu;
        scanf("%d",&nu);
        int s=0;
    while (nu--){ int a,f;
        if (s) printf("\n"); s=1;
        int k=  scanf ("%d%d", &a,&f );
        p(a,f);
    }
}
