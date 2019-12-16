/**
 * Algorithm:
 * Bisection method + Interval deepening
 *
 **/
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>
typedef double dbl;
#include<float.h>
dbl p,q,r,s,t,u;

inline dbl eqn(dbl x)
{
    return p*exp(-x)+q*sin(x)+r*cos(x)+s*tan(x)+t*x*x+u;
}
inline int sgn(dbl x){
    return x < 0 ? -1 : 1;
}
inline dbl min(dbl x, dbl y){ return x<y ? x : y; }
inline dbl max(dbl x, dbl y){ return x>y ? x : y; }
void doit()
{
    dbl l = 0;
    dbl r = 1;
    dbl lv = eqn(l);
    dbl rv=eqn(r);
    dbl ls = sgn(lv);
    dbl rs = sgn(rv);
    if (ls !=rs){
        // bisection method
        while (1){
            if (r-l < 0.00000001) break;
            dbl mid = (l+r)/2;
            dbl v = eqn(mid);
            dbl s = sgn(v);
            if (s == ls){ l=mid;ls=s; }
            if (s == rs){ r=mid;rs=s; }

        }
        printf("%.4lf\n", l);return;
    }
    
    // This part handles the case where the curve is
    // a tangent to the x-axis. Not sure whether this can happen..
int c=0;
    while (1)
    {
        l=max(0,min(l,1));
        r = min(1,r);
        if ((r-l) < 0.00000001) break;
        dbl incre = (r-l)/200;
        dbl mindiff = DBL_MAX;
        dbl v = l;
        dbl stop = min(1, r+incre);

        while (v <= stop){
            v += incre;
            dbl val = eqn(v);
            dbl diff = fabs(val);
            if (diff < mindiff){mindiff = diff; 
            l=v-incre;
            r=v+incre;}
        }
    }
    
    if (fabs(eqn(r))<0.00001){
        printf("%.4lf\n",  r);
        }
        else printf("No solution\n");
}

int main()
{
    while (1){
        int k =scanf("%lf %lf %lf %lf %lf %lf", &p,&q,&r,&s,&t,&u);
if (k!=6)break;
        doit();
    }
}
