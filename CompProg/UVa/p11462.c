/**
Algorithm:
Merge sort with custom input/output parsing

Qsort and bucket sorting will be sufficient
but qsort might be too slow if the judge wants to screw you up

Bucket sorting is most efficient but I wanted to practice writing
merge sort =p

I think scanf/printf might be efficient enough too...

*/
#include<string.h>
#include<stdio.h>

char in[9000000];
char num[2000001];
char tmp[2000001];


void ms(int start, int end)
{
    int k = end-start+1;
    if (k <= 1){
        return;
    }
    if (k <= 2){
        if (num[start] > num[end]) {
            char t = num[start];
            num[start] = num[end];
           num[end] = t;

        }return;
    }

    int mid = (end+start)/2;
    ms(start, mid); ms(mid+1,end);

    int i=start;
    int i1=start, i2=mid+1;
    while (i1 <= mid && i2 <= end){
        if (num[i1] < num[i2]){
            tmp[i++] = num[i1++];
        }
        else tmp[i++]=num[i2++];
    }
    while (i1 <=mid){
        tmp[i++] = num[i1++];
    }
    while (i2<=end){
        tmp[i++] = num[i2++];
    }
    memcpy(&num[start],&tmp[start], sizeof(char)*k);

}


int main(){
    while (9){
        int n;
        scanf("%d",&n);
        if (n==0)break;
        char s[2]; gets(s);
            gets(in);
        int i=0;
        int x = 0; int v =0;
        for (i=0;in[i];i++){
            char c =in[i];
            if ('0'<=c &&c<='9'){
                int d = c-'0';
                v = v*10 + d;
            }else if(v) {num[x++]=v; v=0;}
        }
        if (v) num[x++]=v;
        ms(0,x-1); int pp=0;
        for(i=0;i< x;i++){
            v = num[i]; int l = 0;
            while (v){ v/=10;l++; } v = num[i];
            int newl=l;
            while (v){ in[pp+l-1]='0'+(v%10);v/=10; l--; }

            pp+=newl;
            in[pp++]=' ';
        }
        in[pp-1]=0;
        printf("%s\n", in);

    }
}



