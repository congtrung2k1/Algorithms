/**
Algorithm:
DP

Gotchas:
- There are more than 2^32 possible ways for 30000 cents

*/
#include<string.h>
#include<stdio.h>

typedef long long ll;

int coins[]={1,5,10,25,50};
const int ncoins = 5;
int price;
ll f[30090];

void doit(){
    int i,j;
    for (i=0;i<ncoins;i++){
        int cur = coins[i];
        f[cur]++;
        for(j = 1; j <= price-cur;j++){
                f[j+cur] += f[j];
        }
    }
}


int main(){
    int nu;
    // pre-calculate
price = 30000;
        doit();
   while(10){
int k =         scanf ("%d", & price); if (k!=1) break;
 if (f[price]>1)        printf("There are %lld ways to produce %d cents change.\n",
             f[price],  price);

             else printf("There is only 1 way to produce %d cents change.\n",  price);
   } 
}

