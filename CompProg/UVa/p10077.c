/**
 * Algorithm:
 * - Binary search
 *
 * I'm not sure whether using 32-bit integers suffices,
 * but I used 64-bit to play safe.
 *
 */
#include<stdlib.h>
#include<string.h>
#include<stdio.h>

typedef long long ll;
ll a,b;
char soln[9999999];
int sol = 0;

bool smaller(ll lm, ll ln, ll a, ll b){
    return lm*b < a*ln;
}

void doit()
{
    ll lm, ln, cm, cn , rm, rn;
    lm = 0;
    ln = 1;
    rm=1;
    rn=0;
    while (1){
        cm = lm+rm;
        cn = ln+rn;
        if (cm == a && cn == b) break;
        if (smaller(cm,cn, a,b)){
            // cm/cn smaller
            lm=cm; ln=cn;
            soln[sol++]='R';
        }
        else {rm=cm; rn=cn; soln[sol++] = 'L';}
    }

    soln[sol] = 0;
    printf("%s\n",soln);
}

int main()
{
    while (1){
        sol=0;
        scanf("%lld%lld", &a, &b);
        if (a== 1 && b==1) break;
        doit();
    }
}

