/**
Algorithm:
DP

Gotchas:
- Tricky edge cases . Must follow the rules : longest sequence, lowest i
*/
#include<string.h>
#include<stdio.h>
#include<iostream>
using namespace std;
typedef long long ll;
int num[20009];
int n;
int r=1;
void doit(){
    int i,j; ll sum=0;
    int start=0;
    int end=0;
    ll max = 0;
    int maxstart = 0;
    int maxend = 0;
    for (i=0;i<n-1;i++){
        ll newsum = num[i]+sum;

        if (newsum<0){
            sum=0;
            start = i+1;
        }
        else{
            sum=newsum;
        
            if (sum >max || (sum==max&& i-start>maxend-maxstart)
              || (sum==max&&i-start==maxend-maxstart&&start<maxstart)  ){
                end = i;
                max = sum;
                maxstart = start;
                maxend = end;
            }
       }
    }
    if (max<=0) printf("Route %d has no nice parts\n",r);
    else
    {
        printf("The nicest part of route %d is between stops %d and %d\n",
        r, maxstart+1,maxend+2);
        }
        r++;
}

int main(){
    int nu;scanf("%d", &nu);
    while (nu--){
        scanf("%d", &n);
        int i,j;
        for(i=0;i<n-1;i++){
            cin >> num[i];
        }
        doit();
    }
}

