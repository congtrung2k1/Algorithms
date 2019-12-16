#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define min(a,b) ((a)>(b) ? (b):(a))
char s1[1002], s2[1002];
int f1[256], f2[256];

void count(int *f, char*s)
{
    int i=0;
    memset(f,0,256*sizeof(int));
    while(s[i]){
        f[s[i]]++;
        i++;
    }
}

int main()
{
    while(1){
        
        if (!gets(s1))break;
        gets(s2);
        count(f1,s1); count(f2, s2);
        int i=0;
        
      
        for (i='a';i<='z';i++){
            int f = min(f1[i],f2[i]);
            memset(s1, i, f);
            s1[f]=0;
            printf("%s", s1);
        }
        printf("\n");
    }return 0;
}

