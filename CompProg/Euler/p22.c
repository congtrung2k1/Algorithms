#include <stdlib.h>
#include <stdio.h>
#include <string.h>

char names[7000][100];

int comp(const void* a,const void*b)
{
    return strcmp((char*)a,(char*)b);
}


int score1(char* name)
{
   int i = 0;
   int s = 0;
   for (i = 0; name[i];i++)
   {
       char c = name[i];
       if ( 'a' <= c && c <='z') c = 'A' + (c - 'a');

       s += 1 + (c-'A');
   }
   return s;
}

int main()
{

    FILE* f= fopen("names.txt","rt");
    int c;
    int curidx = 0;
    int stridx = 0;
    long long score = 0;
    while ((c=fgetc(f)) != EOF)
    {
         if (('a' <= c && c <= 'z')
            ||('A' <= c && c<='Z'))
         {
            names[curidx][stridx++] = c;
         }
         else if (c == ','){
            names[curidx][stridx] = 0;
            curidx++;
            stridx = 0;
         }
     }

    if (stridx!=0)
    {
        names[curidx][stridx]=0;
        curidx++;
        stridx = 0;
    }

    qsort(names, curidx, sizeof(names[0]), comp);

    int i=0;
    for (; i < curidx;i++)
    {
        score +=(1+ i) * score1(names[i]);
    }
    printf("%lld\n",score);
    fclose(f);
}

