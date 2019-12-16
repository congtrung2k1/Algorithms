/*
 * Algorithm:
 * Brute force generation of humble numbers <= 2000000000
 * by permutating the prime factors
 * Then sort them
 *
 * Gotchas:
 * - Be very careful with numeral suffixes (I hate this kind of shit)
 *   Suffix for a number n is based on (n%100) only.
 *   The teen's always have 'th' as suffix
 *
 *
 * */ 
#include<stdio.h>
#include<string.h>
#include<stdlib.h>

typedef long long ll;

ll pows[10][100];
ll hum[6000];
int nhum=0;

#define MAX ((ll)2000000000)

void init(int num) // precompute powers of num
{
    ll p = 1;
    for (int i=0;;i++){
        pows[num][i] = p;

        if (p > MAX) break;
        p *= num;
    }
}

// permutate hum nums
void init2(){
int i,j,k,l;
    for(i=0;;i++){
        ll p = pows[2][i];
        if (p>MAX) return;
        for(j=0;  ;j++){
            ll p3 = pows[3][j] * p;
            if (p3 > MAX) break;
            for (k=0; ; k++){
                ll p5 = pows[5][k]*p3;
                if (p5>MAX) break;
                for (l=0; ;l++){
                    ll p7 = pows[7][l]*p5;
                    if (p7 <= MAX){
                        hum[nhum++] = p7;
                        if (nhum > 5843) return;
                    }
                    else break;
                }
            }
        }
    }
}
int comp(const void * a,  const void*b){
    ll k =  *(ll*) a - *(ll*) b;
if (k<0) return -1;
if (k>0) return  1;
return 0;
}
int main(){

    int i,j,k,l;
    init(2); init(3); init(5);init(7);
    init2();
    qsort(hum,nhum,sizeof(ll),comp);
    while (1){
        int kk1;scanf("%d", &kk1);
        if(kk1==0)break;
        const char *ss="th";
        int kk = kk1%100;
        if (! (kk >= 10 && kk <= 19)){
            if (kk % 10 == 1)ss="st";
            else if (kk%10==2) ss="nd";
            else if (kk%10==3) ss= "rd";
        }
        printf("The %d%s humble number is %lld.\n",kk1,ss ,hum[kk1-1]);
    }
}



