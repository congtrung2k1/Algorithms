/**
Algorithm:
Straightforward

Gotchas:
- Understand input format
*/

#include<string.h>
#include<stdio.h>
typedef long long ll;
int d,k;
int cc[99]; // coefficients
int deg; // degree

void doit(){
    int i,j;
    ll s = 1;ll n;

    // find which term a[i]
    for (i=1; ;i++){
        ll news = s +d* i-1;
        if ( s <= k && k <= news){
           n=i;   break;
        }
        s+=d*i;
    }

    // calc a[i]
    ll sum = 0; ll pp = 1;
    for (i=0;i<=deg;i++){
        sum += (ll)cc[i] *pp; pp*= n;
    }

    printf("%lld\n", sum);

}
int main(){

    int nu;scanf("%d",&nu);
    while(nu--){
        int i,j;
        scanf("%d", &deg);
        for (i=0;i<=deg;i++){
            scanf("%d", &cc[i]);
        }

        scanf("%d%d", &d, &k);
        doit();
    }
}
