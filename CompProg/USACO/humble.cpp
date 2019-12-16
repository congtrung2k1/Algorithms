/*
user: tbhtan31
LANG: C++
TASK: humble
*/
/**
 * Brute force with optimisation. The trick is for each prime, keep track of the
 * smallest humble number such that the product is just greater than the
 * last humble number.
 */
#include<iostream>
#include<fstream>
#include<cstring>
#include<cstdlib>
#include<cmath>
using namespace std;
int K,N;
int primes[101];
int primeidx[101];
int humbles[100001];

int main(){
    ifstream in("humble.in");
    ofstream out("humble.out");
    int i,j;
    in>>K>>N;
    for (i=0;i<K;i++){
        in>>primes[i];
    }

    humbles[0]=1;
    for(i=1;i<=N;i++){
        int best=0x7fffffff;
        for (j=0;j<K;j++){
            int p=primes[j],k;
            for (;(k=humbles[primeidx[j]]*p )<= humbles[i-1]; primeidx[j]++);
            best=min(best,k);
        }
        humbles[i]=best;
    }
    out<<humbles[N]<<endl;
    out.flush();out.close();
    return 0;
}
