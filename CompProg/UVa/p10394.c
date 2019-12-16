/**
 * Algorithm:
 * Build sieve and at the same time find out the twin primes
 * */
#include<stdio.h>
#include<string.h>

#define MAX  20000000
int notprime[20000000/32+2];

inline void setp(int i){
notprime[i/32] |= (1<<(i%32));
}

inline bool getp(int i)
{
    return (notprime[i/32] & (1<<(i%32))) !=0;
}

int p1[100004];
int p2[100004];
int num;

void init()
{
    int i,j;
 setp(1);   setp(0);
    for (i=2; i < MAX;i++){
        if (getp(i)) continue;
        if (num <= 100000 && !getp(i-2)){
            p1[num] = i-2;
            p2[num] = i; num++;
        }
        for (j= i*2; j < MAX; j+=i){
            setp(j);
        }
    }
}

int main(){
 init();
    while(9){ int n;
   int k=     scanf("%d", &n);
   if (k!=1)break;
        printf("(%d, %d)\n",  p1[n-1], p2[n-1]);
    }
}


