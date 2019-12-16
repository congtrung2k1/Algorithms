#include <stdlib.h>
#include <stdio.h>
#include <string.h>

char line[10000];


void doit()
{
    int i,j,k;
    char q[2] ;
    char field[2][1000];
int f=0;
int numf = 0;
    for (i=0; line[i];i++){
        char c= line[i];
            if (c == '='){
                q[numf] = line[i-1];
                f=0;
                for (i++; line[i]; i++){
                    if (line[i] == ' ')break;
                    field[numf] [f++] = line[i];
                }
                field[numf][f]=0;

                numf++; if (numf==2) break;
            }
    }

    double d [2];
    
    for (i=0; i<2;i++){
    
        int j;
            for (j=0; field[i][j]; j++){
                char c= field[i][j];
                if ( ! (c=='.'|| (c >= '0' && c <= '9'))){
                    field[i][j] = 0;
                    d[i] = atof(&field[i][0]);
                    field[i][j] = c;
                    if (c == 'm') d[i] *= 1.0/1000;
                    if (c=='k')d[i]*= 1000.0;
                    if (c=='M')d[i]*=1000000.0;

                    break;
                }
            }
    }

    char ansC; double ans = 0;
    char unit;
    if (q[0] == 'P' && q[1] == 'U') {ansC = 'I';unit='A'; ans = d[0]/d[1];}
    if (q[0] == 'U' && q[1] == 'P') {ansC = 'I';unit='A'; ans = d[1]/d[0];}

    if (q[0] == 'I' && q[1] == 'P') {ansC = 'U';unit='V'; ans = d[1]/d[0];}
    if (q[0] == 'P' && q[1] == 'I') {ansC = 'U';unit='V'; ans = d[0]/d[1];}
    if (q[0] == 'I' && q[1] == 'U') {ansC = 'P';unit='W'; ans = d[1]*d[0];}
    if (q[0] == 'U' && q[1] == 'I') {ansC = 'P';unit='W'; ans = d[1]*d[0];}

    printf("%c=%.2f%c\n\n",ansC, ans, unit);
}
int main()
{
int nu;
scanf("%d",&nu);
char s[10000];gets(s);
int prob = 1;
while (nu--){
if (!gets(line)) break;    
printf("Problem #%d\n", prob);
doit();prob++;
}
}
