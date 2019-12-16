#include <stdio.h>
#include <stdlib.h>
#include <string.h>

const char*map1="`1234567890-=";
const char*map2="qwertyuiop[]\\";
const char*map3="asdfghjkl;'";
const char*map4="zxcvbnm,./";

char map[256] ;

int u(int c)
{
    if (c >= 'a' && c <='z') return c-'a'+'A';
    return c;
}

void build(const char*m)
{
    int i=1;
    while (m[i])
    {
        map[m[i]] = m[i-1];
        map[u(m[i])] = (char)u(m[i-1]);
        i++;
    }
}
/*
int getline(char*out)
{
    int i=0;
    int c;
    out[i]=0;
    while( (c=getch())>0)
    {
        if(c=='\n') {out[i] = 0; break;}
        out[i++] = (char)c;
    }
    return i;
}*/
char out[1000000];
int main()
{
    
    build(map1);
    build(map2);
    build(map3);
    build(map4);
    map[' ']=' ';
    while(1)
    {
       
        if (! gets(out) || out[0] == 0) break;
        int i = 0;
        int k=strlen(out);
        for (i=0; i<k;i++) out[i] = map[out[i]];
        printf("%s\n", out);
    }
    return 0;
}
