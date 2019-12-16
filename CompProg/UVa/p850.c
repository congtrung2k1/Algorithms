#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char lines[120][100];
int nlines;
char map[256];
char rmap[256];

int check(char*s,int len)
{
    
    const char *ss = "the quick brown fox jumps over the lazy dog";
    if (len != strlen(ss))return 0;
    int i,j,k;
    for (i=0;i<len;i++){
        char c=ss[i];
        if (c==' ' && s[i] != ' ') return 0;
        else if (c!=' '&&s[i] == ' ') return 0;
    }
    memset(map,0,sizeof(map));
    memset(rmap,0,sizeof(rmap));
    for (i=0;i<len;i++){
        if (map[s[i]] != 0 && map[s[i]] != ss[i]) return 0;
        if (rmap[ss[i]] != 0 && rmap[ss[i]]!=s[i])return 0;
        map[s[i]]=ss[i];
        rmap[ss[i]]=s[i];
    }
    map[' ']=' ';
    return 1;
}

void decode(char *s)
{
    int i,j,k;
    for (i=0; s[i];i++){
        s[i] = map[s[i]];
    }
}


void trim(char *s, int *len)
{
    if (*len==0) return;
    if (s[*len-1] =='\n') {s[*len-1]=0;*len --;}
    
}
int main()
{
    int nu;
    char nus[100];
    gets(nus);
    int l = strlen(nus);
    if (nus[l-1] == '\n') nus[l-1]=0;
    nu=atoi(nus);
    gets(nus);
    int first=1;
    while(nu--){
        
        if (!first) printf("\n");
        first=0;
        int i,j,k;
        int chk=0;
        for (i=0;;i++){
            if (!gets(&lines[i][0]))break;
            int len =strlen(&lines[i][0]);
            trim(&lines[i][0],&len);
            if (!lines[i][0])break;
            if (!chk && check(&lines[i][0],len))chk = 1;
        }
        if (!chk){printf("No solution.\n");continue;}
        nlines=i;
        for(i=0;i<nlines;i++){
            decode(&lines[i][0]);
            printf("%s\n",&lines[i][0]);
        }
    }return 0;
}
