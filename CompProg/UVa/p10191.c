#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    int start;
    int end;
    } time;

    time times[2000];
//int start[2000];
//int end[2000];
int n;
int day=1;

int comp(const void *a, const void *b)
{
    return ((time*)a)->start-((time*)b)->start;
}
void doit()
{
    qsort(times, n, sizeof(times[0]), comp);

      int s = 10*60;
      int i,e= 10*60;
      int max = 0;
      int maxs=0;
      times[n].start = times[n].end = 18*60;
      n++;
      for (i = 0;i<n;i++){
        if (e < times[i].start){
            int len = times[i].start - e;
            if (len>max){max = len;maxs = e;}
            e = times[i].end;
        }
        else
        {
            e=times[i].end;
        }
      }
      
      
      printf("Day #%d: the longest nap starts at %d:%02d and will last for ",day,maxs/60,maxs%60);
      if (max >= 60)
      {
        printf("%d hours and %d minutes.\n", max/60, max%60);
      }
      else printf("%d minutes.\n",max);
day++;      
}

int main()
{
    char s[20000];
    while (1){
        int k=scanf("%d",&n);gets(s);
        if (k!=1) break;
        int i;
        for (i=0;i<n;i++){
            gets(s);
            char ss[20]; char ee[20];
            sscanf(s, "%s%s", ss, ee);
            ss[2] = ss[5] = ee[2] = ee[5]=0;
            times[i].start = atoi(ss) * 60 + atoi(ss+3);
            times[i].end = atoi(ee) * 60 + atoi(ee+3);
        }
        doit();
    }return 0;
}