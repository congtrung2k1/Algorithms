/**
 * Algorithm:
 * Geometry...
 */
#include <stdio.h>
#include <stdlib.h>
#include<iostream>
using namespace std;
int n,m,a;
int main(){
    int nu; int casen=1;
    cin >> nu; while(nu--){
        cin >> n>>m>>a;
        int k = a/m;

        if (a > m*n) printf("Case #%d: IMPOSSIBLE\n", casen++);
        else if (a==m*n) printf("Case #%d: 0 0 %d %d %d %d\n",
                casen++, n ,0,n,m);
        else
        printf("Case #%d: %d %d %d %d %d %d\n",
            casen++, k, 0, k+1, m, 0, (a-m*k));
    }
}
