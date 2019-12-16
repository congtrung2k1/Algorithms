/**
 * Solved using simple arithmetic and brute force.
 *    1/k = 1/x + 1/y
 * => x = k*y/(y-k)
 * => y > k
 * Also,
 *    x >= y
 * => ky/(y-k) >= y
 * => y <= 2k
 */
#include<iostream>
#include<cstdlib>
#include<cstring>
using namespace std;

int store[999999];
int store2[999999];

int main(){
    int k;
    while(cin>>k){
        int i,count=0;
        for(i=k+1;i<=2*k;i++){
            int ki=i*k;
            int imk = i-k;
            if(ki%imk)continue;
            store2[count]=ki/imk;
            store[count++]=i;
        }
        cout<<count<<endl;
        for(i=0;i<count;i++){
            cout<<"1/"<<k<<" = "<< "1/"<<store2[i]<<" + 1/"<<store[i]<<endl;
        }
    }
}
