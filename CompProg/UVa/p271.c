/**
Algorithm:
DP ? With memoization


*/

#include<stdio.h>
#include<string.h>

char valid[256];
char in[500];
char cache[260][260];
char is(int s, int e){
    if (cache[s][e]) return cache[s][e];
    if (s>e) return cache[s][e]=2;
    if (s==e && valid[ in[s]]) return cache[s][e]=1;
    char c = in[s];

    if (c== 'N' && is(s+1,e)==1) return cache[s][e]=1;
    switch (c){
    case 'D': case 'C' : case 'E' :case 'I':
        {
        for (int i =s+1; i <= e; i++){
            if (is (s+1, i)==1 && is (i+1, e)==1) return cache[s][e]=1;
        }
        }
    }
    return cache[s][e]=2;
}

int main(){
int i;    for (i = 'p'; i <= 'z'; i++) {
valid [i] = 1;
}
    while (9){
        if (! gets(in)) break;
        memset(cache,0,sizeof(cache));
        if (is ( 0,  strlen(in)-1)==1) printf("YES\n");
        else printf ("NO\n");
    }
}


