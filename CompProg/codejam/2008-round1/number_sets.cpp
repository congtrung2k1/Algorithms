#include <stdio.h>
#include <stdlib.h>
#include<string.h>
#include <math.h>
#include<assert.h>
typedef long long ll;
ll primes[1000009];
int nprimes;
ll a,b,p;

char notprime[1000009];
int num[1000005];

int rank[1000005];

int find(int a){
    if (rank[a] < 0) return a;
    return rank[a] = find(rank[a]);
}
bool union1(int a,int b){
    int f1 = find(a);
    int f2 = find(b);
    if (f1==f2) return false;
    if (rank[f1] < rank[f2]){
        rank[f2] = f1;

    }else if(rank[f1] > rank[f2]){
        rank[f1] = f2;
    }
    else {
        rank[f1]=f2; rank[f2]--;
    }
    return true;
}


int main(){

    for (ll i = 2; i < sizeof notprime; i++){
        if (notprime[i])continue;
        primes[nprimes++] = i;
        for (ll j = i*i; j < sizeof notprime;j+=i){
            notprime[j]=1;
        }
    }

    int nu;
    scanf("%d", &nu); int casen=1;
    while (nu-- ){
        scanf("%lld%lld%lld",&a,&b,&p);
        memset(num,0,sizeof num);
        memset(rank, -1, sizeof rank);
        int idx = 1;
        int count = 0;
        ll A= a; ll B = b;
        
        for (int i = 0; i < nprimes;i++){

            bool set = false;
            int prime = primes[i];
            if (prime <p) continue;
            for (ll j = a+(prime - A%prime)%prime; j <= b;j+=prime){
                if ( num[j-A]){
                    if (union1(num[j-A], idx))
                    {count--;
                    set = true;
                    }
                }
                else {set=true;num[j-A] = idx;}
            }
            if (set){idx++;count++;}
        }

        for (ll i = A; i <= B;i++){
            if ( num[i-A] == 0) {
                count++;
           }
        }

        printf("Case #%d: %d\n", casen++,count);
    }
}

