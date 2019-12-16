/**
 * Algorithm:
 * Nothing much
 *
 * Easiest problem ever?
 *
 */
#include<iostream>
#include<stdio.h>
#include<string.h>
using namespace std;
int main(){
int n;
    while (30){
        cin>> n;
        if (n==0) break;
        int first = 1;
        int i,j;
        for (i=0;i < n;i++){ int k;
            cin >> k;
            if (k==0) continue;
            if (!first) cout << ' ';
            first =0 ;
            cout << k;
        }
        if  (first) cout << "0";
        cout << endl;
    }
}
