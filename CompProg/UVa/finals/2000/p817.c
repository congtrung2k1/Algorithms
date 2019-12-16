/**
* Algorithm:
* Brute force + backtracking
* Search space: O(8! * 4) since there are 8 spot to put in an operator
* and there are 3 operators and also we can choose not to put an operator
*
* Gotchas:
* - The input 2000= is IMPOSSIBLE since one or more operators must be inserted
* - Output in text order which can be solved easily by using a qsort at the end
*/

// summary of rules:
// token that start with zero must be zero itself
// two operators cannot appear consecutively
// cannot start with an operator

#include <stdio.h>
#include <stdlib.h>
#include <string.h>


char line[30]; // input line
char buf[30]; // brute force buffer with operators
char soln[400000][20]; // solutions table
int sol = 0; // solutions count

void chk(int buflen)
{
    int i,j,k;

    long long s = 0;
    int minus = 0;
    int multi = 0;
    long long prod = 1;
    long long total = 0;
    
    // evaluator based on state machine approach
    for (i=0;i< buflen;i++){
        char c=buf[i];
        if ('0' <= c && c <= '9'){
            s = s*10 + (c-'0');
        }
        else if (c == '-'){
            if (multi){
                prod *= s;
                total += minus ? -prod : prod;
            }
            else{
                total += minus ? -s : s;
            }
            s=0;
            prod=1;
            multi=0;
            minus = 1;
        }
        else if (c == '+'){
            if (multi){
                prod *= s;
                total += minus ? -prod : prod;
            }
            else{
                total += minus ? -s : s;
            }
            prod=1;
            s=0;
            multi=0;
            minus=0;
        }
        else{
            
            prod *=s;
            s=0;
            multi=1;
        }
    }
    
    if (multi){
        prod *= s;
        total += minus ? -prod : prod;
    }
    else{
        total += minus ? -s : s;
    }

    if ( total==2000)
    {
        memcpy( &soln[sol][0], buf, buflen);
        soln[sol][buflen] = 0;
        sol++;
    }
}

// brute force backtracker that finds all possible combination
void find(int lineidx, int bufidx, int tokStart)
{
    char c = line[lineidx];
    
    if (c =='='){

        chk(bufidx);
        return;
    }
    
    if ( line[lineidx+1] == '='){
        buf[bufidx++] = line[lineidx];
        find(lineidx+1, bufidx,tokStart);
        return;
    }
    
    buf[bufidx++] = c;
    buf[bufidx++] = '*';
    find(lineidx+1, bufidx,1);
    
    buf[bufidx-1] = '-';
    find(lineidx+1, bufidx,1);
    
    buf[bufidx-1] = '+';
    find(lineidx+1,bufidx,1);
    
    // ensure we don't get 0xxx
    if ((tokStart && c!='0' ) || !tokStart )
    {
        bufidx--;
        find(lineidx+1,bufidx, 0);
    }
}

// wrapper that avoids C++  compiler warning
// there's probably an easier and more efficient way but whatever.
int comp(const void *a, const void *b)
{
    return strcmp((const char*)a,(const char*)b);
}

int main()
{
    int p =1;
    while (1){
        gets(line);
        if (line[0] == '=') break;
        sol=0;
        if (strcmp(line,"2000=")!=0)find (0,0,1);
        printf("Problem %d\n", p);p++;
        if (sol==0){
            printf("  IMPOSSIBLE\n");
            continue;
        }
        qsort(soln, sol, sizeof(soln[0]),comp);
        int i;
        for(i=0;i < sol;i++){
            printf("  %s=\n", &soln[i][0]);
        }
    }
}
