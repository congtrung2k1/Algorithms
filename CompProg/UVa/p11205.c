/**
Algorithm:
Brute force using bit mask

Idea is to try all possible mask m, and apply to every LED segment
and check for duplicates.
*/
#include <string.h>
#include<stdio.h>
#include<iostream>
#include<stdlib.h>
using namespace std;

int masks[110];
int nmasks;
int p;
int enc[1<<17];

typedef struct{
    int mask; int count;
} dd;
dd tries[1<<17]; 
int ntries;

int doit(){
    int gen = 1;
    memset(enc,0,sizeof(enc));
    int i,j;

    // start with the mask with least # of 1's
    for (i= 0; i < ntries;i++){
        int m = tries[i].mask;
        for (j = 0; j < nmasks;j++){
            int kk = masks[j] & m;
            if (enc[kk] == gen) break;
            enc[kk] = gen;
        }
        gen++;
        if (j==nmasks) return tries[i].count;
    }return p;
}

int comp(const void *a, const void *b){
    dd * aa = (dd*)a;
    dd * bb = (dd*)b;
    return aa->count -bb->count;
}
int main(){

    int nu;
        int i,j;
        for (i=0;i <(1<<15);i++){
            j=0; int m = i;
            while (i){j += (i&1); i >>= 1;; }
            i = m;
            tries[ntries].mask=m;
            tries[ntries++].count = j;
        }
        qsort(tries, ntries, sizeof(tries[0]), comp);
cin >> nu;
     while (nu--){
        cin >>p; cin >> nmasks;
        for (i=0;i<nmasks;i++){
            masks[i]=0;
            for (j=0;j<p;j++){ int k;
                cin >>k; masks[i] =( masks[i] << 1) | k;
            }
        }
        cout<<doit()<<endl;
     }
}



