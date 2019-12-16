/*
LANG: C++
TASK: nuggets
*/
/**
 * This problem is basically finding the largest integer that cannot be
 * expressed as a linear combination of the given sizes, s0, s1, ....
 * Use dynamic programming with sliding window to cope with the memory limits.
 * There is no bound iff GCD of all sizes > 1.
 * Prove that if GCD > 1, there is no bound:
 * Let a be the GCD > 1, a*k be any linear combination, then a*k+1 cannot be a
 * linear combination.
 * Assume a*k+1 = a*y for some linear combination a*y.
 * Then this implies 1 == 0 (mod a) where a > 1, which is a contradiction.
 * Thus for any a*k, a*k+1 cannot be a linear combination. Since a*k is
 * unbounded, a*k+1 is also unbounded.
 *
 * Prove that if GCD == 1, there is a bound.
 * If GCD==1, there is at least a pair of relatively prime numbers, N and M.
 * The max impossible integer is thus N*M - (N+M), and therefore is also the
 * bound.
 */
#include<iostream>
#include<fstream>
#include<cstring>
#include<cstdlib>
using namespace std;

// poss[p]==true iff p is possible. it is a sliding window.
char poss[256];
int sizes[11], n;

int main(){
    ifstream in("nuggets.in");
    ofstream out("nuggets.out");
    int i,j,k;
    in>>n;
    for(i=0;i<n;i++){
        in>>sizes[i];
    }
    for(i=2;i<=256;i++){
        int div=1;
        for(j=0;j<n;j++){
            div=div&&sizes[j]%i==0;
        }
        if(div){
            out<<0<<endl;
            return 0;
        }
    }
    int ans=0;
    poss[0]=1;
    for(int cur=0;cur<=2000000000;cur++){
        int p=cur%256;
        if(cur-ans>256)break;
        if(!poss[p])
            ans=cur;
        else{
            poss[p]=0;
            for(i=0;i<n;i++){
                poss[(cur+sizes[i])%256]=1;
            }
        }
    }
    out<<ans<<endl;
    out.flush();out.close();
    return 0;
}
