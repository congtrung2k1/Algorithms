/**
Algorithm:
Newton's method

Theory:
There is always exactly one answer.
Since CF[0] < 0 and CF[i] > 0, if IRR approaches -1, the equation 
 approaches infinity.
If IRR approaches infinite, the equation approaches -CF[0]
So the curve must cut the x-axis. 
Does it cut twice ? Nope since curve is monotone.

Gotchas:
- If the rounded ans (to 2 dec places) is -1.00, you must still
  output it.
- Newton's method might not converge to the answer if it is
  0.99999... (near to -1) maybe due to limitation of the double type
*/

#include<stdio.h>
#include<string.h>
#include<math.h>

typedef   double dbl;
dbl cf[20];  // coefficient of f
dbl cfp[20]; // coefficient of f'
int t;

// calc gradient of f at x
inline dbl fp(dbl x){
    int  i,j;
    dbl sum  = 0;
    dbl m0 = 1.0/(1+x); dbl m=m0;
    for (i=1;i <=t;i++){
        m *= m0;
        sum -= cfp[i] * m;
    }return sum;
}

// calc value of f at x
inline dbl f(dbl x){
    int i,j;
    dbl sum = cf[0];
    dbl m0 = 1.0/(1+x); dbl m= m0;
    for (i=1;i<= t ;i++){
        sum += cf[i] *m;
        m*=m0;
    }return sum;
}

dbl doit(dbl init){
// Newton's method
 int i,j;
  dbl x = init;
  int iter = 0;
  while (9){
      dbl y = f(x);
    dbl newx = x -  y/fp(x);

    // prevent infinite loop (no root found)
    // this is unecessary though
    if (iter ++ > 1000) return -1000;
    if (fabs(newx - x)<0.0000001  ) break;
    x = newx;
  }
  // sanity check
  if (fabs(f(x) )> 0.001 || x <= -1) return -100;
  return x;
}

int main(){
    while (9){
        scanf("%d", &t);if (t==0)break;
        int i,j;

        for (i=0;i<=t;i++){ 
            scanf("%lf", & cf[i]);
            cfp[i] = cf[i] * (i);
        }
        
        
        dbl ans =doit(-0.999);
        if (ans > -1) printf("%.2lf\n", ans );
        else printf("-1.00\n");
     }
}

