/*
Algorithm:
Straightforward

Gotchas:
- Output each line of decoded data with a max of 80 hex digits each
*/

#include<stdio.h>
#include<string.h>

char  outb[5100*130];
int outlen ;

char hex[5100*130*3];
char inb[5010];
int inlen;


void doit(){
    int i,j;
    for (i=0;i <inlen;i++){
        char  c = inb[i];
        if (c  & 128){
            for (j = 0; j < (c&127)+3; j++){
                outb[outlen +j] =  inb[i+1];
            }
            outlen += j; i++;

        }

        else{
            int l = c+1;
            memcpy(&outb[outlen], &inb[i+1], l); 
            i += l;
            outlen += l; 
        }
    }
}

void print()
{
    int i,j; j=0;
    for (i=0;i<outlen;i++){
        int c = outb[i];
       const  char * p = "0123456789ABCDEF";
        hex [j++] = p[(c >> 4) & 15];
        hex[j++] = p[c&15];
        if ( (i+1) % 40  == 0) hex[j++]='\n';
    }
    if (hex[j -1] != '\n') hex[j++]='\n';

hex[j]=0;
    printf("%s", hex);
}

int main()
{
    int nu;
    scanf("%d", &nu);
    while (nu--){ int cc;
        scanf("%d%d", &cc, & inlen);
        int read = 0;
        while (read < inlen){
            char s[999];
            gets(s);
            int i,j; int v = -1;
            for (i=0;s[i];i++){
            
                 char c = s[i]; int k = -1;
                if ('0' <= c && c<='9'){
                    k = c-'0';
                }
                else if ('A' <= c && c <= 'Z'){ k = c-'A'+10; }
                else continue;
                if (v==-1){ v =  k; }
                else {
                        v = v*16 + k;
                        inb[read++] = v; v=-1;
                    }
            }
        }outlen=0;
        doit();printf("%d %d\n", cc, outlen );
        print();
    }
}


