#include <stdio.h>
#include <string.h>
#include <stdlib.h>


const int ONES[] = {3,3,5,4,4,3,5,5,4,3};
const int TEENS[] = {6,6,8,8,7,7,9,8,8,6};
const int TENTHS[]={0,6,6,5,5,5,7,6,6};

int count(int n)
{
    if (n==0) return 0;
    if ( n <= 10 )
      return ONES[n-1];

    if (n <= 20) return TEENS[n-11];

    if (n <= 99) return TENTHS[n/10-1]+count(n%10);

    if (n <= 999) {
      return 7+ONES[n/100-1]+(n%100?count(n%100)+3:0);}

    return 11;
}

int main()
{
    int sum=0;
    int i;
    for (i=1;i<=1000;i++) sum += count(i);

    printf("%d\n",sum);
}

