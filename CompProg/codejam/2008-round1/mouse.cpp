// This algorithm takes a while for the large input

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <iostream>
#include <cassert>

int avail[1002000];
int has  [1002000];
int seq  [1002000];

using namespace std;

int k;
int inter;
int numinter;
typedef long long ll;

// return zero-based index of num^th empty slot in avail, 
// starting at zero based index start
int find(int num, int start){
    
    int i = (start)/inter;
    int part = 0;
    for (ll j = i*inter; j < start;j++){
        if (avail[j]) part++;
    }

    while (  num > has[i]-part){
        num -= has[i] - part;
        i++;
        i %= numinter;
        part = 0;
    }

    int c = 0;
    for (ll j = i*inter; ;j++){
        if(avail[j]){
            c++ ;
            if (c==num+part) return j;
        }
    }

    assert(false);
}

int main(){ int nu;
    cin >> nu; int casen = 1;
    while (nu--){
         cin>>k;
        int numidx;
        cin >>numidx;
        
        memset(avail,0,sizeof avail);
        memset(has,0,sizeof has);

        inter = (int)sqrt(k)+1;
        numinter = (k+inter-1)/inter;

        for (int i = 0 ; i < k;i++){
            has[(i)/inter]++;
            avail[i]=1;
        }

        // placement
        int num = 1;
        int start = 0;
        while( num <= k){
            int empty = find((num-1)%(k+1-num)+1, start);
            seq[empty+1]=num;
            has[(empty)/inter] --;
            avail[empty] = 0;
            num++;
            start = empty;
        }

        cout <<"Case #"<< casen++ << ":";
        for (int i =0;i< numidx; i++){
            int idx; cin >> idx;
            cout << " " << seq[idx];
            }
            cout<<endl;
    }
}


