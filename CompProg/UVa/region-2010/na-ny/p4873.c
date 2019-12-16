#include<stdio.h>
#include<string.h>
#include<stdlib.h>

char toss[999];
int ntoss;
int count[99];

void doit(){

    int i,j;
    for (i=2;  toss[i]; i++){
        char * c = &toss[i-2];
char b =         toss[i+1] ; toss[i+1]=0;
        if (strcmp(c, "TTT")==0) count[0]++;
        else if (strcmp(c, "TTH")==0) count[1]++;

        else if (strcmp(c, "THT")==0) count[2]++;
        else if (strcmp(c, "THH")==0) count[3]++;
        else if (strcmp(c, "HTT")==0) count[4]++;
        else if (strcmp(c, "HTH")==0) count[5]++;
        else if (strcmp(c, "HHT")==0) count[6]++;
        else if (strcmp(c, "HHH")==0) count[7]++;
        toss[i+1] = b;
    }
}


int main()
{
    int nu;
    scanf ("%d", &nu);
    while ( nu--){
        int cc;
        scanf("%d", &cc);
    gets(toss); gets(toss); 
        memset ( count,0,sizeof(count));

        doit();

        printf("%d", cc);
        int i,j;
        for (i=0;i< 8;i++){
            printf(" %d", count[i]);
        }
        printf("\n");
    }
}


