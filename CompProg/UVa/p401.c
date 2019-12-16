#include <stdlib.h>
#include <stdio.h>
#include <string.h>

char map[300];
char map2[300];

void doit(const char *s)
{
    int len = strlen(s);
    int i,j,k;

    int palin = 1;
    for (i=0;i<= len/2; i++){
        if ( s[i] != s[len-1-i]){ palin =0;break; }
    }

    int mirror = 1;
    for (i=0;i<=len/2;i++){
        char c = map[s[i]];
        char c2 = map2[s[i]];
        if (s[len-i-1] != c  && s[len-i-1] != c2){mirror=0;break;} 
    }

    if (mirror && palin){
        printf("%s -- %s\n\n", s, "is a mirrored palindrome.");
    }
    if (!mirror && palin){
        printf("%s -- %s\n\n", s, "is a regular palindrome.");
    }
    if (mirror && !palin){
        printf("%s -- %s\n\n", s, "is a mirrored string.");
    }
    if (!mirror && !palin){
        printf("%s -- %s\n\n", s, "is not a palindrome.");
    }
}

int main()
{
    char * s = "A---3--HIL-JM-O---2TUVWXY51SE-Z--8-";

    int i;
    int len = strlen(s);
        for (i=0;i< 26;i++){
        map['A'+i]  = s[i];
        map2[s[i]] = 'A'+i;
        }

        for (i=0;i < 9; i++){
            map['1'+i] = s[i+26];
            map2[s[i+26]] = '1'+i;
        }



    char line [2000];
    while (2){
        if (!gets(line)) break;

        doit(line);
    }

}
