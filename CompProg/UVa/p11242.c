/**
 * Algorithm:
 * Brute force generate all drive ratios
 *
 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include<iostream>
using namespace std; 

int ff[100];
int rr[100];
int nf; 
int nr;

struct ratio{
    int  top;
    int bot;
};

ratio all[100000];
int nall;

typedef long long ll;

int comp (const void * a, const void * b){
    ratio * aa =  (ratio *) a;
    ratio * bb =  (ratio *) b ;
    // a /b -  c/d
    // => a*d - c*b
    ll one =  aa->top * bb->bot;
    ll two = aa->bot * bb->top;
    if (one < two ) return -1;
    if ( one > two ) return 1;
    return 0;
}

void doit(){

    int i,j;  nall=0;
    for (i= 0; i < nr; i++){
        for (j = 0; j < nf; j ++){
             all[nall]. top = rr[i];
             all[nall].bot = ff[j];nall++;
        }
    }

    qsort( all , nall, sizeof(all[0]), comp);

    double max = 0;
    for (i=0; i < nall-1 ; i++){
        double r =  all[i+1].top / (double)all[i+1].bot / (
                all[i].top / (double)all[i].bot);
        if (r > max)max=r;
    }
    printf("%.2lf\n", max);
}


int main(){
    while (9){
    
       int k = scanf ("%d %d", & nf, &nr);
         if (k!=2) break;int i,j;
         for (i=0;i<nf; i++) cin >> ff[i];
         for (i=0; i < nr;i++) cin>>rr[i];
         doit();
    }

}
