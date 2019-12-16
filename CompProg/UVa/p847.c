/**
 * Algorithm:
 * Simple math game
 *
 * Must prove that Stan always play 9 and Ollie always play 2.
 * This can be proven by contradiction that they have no other optimal
 * moves.
 *
 */

#include<stdio.h>
#include<string.h>
#include<stdlib.h>

typedef long long ll;

int main()
{
    while (1){
        ll n;
    int k= scanf("%lld", &n);
    if (k!=1) break;
        int stan = 1;
        ll p = 1;
        while (1){
            if (stan) p*= 9;
            else p*= 2;
            if ( p >= n ) break;
            stan ^= 1;
        }
        if (!stan) printf("Ollie wins.\n");
        else printf("Stan wins.\n");
    }    
}
