#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int t[2000];
int n;
int crossing[80000];

int comp(const void*a, const void*b)
{
    return *(int*)a - *(int*)b;
}

void doit()
{ 
   if (n == 1){ printf("%d\n%d\n", t[0], t[0]); return; }

    qsort(t, n, sizeof(int), comp);
    
    int sum=0; int k = -1;
    while (n > 3){
        int biggest = t[n-1];
        int big = t[n-2];
        int s1 = biggest + t[0] + big + t[0];
        int s2 = t[1] + t[0] + biggest + t[1];
        if (s1 < s2){
            crossing[++k] = t[0];
            crossing[++k] = t[n-1];
            
            crossing[++k] = t[0]; 
            
            
            crossing[++k] = t[0];
            crossing[++k] = t[n-2];
            
            crossing[++k] = t[0];
            
            sum += s1;
        }
        else
        {
            crossing[++k] = t[0];
            crossing[++k] = t[1];
            
            crossing[++k] = t[0]; 
            
            
            crossing[++k] = t[n-2];
            crossing[++k] = t[n-1];
            
            crossing[++k] = t[1];
            
            sum+=s2;
        }
       
        n -=2;
    }
    if (n == 2)
    {
        sum += t[1];
        crossing[++k] = t[0];
        crossing[++k]=t[1];
    }
    else {
        sum += t[0]+t[1]+t[2];
        
    }
    
    printf("%d\n",sum);
    int i,p=1;
    for (i=0;i<=k;i++){
        if (p){  printf("%d %d\n", crossing[i],crossing[i+1]); i+=1; }
        else{  printf("%d\n", crossing[i]);  }
        p^=1;
    }
    if (n==3)
    {
        printf("%d %d\n%d\n%d %d\n",  t[0],t[2], t[0], t[0], t[1]);
    }
}

int main()
{int nu;int f=0;
    scanf("%d",&nu);
    while (nu--){
    if (f) printf("\n"); f = 1;
        scanf("%d",&n);
        int i;
        for(i=0;i<n;i++){
            scanf("%d",&t[i]);
        }
        doit();
    }return 0;
}