/**
* Algorithm:
* Test for "squareness"
*
* light is on iff n has odd no. of factors
* which means n must be perfect square
*
*/
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include <math.h>

typedef long long ll;

ll n;


void doit()
{
    int per = 0;
    ll s = (ll)sqrt(n)+1;
    for (ll  i=s; i >= 1 && i >= s-2 ;i--){
        if (n % i==0){ 
             
            if (n/i ==i) per = 1;
        } 
    }
    printf( per ? "yes\n" : "no\n");
}

int main()
{
    while (1){
        scanf("%lld", &n);
        if (!n) break; doit();
    }
}


