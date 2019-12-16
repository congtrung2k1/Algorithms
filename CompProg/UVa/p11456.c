/**
 * Algorithm:
 * DP
 * Find the LIS and LDS starting at each index i
 * Then find max(lis[i] + lds[i] - 1) for each i
 *
 * Theory:
 * Let car X be the longest train's first car. First refers to the very 
 * first car that forms the train. X obviously must be somewhere in the
 * queue of cars. Any car that goes to the front/behind 
 * of X in the train must come after X in the queue of cars.
 * Since the cars in the train must be sorted, and we are allowed to 
 * skip cars in the queue, the longest train is effectively 
 * the LIS and LDS (starting at X) combined.
 */
#include<string.h>
#include<stdio.h>

int lis[2001]; //len of longest increasing seq starting at i
int lds[2001]; //len of longest decreasing seq starting at i
int n;
int len[2001];

void doit()
{
    int i,j;
    for (i=n-1;i>=0;i--){
        int c = len[i];
        int maxlen = 1;
        for (j=n-1;j > i;j--){
            if (c < len[j] && lis[j]+1 >maxlen){
                maxlen = lis[j]+1;
            }
        }
        lis[i]=maxlen;
    }
    
    for (i=n-1;i>=0;i--){
        int c = len[i];
        int maxlen = 1;
        for (j=n-1;j > i;j--){
            if (c > len[j] && lds[j]+1 >maxlen){
                maxlen = lds[j]+1;
            }
        }
        lds[i]=maxlen;
    }

    int max = 0;
    for (i=0;i <n;i++)
        if (lds[i] + lis[i] - 1 > max) 
            max = lds[i] + lis[i] - 1;
    printf("%d\n", max);
}

int main(){
    int nu;
    scanf ("%d",&nu);
    while (nu--){
        scanf("%d", &n);
        int i,j;
        for (i=0;i<n;i++) scanf("%d", &len[i]);
        doit();
    }
}

