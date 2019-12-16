/*
 * Algorithm:
 * Bruteforce rotation + recursive deepening
 * 
 *
 * Problem is similar to Year 2000 Gifts Small and Large
 *
 * I'm pretty sure there is a 'proper' algorithm for this.
 * 
 * Interesting fact: i accidentally print out 20 decimal places
 * but somehow the judge still accepts. Looks like they don't do a
 * straight 'diff' on your output.
 *
 * Gotchas:
 * - Problem description's output should be 14.14 not 14.15
 * */

#include<stdlib.h>
#include<stdio.h>
#include<string.h>
#include<float.h>
#include <math.h>
typedef long double dbl;
#define PI ((dbl)3.141592653589793238462383)
dbl x[103];
dbl y[103];
int n;
int casen = 1;

inline dbl pmin(dbl x,dbl y){return x<y?x:y; }
inline dbl abs(dbl x){ return x>=0?x:-x; }

#define CALC \
    dbl xmin = 0;\
    dbl xmax=0;\
    dbl ymin=0;\
    dbl ymax=0;\
    for(int i =1; i<n;i++){\
        const dbl s = sin(a);\
        const dbl c = cos(a);\
        const dbl x2 = x[i]*c - y[i]*s;\
        const dbl y2 = x[i]*s + y[i]*c;\
        if (x2<xmin)xmin=x2;\
        else if(x2>xmax)xmax=x2;\
        if(y2<ymin)ymin=y2;\
        else if (y2>ymax)ymax=y2;\
    }\
    dbl w = pmin(xmax-xmin,ymax-ymin);

void doit()
{
    dbl a=0;      // cur angle
    dbl amin = 0; // angle related to min wid
    dbl min = DBL_MAX; // min width
    dbl incre = PI / (1000000.0/n);
    dbl stop = 2*PI +incre*2;

    while(a <= stop){
        CALC
        if (w<min){min=w; amin=a;}
        a+= incre;
    }

    dbl aL, aR;
    a =amin;
    incre/=(1<<14);
    dbl prevW = min;
    do{

        a-=incre;
        CALC
        if ( w>prevW) break;
        prevW=w;
    }while(1); 
    aL=a;

    a =amin;
     prevW = min;
    do{

        a+=incre;
        CALC
        if ( w > prevW) break;
        prevW=w;
    }while(1); 
    aR=a;

    while(1){
        dbl oldmin=min;
        incre = (aR-aL)/8192.0;
        stop = aR+incre*2;
        a=aL-incre;
        while(a<=stop){
              CALC
              if (w < min){ min=w; aL = a-incre/2; aR=a+incre/2; }
              a += incre;
        }
        if (abs(oldmin-min)<0.000001)break;
    }

    printf("Case %d: %.2Lf\n",casen, min);casen++;
}

int main()
{
    while (1){
        scanf("%d", &n);
        if (n==0) break;
        int i,j;
        int xx0, yy0;
        scanf("%d%d", &xx0,&yy0);
        for(i=1;i<n;i++){
            int a,b;
            scanf("%d%d", &a,&b);
            x[i] = a-xx0;
            y[i] = b-yy0;
        }
        x[0]=y[0]=0;
        doit();
    }
}


