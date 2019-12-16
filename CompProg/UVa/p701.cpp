/**
 * Solved using logarithm.
 * let i = (# of missing digits) >= (# of digits present + 1) >= 2.
 * let a = number prefix in input.
 * Thus,
 *    log(a(10^i)) <= 2^E < log(a(10^i) + 10^i - 1)
 * => log(a(10^i)) <= 2^E <= log((a+1)(10^i)) since 2^E can never end in 0.
 * => ...
 * => x + i*d <= E <= y + i*d
 *    where x = log a / log 2, y = log(a+1)/log 2, d = log 10/log 2.
 * Just brute force on i until you get an E that is an integer.
 */

#include<iostream>
#include<cmath>
#include<cstdlib>
using namespace std;

typedef long long ll;

int main(){
    ll N;
    while(cin>>N){
        int ndigits = 1+(int)(log(N)/log(10));
        int i,j;
        double d = log(10)/log(2);
        double x=log(N)/log(2);
        double y=log(N+1)/log(2);
        double diff=y-x;

        for(i=ndigits+1;;i++){
            int g = (int)(x+i*d+diff);
            if ((int)(x+i*d)!=g){
                cout<<g<<endl;
                break;
            }
        }
    }
}
