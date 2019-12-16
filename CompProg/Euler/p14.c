#include <stdio.h>
#include <stdlib.h>
#include <string.h>
long long count[200000000];

long long countit(long long i)
{

    long long k=0 ;
    long long j = i;
  do
  {
  if (i==1)k+= 1;
  else if(i==2){k+= 2;i=1;}
  else if (i==4){ k+= 3;i=1;}
  else  if (i < sizeof(count)/8&&count[i]){
    
    k+= count[i];i=1;}
  else
  {
    if (i%2) i=(3*i+1);
    else i=(i/2);
    k++;
  }

  }while(i>1);
    return count[j]=k;
}

int main()
{
    
  memset(count,0,sizeof(count));

  long long i; long long p;
  long long m =0;
  for (i = 999999; i>=1;i--)
  {
    long long k  = countit(i); 
    if (k>m){m=k;p=i;}
  }

  printf("%lld\n",p);

}

