#include<iostream>
#include<cstdlib>
#include<cstdio>
#include<cmath>
using namespace std;
int N;
int main(){
    while(cin>>N){
        char fmt[]="%00d\n";
        fmt[2]+=N;
        int i,j;
        int div=(int)pow(10,N/2);
        for(i=0;i<div;i++){
            int t=i*i;
            int a = t/div;
            int b = t % div;
            if ((a+b)*(a+b)==t) 
                printf(fmt, t);
        }
    }
}