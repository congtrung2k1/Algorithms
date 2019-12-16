#include <string.h>
#include <stdio.h>
#include <stdlib.h>


typedef struct{
    int t;
    int s;
    int pos;
    } job;

job jobs[20000];
int n;


int comp(const void *a, const void *b)
{
    job* ja= (job*) a ;
    job*jb = (job*)b;
    int k = ja->t * jb-> s - jb->t * ja->s;
    if (k==0) return ja->pos - jb->pos;
    return k;
   
    //s/t  - sb/tb => s
}
void doit()
{
   qsort( jobs, n, sizeof(jobs[0]), comp);
   int i;
   for (i=0;i<n-1;i++){
    printf("%d ", jobs[i].pos);
   }
    printf("%d\n", jobs[n-1].pos);
}
int main()
{
    int nu;
    scanf("%d",&nu); int f = 0;
    while (nu--){
    if (f)printf("\n");f=1;
        scanf("%d",&n);
        int i,j,k;
        for (i=0;i<n;i++){
            scanf("%d%d", &jobs[i].t, &jobs[i].s);
            jobs[i].pos = i+1;
        }
        doit();
    }return 0;
}