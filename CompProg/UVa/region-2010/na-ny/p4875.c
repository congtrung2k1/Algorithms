#include<stdio.h>
#include<stdlib.h>
#include<string.h>

char inb[99999];
char outb[99999];
int inlen;
int outlen;

void compress(char c, int len)
{
    outb[outlen++] = 128|(len-3);
    outb[outlen++] = c;
}

void nonrun(int startidx, int len)
{
    outb[outlen++] = len-1;
    for (int i = 0; i < len; i++)
        outb[outlen++] = inb[startidx+i];
}

int countrun(int start)
{
    char prev = inb[start];
    int c = 1;
    for (int i =1+ start; c<130&&i < inlen;i++){
        char cur=inb[i];
        if (prev==cur){ c++; }
        else break;
    }
    return c;
}

void doit()
{
    int i,j, runc=0;
    int runstart = 0;
    for (i=0;i< inlen;){
        int r=countrun(i);        
        if (r >= 3) {
            if (runc) nonrun(runstart, runc);
            runc=0;
            compress(inb[i], r);
            i += r;
            runstart = i;
            continue;
        }
        runc++;
        if (runc==128) {
            nonrun(runstart, runc);
            runc=0;
            runstart += 128;
        }
        i++;

    }
    if (runc) nonrun(runstart,runc);
}

        char out[99999];
void print(int cc)
{
        printf("%d %d\n",cc, outlen);
        int i=0;
        int outi = 0;
        for (; i < outlen;i++){
            char *s = "0123456789ABCDEF";
            out[outi ++] = s[(outb[i] >> 4 )& 15];
            out[outi++] = s[outb[i] & 15];
            if ((i+1) % 40==0) out[outi++]='\n';
        }
        if (outlen % 40!=0) out[outi++]='\n';
        out[outi] = 0;
        printf("%s",out);
}

int main()
{
    int nu;scanf("%d", &nu);
    while (nu--){
        int cc ;
        scanf("%d%d", &cc,&inlen);
        char s[999];
        gets(s);
        int idx = 0;
        while (idx < inlen){
        
            gets(s);
            int i,j;  int p = -1;
            for (i=0; s[i];i++){
                char c = s[i]; int n = -1;
                if ('0' <= c && c <= '9'){
                    n = c-'0';
                }
                else if ('A' <= c &&c<='Z'){
                    n = c-'A'+10;
                }
                if (n<0) continue;
                if (p==-1){ p = n; }
                else {
                    p = p*16 + n;
                    inb[idx++] = (char)p;
                    p=-1 ;
                }
            }
       }
       
        outlen = 0;
        doit();
        print(cc);

    }
}

